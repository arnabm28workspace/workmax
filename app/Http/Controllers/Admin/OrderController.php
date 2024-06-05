<?php

namespace App\Http\Controllers\Admin;

use App\Interfaces\OrderInterface;
use App\Models\Order;
use App\Models\Store;
use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    // private OrderInterface $orderRepository;

    public function __construct(OrderInterface $orderRepository)
    {
        $this->orderRepository = $orderRepository;
    }

    public function index(Request $request)
    {
        // if (!empty($request->status)) {
        //     if (!empty($request->term)) {
        //         $data = $this->orderRepository->listByStatus($request->status);
        //         $data = $this->orderRepository->searchOrder($request->term);
        //     } else {
        //         $data = $this->orderRepository->listByStatus($request->status);
        //     }
        // } else {
        //     $data = $this->orderRepository->listAll();
        // }

        $store_id = (isset($_GET['store_id']) && $_GET['store_id']!='')?$_GET['store_id']:'';
        $staff_id = (isset($_GET['staff_id']) && $_GET['staff_id']!='')?$_GET['staff_id']:'';
        $order_id = (isset($_GET['order_id']) && $_GET['order_id']!='')?$_GET['order_id']:'';
        $status = (isset($_GET['status']) && $_GET['status']!='')?$_GET['status']:'';

        $data = Order::select('orders.*')->selectRaw("(SELECT GROUP_CONCAT(op2.product_id) FROM order_products AS op2 WHERE op2.order_id = orders.id ) AS pro_ids ")->with('stores')->with('users')
                ->when($status!='', function($query) use ($status){
                    $query->where('orders.status', '=', $status);
                })
                ->when($store_id!='', function($query) use ($store_id){
                    $query->where('orders.store_id', '=', $store_id);
                })
                ->when($staff_id!='', function($query) use ($staff_id){
                    $query->where('orders.user_id', '=', $staff_id);
                })
                ->when($order_id!='', function($query) use ($order_id){
                    $query->where('orders.order_no', 'LIKE', '%'.$order_id.'%');
                })
                ->orderBy('orders.updated_at','desc')
                ->paginate(5);
                // ->get();

        $data = $data->appends(['status'=>$status,'store_id'=>$store_id,'order_id'=>$order_id,'staff_id'=>$staff_id,'page'=>$request->page]);

        $users = User::where('type','1')->get();

        $stores = Store::get();

        // dd($data);

        return view('admin.order.index', compact('data','users','stores','status'));
    }

    public function indexStatus(Request $request, $status)
    {
        $data = $this->orderRepository->listByStatus($status);
        return view('admin.order.index', compact('data'));
    }

    public function store(Request $request)
    {
        $request->validate([
            "name" => "required|string|max:255",
            "type" => "required|integer",
            "amount" => "required",
            "max_time_of_use" => "required|integer",
            "max_time_one_can_use" => "required|integer",
            "start_date" => "required",
            "end_date" => "required",
        ]);

        $params = $request->except('_token');
        $storeData = $this->orderRepository->create($params);

        if ($storeData) {
            return redirect()->route('admin.order.index');
        } else {
            return redirect()->route('admin.order.create')->withInput($request->all());
        }
    }

    public function show(Request $request, $id)
    {
        $data = Order::with('stores')->with('users')->find($id);
        // $data = $datas[0];
        //$data = $this->orderRepository->listById($id);

        // dd($data->orderProducts);
        // dd($data);
        
        return view('admin.order.detail', compact('data', 'id'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            "name" => "required|string|max:255",
            "type" => "required|integer",
            "amount" => "required",
            "max_time_of_use" => "required|integer",
            "max_time_one_can_use" => "required|integer",
            "start_date" => "required",
            "end_date" => "required",
        ]);

        $params = $request->except('_token');
        $storeData = $this->orderRepository->update($id, $params);

        if ($storeData) {
            return redirect()->route('admin.order.index');
        } else {
            return redirect()->route('admin.order.create')->withInput($request->all());
        }
    }

    public function status(Request $request, $id, $status)
    {
        $storeData = $this->orderRepository->toggle($id, $status);

        if ($storeData) {
            if($status == 3){
                Session::flash('message', 'Order cancelled successfully'); 
            }
            return redirect()->route('admin.order.index',['status'=>$status]);
        } else {
            return redirect()->route('admin.order.index',['status'=>$status]);
        }
    }

    
}