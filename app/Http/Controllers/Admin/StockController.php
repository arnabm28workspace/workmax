<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Interfaces\PurchaseOrderInterface;
use App\Models\PurchaseOrder;
use Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class StockController extends Controller
{
    //
    public function __construct(PurchaseOrderInterface $PurchaseOrderRepository)
    {
        $this->PurchaseOrderRepository = $PurchaseOrderRepository;
    }

    /*public function index(Request $request,$product_id=0)
    {
        $data = $this->PurchaseOrderRepository->productStock($product_id);
        return view('admin.stock.list', compact('data'));
    }

    public function details($product_id)
    {
        # all boxes of a product...
        $data = $this->PurchaseOrderRepository->productStock($product_id);
        return view('admin.stock.view', compact('data'));
    }*/

    public function listgrn(Request $request)
    {
        # code...
        // die('Hi');
        $term = !empty($request->term)?$request->term:'';
        $data = DB::table('purchase_orders AS po')->select('po.*','stock.grn_no','stock.po_unique_id')->selectRaw('SUM(po.total_price) as amount, sum(po.qty) AS total_qty, SUM(po.pcs) AS total_pcs,(SELECT COUNT(id) FROM purchase_order_archived_boxes WHERE purchase_order_archived_boxes.po_uniquie_id = po.unique_id) AS total_archived_qty , (SELECT GROUP_CONCAT(po2.product_id) FROM purchase_orders AS po2 WHERE po2.unique_id = po.unique_id ) AS pro_ids , (SELECT COUNT(id) FROM purchase_order_boxes WHERE purchase_order_boxes.po_uniquie_id = po.unique_id AND purchase_order_boxes.is_scanned = 1) AS scanned_boxes ')->leftJoin('stock','stock.po_unique_id','po.unique_id')->groupBy('po.unique_id')->where('po.status', 2)->paginate(5);
        // $data = DB::table('stock')->select('stock.*')->paginate(5);
        // dd($data);
        $data = $data->appends(['term'=>$term,'page'=>$request->page]);
        $total = DB::table('stock')->count();
        return view('admin.grn.index', compact('data','term','total'));
    }
}
