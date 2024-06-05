<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class RevenueController extends Controller
{
    //

    public function details(Request $request)
    {
        # total sales
        $total_sales = DB::table('invoice')->sum('net_price');
        # total expense
        $total_expense = DB::table('journal')->where('is_debit',1)->sum('transaction_amount');
        # net profit
        $total_staff_credit = DB::table('ledger')->where('user_type','staff')->where('is_credit', 1)->sum('transaction_amount');
        $total_staff_debit = DB::table('ledger')->where('user_type','staff')->where('is_debit', 1)->sum('transaction_amount');
        $total_staff_outstanding = ($total_staff_credit - $total_staff_debit); 

        $net_profit = (($total_sales+$total_staff_outstanding) - $total_expense);
        #revenue collected / total payment collection
        $total_payment_collection = DB::table('journal')->where('purpose', 'payment_receipt')->sum('transaction_amount');
        # net profit margin
        # Net Profit margin = Net Profit ⁄ Total revenue x 100
        $net_profit_margin = ($net_profit / ($total_payment_collection * 100));
        $net_profit_margin = number_format((float)$net_profit_margin, 6, '.', '');
        # profit in hand
        $profit_in_hand = getPercentageVal($total_payment_collection,$net_profit_margin);
        $profit_in_hand = number_format((float)$profit_in_hand, 2, '.', '');
        # reserved amount
        $reserved_amount = getPercentageVal($profit_in_hand,70);
        $reserved_amount = number_format((float)$reserved_amount, 2, '.', '');
        # withdrawable amount
        $withdrawable_amount = getPercentageVal($profit_in_hand,30);
        $withdrawable_amount = number_format((float)$withdrawable_amount, 2, '.', '');
        # partner net required amount / summation of withdraw required amount 
        $partner_required_amount = DB::table('withdrawls')->where('admin_id', Auth::user()->id)->where('is_disbursed')->sum('required_amount');
        # withdrawable amount each
        $withdrawable_amount_each = getPercentageVal($withdrawable_amount,50);
        $withdrawable_amount_each = number_format((float)$withdrawable_amount_each, 2, '.', '');
        # net partner withdrawable amount
        $withdrawable_amount_each = ($partner_required_amount + $withdrawable_amount_each);
        // dd($withdrawable_amount_each);

        $month_val = !empty($request->month_val)?$request->month_val:date('m');
        $year_val = !empty($request->year_val)?$request->year_val:date('Y');

        // $from_date = date('Y-m-01', strtotime($year_val.'-'.$month_val));
        // $to_date = date('Y-m-t', strtotime($year_val.'-'.$month_val));
        $from_date = !empty($request->from_date) ? $request->from_date : date('Y-m-01', strtotime($year_val.'-01'));
        $to_date = !empty($request->to_date) ? $request->to_date : date('Y-m-t', strtotime($year_val.'-'.$month_val));
        $bank_cash = !empty($request->bank_cash)?$request->bank_cash:'';

        $data = array();

        $getDaysFromDateRange = getDaysFromDateRange($from_date,$to_date);
        
        if($getDaysFromDateRange > 365) {
            $err_msg = "Please choose dates within 365 days";
            return  redirect()->back()->withErrors(['from_date'=> $err_msg])->withInput();
        }

        $data = DB::table('journal AS l')->select('l.*','p.voucher_no','p.payment_in','p.amount AS payment_amount','p.payment_mode','p.chq_utr_no','p.narration');


        
        if(!empty($from_date) && !empty($to_date)){
            $data = $data->whereRaw("( l.entry_date BETWEEN '".$from_date."' AND '".$to_date."')");
        } 
        
        if(!empty($bank_cash)){
            $data = $data->where('l.bank_cash', $bank_cash);
        }
        $data = $data->leftJoin('payment AS p','p.id','l.payment_id');
        $data = $data->orderBy('l.entry_date','asc');
        $data = $data->orderBy('l.updated_at','asc');  
        $data = $data->get();
        
        return view('admin.journal.index', compact('data','from_date','month_val','bank_cash','year_val','to_date','total_sales','total_staff_outstanding','total_expense','net_profit','net_profit_margin','total_payment_collection','profit_in_hand','reserved_amount','withdrawable_amount','withdrawable_amount_each'));
        
    }

    public function withdraw_form(Request $request)
    {        

        # check existing not pending request
        $checkExistPending = DB::table('withdrawls')->where('admin_id', Auth::user()->id)->where('is_disbursed', 0)->first();

        // dd($checkExistPending);

        if(!empty($checkExistPending)){
            Session::flash('message', 'You have already pending withdrawl !! Please ask to accountant to disburse'); 
            Session::flash('alert-class', 'alert-info');
            return redirect()->route('admin.revenue.index');
        }



        $partners = DB::table('admins')->select('id','name')->where('type', 1)->get()->toarray();

        # total sales
        $total_sales = DB::table('invoice')->sum('net_price');
        # total expense
        $total_expense = DB::table('journal')->where('is_debit',1)->sum('transaction_amount');
        # staff outstanding
        $total_staff_credit = DB::table('ledger')->where('user_type','staff')->where('is_credit', 1)->sum('transaction_amount');
        $total_staff_debit = DB::table('ledger')->where('user_type','staff')->where('is_debit', 1)->sum('transaction_amount');
        $total_staff_outstanding = ($total_staff_credit - $total_staff_debit); 
        # net profit
        $net_profit = (($total_sales+$total_staff_outstanding) - $total_expense);
        #revenue collected / total payment collection
        $total_payment_collection = DB::table('journal')->where('purpose', 'payment_receipt')->sum('transaction_amount');
        # net profit margin
        # Net Profit margin = Net Profit ⁄ Total revenue x 100
        $net_profit_margin = ($net_profit / ($total_payment_collection * 100));
        $net_profit_margin = number_format((float)$net_profit_margin, 6, '.', '');
        # profit in hand
        $profit_in_hand = getPercentageVal($total_payment_collection,$net_profit_margin);
        $profit_in_hand = number_format((float)$profit_in_hand, 2, '.', '');
        # reserved amount
        $reserved_amount = getPercentageVal($profit_in_hand,70);
        $reserved_amount = number_format((float)$reserved_amount, 2, '.', '');
        # withdrawable amount
        $withdrawable_amount = getPercentageVal($profit_in_hand,30);
        $withdrawable_amount = number_format((float)$withdrawable_amount, 2, '.', '');
        # withdrawable amount each
        $withdrawable_amount_each = getPercentageVal($withdrawable_amount,50);
        $withdrawable_amount_each = number_format((float)$withdrawable_amount_each, 2, '.', '');

        return view('admin.journal.withdraw', compact('partners','net_profit','net_profit_margin','profit_in_hand','reserved_amount','withdrawable_amount','withdrawable_amount_each'));
    }

    public function withdraw_partner_amount(Request $request)
    {
        $admin_id = $request->admin_id;
        $amount = $request->amount;
        $request->validate([
            'admin_id' => 'required',
            'amount' => 'required'
        ]);

        $params = $request->except('_token');
        // dd($params);
        
        /* Entry in ledger */

        // $transaction_id = time();

        // DB::table('ledger')->insert([
        //     'user_type' => 'partner',
        //     'staff_id' => 0,
        //     'store_id' => 0,
        //     'admin_id' => $admin_id,
        //     'transaction_id' => $transaction_id,
        //     'transaction_amount' => $amount,
        //     // 'last_closing_amount' => $final_closing_amount,
        //     'is_credit' => 0,
        //     'is_debit' => 1,
        //     'entry_date' => date('Y-m-d'),
        //     'purpose' => 'partner_withdrawl',
        //     'purpose_description' => "partner withdrawl"
        // ]);

        // /* Entry in journal */

        // DB::table('journal')->insert([
        //     'transaction_amount' => $request->amount,
        //     'is_credit' => 0,
        //     'is_debit' => 1,
        //     'entry_date' => date('Y-m-d'),
        //     'purpose' => 'partner_withdrawl',
        //     'purpose_description' => "partner withdrawl",
        //     'purpose_id' => $transaction_id
        // ]);

        /* Entry in withdrawls */
        $required_amount = ($params['withdrawable_amount'] - $params['amount']);
        // dd($required_amount);

        DB::table('withdrawls')->insert([
            'admin_id' => $params['admin_id'],
            'entry_date' => $params['entry_date'],
            'withdrawl_amount' => $params['amount'],
            'reserved_amount' => $params['reserved_amount'],
            'withdrawable_amount' => $params['withdrawable_amount'],
            'required_amount' => $required_amount,
            'net_profit' => $params['net_profit'],
            'net_profit_margin' => $params['net_profit_margin'],
            'profit_in_hand' => $params['profit_in_hand']
        ]);

        Session::flash('message', 'Withdraw request submitted successfully'); 
        return redirect()->route('admin.revenue.withdrawls');


        
    }

    public function withdrawls(Request $request)
    {
        $admin_id = Auth::user()->id;
        $auth_type = Auth::user()->type;

        // echo $auth_type;
        $withdrawls = DB::table('withdrawls AS w')->select('w.*','a.name','a.email');

        if($auth_type == 1){
            $withdrawls = $withdrawls->where('w.admin_id',$admin_id);
        }
        
        $withdrawls = $withdrawls->leftJoin('admins AS a','a.id','w.admin_id')->orderBy('w.id','desc')->paginate(5);
        // dd($withdrawls);
        return view('admin.journal.withdrawls', compact('withdrawls','auth_type'));
    }

    public function delete_request($id)
    {
        # delete not disbursed withdraw request...
        $withdrawls = DB::table('withdrawls')->find($id);
        if(!empty($withdrawls)){
            if(empty($withdrawls->is_disbursed)){
                DB::table('withdrawls')->where('id',$id)->delete();
                Session::flash('message', 'Delete successfully'); 
                return redirect()->route('admin.revenue.withdrawls');
            } else {
                Session::flash('message', 'Cannot delete ! Amount has been disbursed'); 
                Session::flash('alert-class', 'alert-info');
                return redirect()->route('admin.revenue.index');
            }
        } else {
            Session::flash('message', 'No data found'); 
            Session::flash('alert-class', 'alert-info');
            return redirect()->route('admin.revenue.index');
        }
    }
}
