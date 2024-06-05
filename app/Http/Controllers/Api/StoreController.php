<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Interfaces\StoreInterface;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Models\PaymentCollection;

class StoreController extends Controller
{
    public function __construct(StoreInterface $storeRepository)
    {
        $this->storeRepository = $storeRepository;
    }
    /**
     * This method is for show store list
     *
     */

    public function list(Request $request): JsonResponse
    {
        $stores = $this->storeRepository->listAll();

        if ($stores) {
            $storesCustom = [];
            foreach($stores as $storeKey => $storeValue) {
                $storesCustom[] = [
                    'id' => $storeValue->id,
                    'store_name'=>$storeValue->store_name,
                    'contact'=>$storeValue->contact,
                    'whatsapp'=>$storeValue->whatsapp,
                    'email'=>$storeValue->email,
                    // 'address'=>$storeValue->address,
                    // 'lat'=>$storeValue->lat,
                    // 'lng'=>$storeValue->lng,
                    // 'state'=>$storeValue->state,
                    // 'city'=>$storeValue->city,
                    // 'pin'=>$storeValue->pin
                    'address_outstation'=>$storeValue->address_outstation,
                    'billing_address'=>$storeValue->billing_address,
                    'billing_landmark'=>$storeValue->billing_landmark,
                    'billing_state'=>$storeValue->billing_state,
                    'billing_city'=>$storeValue->billing_city,
                    'billing_pin'=>$storeValue->billing_pin,
                    'billing_country'=>$storeValue->billing_country,
                    'is_billing_shipping_same'=>$storeValue->is_billing_shipping_same,
                    'shipping_address'=>$storeValue->shipping_address,
                    'shipping_landmark'=>$storeValue->shipping_landmark,
                    'shipping_state'=>$storeValue->shipping_state,
                    'shipping_city'=>$storeValue->shipping_city,
                    'shipping_pin'=>$storeValue->shipping_pin,
                    'shipping_country'=>$storeValue->shipping_country,
                    'gst_number'=>$storeValue->gst_number,
                    'gst_file'=>asset($storeValue->gst_file),
                    'credit_limit'=>$storeValue->credit_limit,
                    'credit_days'=>$storeValue->credit_days
                ];
            }

            return response()->json(['error'=>false, 'resp'=>'Store data fetched successfully','data'=>$storesCustom]);
        } else {
            return response()->json(['error' => true, 'resp' => 'Something happened']);
        }
    }

    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            "created_from" => "required|string|in:staff",   
            "created_by" => "required|numeric|exists:users,id",   
            "store_name" => "required|string|max:255",            
            "whatsapp"=>"required|unique:stores|max:10",
            "email" => "nullable|string",
            // "gst_number" => "required",
            "shipping_address" => "required|string",
            "shipping_landmark" => "required|string",
            "shipping_state" => "required|string",
            "shipping_city" => "required|string",
            "shipping_pin" => "required|string",
            "shipping_country" => "required|string",
            "billing_address" => "required|string",
            "billing_landmark" => "required|string",
            "billing_state" => "required|string",
            "billing_city" => "required|string",
            "billing_pin" => "required|string",
            "billing_country" => "required|string",
            // "gst_file" =>"nullable|mimes:jpg,jpeg,png,svg,gif|max:10000000"
        ]);
        
        $params = $request->except('_token');
        
        if (!$validator->fails()) {
            // dd($params);
            $data = $this->storeRepository->create($params);
            return response()->json(
                [
                    'status' => 201, 
                    'error' => false, 
                    'message' => 'Store Created', 
                    'data' => $data
                ], 
                Response::HTTP_CREATED
            );

        } else {
            return response()->json(
                [
                    'status' => 400, 
                    'error' => true, 
                    'message' => 'Validation', 
                    'data' => $validator->errors()->first()
                ]
            );
        }

    }

    public function noorder(Request $request)
    {
        // $newDetails = $request->only([
        //     'user_id', 'start_location', 'end_location', 'start_lat', 'end_lat', 'start_lng', 'end_lng', 'start_date', 'end_date', 'start_time', 'end_time'
        // ]);

        $data = $request->only([
            'user_id', 'store_id', 'comment', 'lat','lng','location'
        ]);
        //dd($data);
        $stores = $this->storeRepository->noorderreasonupdate($data);
         //dd($stores);
        return response()->json(['error'=>false, 'resp'=>'No order Reason data created successfully','data'=>$stores]);
    }

    
    public function taskStoreList($id): JsonResponse{
        
        $start_date = date("Y-m-d", strtotime("last sunday"));
        $end_date = date("Y-m-d", strtotime("next saturday"));

        $tasks = DB::table('tasks')->where('user_id',$id)->where('start_date',$start_date)->where('end_date',$end_date)->first();

        $stores = array();
        if(!empty($tasks)){
            $stores = DB::table('task_details AS td')->select('stores.id','stores.store_name','stores.contact','stores.email','td.no_of_visit','td.comment')->leftJoin('stores', 'stores.id','td.store_id')->where('td.task_id',$tasks->id)->get()->toarray();
        }

        return response()->json(['error'=>false, 'resp'=>'store list successfully','data'=>$stores]);
    }

    public function invoices(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(),[
            'id' => ['required', 'integer', 'min:1', 'exists:stores,id'],
            'take' => ['integer'],
            'page' => ['integer']
        ]);

        $params = $request->except('_token');

        if(!$validator->fails()){
            $id = $params['id'];
            // $take = !empty($params['take'])?$params['take']:100;
            // $page = !empty($params['page'])?$params['page']:0;
            // $skip = ($take*$page);
            
            $invoices = DB::table('invoice AS i')
                        ->select('i.id','i.invoice_no','i.net_price','i.order_no','i.slip_no','i.payment_status','i.required_payment_amount')
                        ->where('i.store_id', $id)
                        ->orderBy('i.id','desc')
                        // ->skip($skip)->take($take)
                        ->get()->toarray();

            # last three payments

            $payment_collections = PaymentCollection::select('id','user_id','store_id','collection_amount','payment_type','bank_name','cheque_number','cheque_date','is_ledger_added')->where('store_id',$id)->orderBy('id','desc')->take(3)->get()->toarray();

            # unpaid amount

            $store_unpaid_amount = DB::table('invoice')->where('store_id',$id)->where('is_paid',0)->sum('required_payment_amount');
            
            return response()->json(['error'=>false,'message'=>"Store invoices", 'data'=> array('store_unpaid_amount'=>$store_unpaid_amount, 'payments'=>$payment_collections, 'invoices'=>$invoices) ],200);
        } else {
            return response()->json(['status' => 400, 'message' => $validator->errors()->first()],400);
        }
               
                
    }

}
