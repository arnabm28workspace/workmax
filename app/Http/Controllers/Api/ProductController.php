<?php

namespace App\Http\Controllers\Api;

use App\Interfaces\ProductInterface;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;


class ProductController extends Controller
{
    // private ProductInterface $productRepository;

    public function __construct(ProductInterface $productRepository)
    {
        $this->productRepository = $productRepository;
    }

    /**
     * List all products
     * Modified by Arnab
     */
    public function list(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [            
            'user_id' => [ 'integer', 'min:1', 'exists:users,id'],
            'store_id' => [ 'integer', 'min:1', 'exists:stores,id'],
            'search' => ['string'],
            'take' => ['integer'],
            'page' => ['integer']
        ]);

        $params = $request->except('_token');

        // $take = !empty($params['take'])?$params['take']:100;
        // $page = !empty($params['page'])?$params['page']:0;
        // $skip = ($take*$page);
        $store_id = !empty($params['store_id'])?$params['store_id']:'';
        $user_id = !empty($params['user_id'])?$params['user_id']:'';
        $search = !empty($params['search'])?$params['search']:'';

        $products = DB::table('products')->select('id','name','image','threshold_price','sell_price','cost_price','pcs','product_sales_price_threshold_percentage');
        $products = $products->where('name', 'LIKE', '%'.$search.'%');
        $products = $products->where('status',1)
                    // ->take($take)->skip($skip)
                    ->get()->toarray();

        // dd($products);
            
        
        if(!empty($products)){
            foreach($products as $p){
                $p->is_requested = 0;
                if(!empty($store_id) && !empty($user_id)){
                    $checkRequestExists = DB::table('product_threshold_request AS ptr')->where('ptr.store_id',$store_id)->where('ptr.user_id',$user_id)->where('ptr.is_approved',1)->where('ptr.expired_at','>=', date('Y-m-d H:i:s'))->get()->toarray();
                    
                    if(!empty($checkRequestExists)){
                        foreach($checkRequestExists as $reqProd){
                            // echo $p->id; die;
                            if($p->id == $reqProd->product_id){
                                
                                $p->sell_price = $reqProd->price;
                                $p->is_requested = 1;
                            }
                        }
                    }
                }                
                
            }
        }

        
        
        return response()->json(['error'=>false, 'resp'=>'Product data fetched successfully','data'=>$products]);

    }
      

}
