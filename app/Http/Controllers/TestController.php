<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use DateTime;

class TestController extends Controller
{
    //
    public function save(Request $request)
    {
        # code...
        $data = DB::table('ledger AS l')->select('l.*','p.voucher_no','p.bank_cash AS p_bank_cash')->leftJoin('payment AS p', 'p.id','l.payment_id')->where('l.payment_id', '!=', 0)->get();

        foreach($data as $d){
            // DB::table('ledger')->where('id',$d->id)->update(['bank_cash'=>$d->p_bank_cash]);
            echo "Ledger bank cash updated"; echo "<br/>";
        }

        // dd($data);

        $journal = DB::table('journal AS l')->select('l.*','p.voucher_no','p.bank_cash AS p_bank_cash')->leftJoin('payment AS p', 'p.id','l.payment_id')->where('l.payment_id', '!=', 0)->get();

        foreach($journal as $d){
            // DB::table('journal')->where('id',$d->id)->update(['bank_cash'=>$d->p_bank_cash]);
            echo "Journal bank cash updated"; echo "<br/>";
        }

        // dd($journal);

       
        
    }

    public function invoicePayments(Request $request)
    {
        # code...

        $voucher_no = !empty($request->voucher_no)?$request->voucher_no:'';
        $payment_amount = !empty($request->payment_amount)?$request->payment_amount:'';
        $user_id = !empty($request->user_id)?$request->store_id:'';

        // echo $voucher_no; die;

        if((!empty($voucher_no)) || (!empty($paid_amount)) || (!empty($store_id))){
            // echo $voucher_no; die;
            $check_invoice_payments = DB::table('invoice_payments')->where('voucher_no','=',$voucher_no)->get()->toarray();

            if(empty($check_invoice_payments)){
                
                // die('No invoice payments found');
                $amount_after_settlement = $payment_amount;
                /* Check store unpaid invoices */
                $invoice = DB::table('invoice')->where('store_id',$store_id)->where('is_paid',0)->get();
    
                $sum_inv_amount = 0;
                foreach($invoice as $inv){
                    
                    $amount = $inv->required_payment_amount;
                    $sum_inv_amount += $amount;
                    if($amount_after_settlement>$amount && $amount_after_settlement>0){
                        $amount_after_settlement=$amount_after_settlement-$amount;
                        
                        DB::table('invoice')->where('id',$inv->id)->update([
                            'required_payment_amount'=>'',
                            'payment_status' => 2,
                            'is_paid'=>1
                        ]);
    
                        DB::table('invoice_payments')->insert([
                            'invoice_id' => $inv->id,
                            'invoice_no' => $inv->invoice_no,
                            'voucher_no' => $voucher_no,
                            'invoice_amount' => $inv->net_price,
                            'vouchar_amount' => $payment_amount,
                            'paid_amount' => $amount,
                            'rest_amount' => ''
                        ]);
                    }else if($amount_after_settlement<$amount && $amount_after_settlement>0){
                        
                        $rest_payment_amount = ($amount - $amount_after_settlement);
                        
                        DB::table('invoice')->where('id',$inv->id)->update([
                            'required_payment_amount'=>$rest_payment_amount,
                            'payment_status' => 1,
                            'is_paid'=>0
                        ]);
                        DB::table('invoice_payments')->insert([
                            'invoice_id' => $inv->id,
                            'invoice_no' => $inv->invoice_no,
                            'voucher_no' => $voucher_no,
                            'invoice_amount' => $inv->net_price,
                            'vouchar_amount' => $payment_amount,
                            'paid_amount' => $amount_after_settlement,
                            'rest_amount' => $rest_payment_amount
                        ]);
    
                        $amount_after_settlement = 0;
                                            
                    }else if($amount_after_settlement==0){
                        
                    }
                }
                
                
            }else{
                
            }
        }else{
            echo 'Please add voucher_no , payment_amount and store_id as query parameter';
        }
    }

