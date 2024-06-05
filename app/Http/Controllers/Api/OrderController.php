<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Interfaces\OrderInterface;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use Illuminate\Support\Carbon;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function __construct(OrderInterface $orderRepository)
    {
        $this->orderRepository = $orderRepository;
    }
    
    public function view($userId,$storeId): JsonResponse
    {

        $order = Order::where('user_id',$userId)->where('store_id',$storeId)->orderBy('id','desc')->take(3)->get();
        // $order = $this->orderRepository->listByuserId($userId);

        return response()->json(['error'=>false, 'resp'=>'Order data fetched successfully','data'=>$order]);
    }
    

    public function placeorder(Request $request): JsonResponse
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'user_id' => ['required', 'integer', 'min:1', 'exists:users,id'],
            'store_id' => ['required', 'integer', 'min:1', 'exists:stores,id'],
            'comment' => ['string'],
            'order_location' => ['string'],
            'order_lat' => ['string'],
            'order_lng' => ['string']
        ]);
        $params = $request->except('_token');
        
        if (!$validator->fails()) {
            
            $checkCart = Cart::where('user_id', $params['user_id'])->first();

            // dd($checkCart);

            if(empty($checkCart)){
                // die('Hello');
                return response()->json(
                    [
                        'error' => true,
                        'message' => "No items found in cart",
                        'data' => (object) []
                    ],
                    200
                );
            }

            return response()->json(
                [
                    'data' => $this->orderRepository->placeOrder($params)
                ],
                Response::HTTP_CREATED
            );
        } else {
            return response()->json(['status' => 400, 'message' => $validator->errors()->first()]);
        }
        
        
    }


       
}
