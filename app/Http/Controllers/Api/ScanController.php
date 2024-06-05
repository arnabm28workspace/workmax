<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class ScanController extends Controller
{
    //
    public function box(Request $request): JsonResponse
    {
        
        $validator = Validator::make($request->all(), [
            'barcode_no' => ['required'],
            'scanned_weight_val' => ['required']
        ]);

        $params = $request->except('_token');

        if (!$validator->fails()) {

            $barcode_no = $params['barcode_no'];
            $scanned_weight_val = $params['scanned_weight_val'];

            $checkBarcode = DB::table('purchase_order_boxes')->where('barcode_no',$barcode_no)->first();

            if(!empty($checkBarcode)){
                if(empty($checkBarcode->is_scanned)){
                    $po_weight_val = $checkBarcode->po_weight_val;
                    $approxUpWeight = ($po_weight_val + 50);
                    $approxDownWeight = ($po_weight_val - 50);

                    // echo "scanned_weight_val:- ".$scanned_weight_val."<br/>";
                    // echo "po_weight_val:- ".$po_weight_val."<br/>";
                    // echo "approxDownWeight:- ".$approxDownWeight; die;

                    if (($scanned_weight_val <= $approxUpWeight && $scanned_weight_val >= $approxDownWeight) ) {
                        // die('Ok');
                        DB::table('purchase_order_boxes')->where('barcode_no',$barcode_no)->update(['is_scanned'=>1, 'scanned_weight_val' => $scanned_weight_val, 'updated_at'=>date('Y-m-d H:i:s')]);

                        return response()->json(
                            [
                                'error' => false,
                                'status' => 200,
                                'message' => 'Scanned successfully',
                                'data' => (object)[]
                            ]
                        );
                    } else {
                        // die('Mismatched');
                        return response()->json(
                            [
                                'error' => true,
                                'status' => 200,
                                'message' => 'Mismatched weight.',
                                'data' => (object)[]
                            ]
                        );
                    }
                }else{
                    return response()->json(
                        [
                            'error' => true,
                            'status' => 200,
                            'message' => 'Already scanned',
                            'data' => (object)[]
                        ]
                    );
                }
            }else{
                return response()->json(
                    [
                        'error' => true,
                        'status' => 200,
                        'message' => 'No barcode found',
                        'data' => (object)[]
                    ]
                );
            }
            
        } else {
            return response()->json(
                [
                    'status' => 400, 
                    'message' => $validator->errors()->first()
                ]
            );
        }
        
    }

    public function stockout(Request $request): JsonResponse
    {
        
        $validator = Validator::make($request->all(), [
            'barcode_no' => ['required'],
            'stock_out_weight_val' => ['required']
        ]);

        $params = $request->except('_token');

        if (!$validator->fails()) {

            $barcode_no = $params['barcode_no'];
            $stock_out_weight_val = $params['stock_out_weight_val'];

            $checkBarcode = DB::table('stock_boxes')->where('barcode_no',$barcode_no)->first();

            if(!empty($checkBarcode)){
                if(!empty($checkBarcode->is_scanned) && empty($checkBarcode->scan_no)){

                    $stock_in_weight_val = $checkBarcode->stock_in_weight_val;
                    $approxUpWeight = ($stock_in_weight_val + 50);
                    $approxDownWeight = ($stock_in_weight_val - 50);

                    if (($stock_out_weight_val <= $approxUpWeight && $stock_out_weight_val >= $approxDownWeight) ) {

                        DB::table('stock_boxes')->where('barcode_no',$barcode_no)->update(['scan_no'=>$barcode_no, 'stock_out_weight_val' => $stock_out_weight_val, 'updated_at'=>date('Y-m-d H:i:s')]);

                        DB::table('packing_slip_boxes')->where('barcode_no',$barcode_no)->update(['is_disbursed' => 1]);

                        return response()->json(
                            [
                                'error' => false,
                                'status' => 200,
                                'message' => 'Scanned successfully',
                                'data' => (object)[]
                            ]
                        );

                    } else {
                        return response()->json(
                            [
                                'error' => true,
                                'status' => 200,
                                'message' => 'Mismatched weight.',
                                'data' => (object)[]
                            ]
                        );
                    }

                }else{
                    return response()->json(
                        [
                            'error' => true,
                            'status' => 200,
                            'message' => 'Not released from inventory',
                            'data' => (object)[]
                        ]
                    );
                }
            }else{
                return response()->json(
                    [
                        'error' => true,
                        'status' => 200,
                        'message' => 'No barcode found',
                        'data' => (object)[]
                    ]
                );
            }
            
        } else {
            return response()->json(
                [
                    'status' => 400, 
                    'message' => $validator->errors()->first()
                ]
            );
        }
        
    }
}