    public function staffCommission(Request $request)
    {
        # save unpaid invoice's payments
        die('Hello');

        # Get dynamic percentage value from app settings
        $app_settings = DB::table('app_settings')->find(1);
        $staff_payment_incentive = $app_settings->staff_payment_incentive;        
        $order_collector_commission = $app_settings->order_collector_commission;
        $payment_collector_commission = $app_settings->payment_collector_commission;

        /* +++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

        $voucher_no = !empty($request->voucher_no)?$request->voucher_no:'';
        if(!empty($voucher_no)){
            $payment = DB::table('payment')->where('voucher_no',$voucher_no)->first();
            $payment_collector_id = $payment->staff_id;
            $payment_date = $payment->payment_date;
            // echo "payment_collector_id : ".$payment_collector_id."<br/>";
            // die;
            $paid_invoices = DB::table('invoice_payments AS ip')->select('ip.*','invoice.order_id','orders.user_id')->leftJoin('invoice', 'invoice.id','ip.invoice_id')->leftJoin('orders', 'orders.id','invoice.order_id')->where('ip.rest_amount', 0)->where('ip.voucher_no',$voucher_no)->where('ip.is_commisionable', 0)->get()->toarray();

            dd($paid_invoices);

            foreach($paid_invoices as $inv){
                $order_creator_id = $inv->user_id;
                $paid_amount = $inv->paid_amount;

                $commission_amount = getPercentageVal($staff_payment_incentive,$paid_amount);
                $commission_amount = number_format((float)$commission_amount, 2, '.', '');

                // echo "commission_amount : ".$commission_amount."<br/>";
                $order_collector_commission_amount = getPercentageVal($order_collector_commission,$commission_amount);
                $order_collector_commission_amount = number_format((float)$order_collector_commission_amount, 2, '.', '');

                $payment_collector_commission_amount = getPercentageVal($payment_collector_commission,$commission_amount);
                $payment_collector_commission_amount = number_format((float)$payment_collector_commission_amount, 2, '.', '');


                // echo "order_collector_commission_amount : ".$order_collector_commission_amount."<br/>";
                // echo "payment_collector_commission_amount : ".$payment_collector_commission_amount."<br/>";

                /* +++++++++++++++++++++++++++++++++++++++++++++++++++++ */

                /* Order creator commission entry */
                # staff_commision entry
                DB::table('staff_commision')->insert([
                    'staff_id' => $order_creator_id,
                    'paid_as' => 'order_creator',
                    'vouchar_no' => $voucher_no,
                    'order_id' => $inv->order_id,
                    'invoice_id' => $inv->invoice_id,
                    'invoice_payment_id' => $inv->id,
                    'commission_percentage_val' => $order_collector_commission,
                    'commission_amount' => $order_collector_commission_amount                
                ]);

                

                # ledger entry                 
                $order_creator_ledger_transaction_no = time();
                DB::table('ledger')->insert([
                    'user_type' => 'staff',
                    'staff_id' => $order_creator_id,
                    'transaction_id' => $order_creator_ledger_transaction_no,
                    'transaction_amount' => $order_collector_commission_amount,
                    'is_credit' => 1,
                    'entry_date' => $payment_date,
                    'purpose' => 'payment_collection_commission',
                    'purpose_description' => 'Sales order payment commission for order creator'
                ]);
                

                /* +++++++++++++++++++++++++++++++++++++++++++++++++++++ */

                /* Payment collector commission entry */

                DB::table('staff_commision')->insert([
                    'staff_id' => $payment_collector_id,
                    'paid_as' => 'payment_collector',
                    'vouchar_no' => $voucher_no,
                    'order_id' => $inv->order_id,
                    'invoice_id' => $inv->invoice_id,
                    'invoice_payment_id' => $inv->id,
                    'commission_percentage_val' => $payment_collector_commission,
                    'commission_amount' => $payment_collector_commission_amount                
                ]);

               
                # ledger entry                
                /* Getting last closing amount for order creator staff */
                $payment_collector_ledger_transaction_no = time();
                DB::table('ledger')->insert([
                    'user_type' => 'staff',
                    'staff_id' => $payment_collector_id,
                    'transaction_id' => $payment_collector_ledger_transaction_no,
                    'transaction_amount' => $payment_collector_commission_amount,
                    'is_credit' => 1,
                    'entry_date' => $payment_date,
                    'purpose' => 'payment_collection_commission',
                    'purpose_description' => 'Sales order payment commission for payment collector'
                ]);
                

                /* +++++++++++++++++++++++++++++++++++++++++++++++++++++ */

                /* Make invice payment staff commissionable */

                DB::table('invoice_payments')->where('id',$inv->id)->update([
                    'is_commisionable' => 1,
                    'updated_at' => date('Y-m-d H:i:s')
                ]);

                /* +++++++++++++++++++++++++++++++++++++++++++++++++++++ */

            }
            // dd($paid_invoices);
        }else{
            echo 'Please add voucher_no in query param';
        }
        
    }

    public function saveStoreVisitLedger(Request $request)
    {
        $cost_price = "150";
        $gst_val = "18";
        $getGSTAmount = getGSTAmount($cost_price,$gst_val);
        dd($getGSTAmount);


        die();
        $transaction_id = !empty($request->transaction_id)?$request->transaction_id:'';
        // echo $transaction_id; die;
        if(!empty($transaction_id)){
            $ledger = DB::table('ledger')->where('transaction_id',$transaction_id)->first();
            
            if(!empty($ledger)){
                DB::table('ledger')->where('transaction_id',$transaction_id)->delete();
                DB::table('payment')->where('voucher_no',$transaction_id)->delete();
                echo "Delete records for Transaction Id:- ".$transaction_id;
            }
            $journal = DB::table('journal')->where('purpose_id',$transaction_id)->first();
            if(!empty($journal)){
                DB::table('journal')->where('purpose_id',$transaction_id)->delete();
                DB::table('payment')->where('voucher_no',$transaction_id)->delete();
                echo "Delete records for Transaction Id:- ".$transaction_id;
            }
        }
    }

    public function chatSendMsg(Request $request)
    {
        // die('Hi');
        // $url =  url('/callback/test.txt');
        $json_body = json_encode($request->all());
        // $json_body = "Hello World. Testing!";
        $url = public_path("/callback/test.txt");
        // echo $url; die;
        $file = fopen($url,"w");
        fwrite($file, $json_body);
        fclose($file);
    }
}
