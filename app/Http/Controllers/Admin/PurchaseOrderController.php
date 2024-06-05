<?php

namespace App\Http\Controllers\Admin;

use App\Interfaces\PurchaseOrderInterface;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PurchaseOrder;
use App\Models\Product;
use App\Models\Supplier;
use Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class PurchaseOrderController extends Controller
{
    // public PurchaseOrderInterface $PurchaseOrderRepository;
    public function __construct(PurchaseOrderInterface $PurchaseOrderRepository)
    {
        $this->PurchaseOrderRepository = $PurchaseOrderRepository;
    }

    public function index(Request $request)
    {
        $type = !empty($request->type)?$request->type:'po';
        $term = !empty($request->term)?$request->term:'';
        
        $data = PurchaseOrder::groupBy('unique_id')
                        ->selectRaw('*, sum(total_price) as amount, sum(qty) AS total_qty,(SELECT COUNT(id) FROM purchase_order_archived_boxes WHERE purchase_order_archived_boxes.po_uniquie_id = purchase_orders.unique_id) AS total_archived_qty , (SELECT GROUP_CONCAT(po2.product_id) FROM purchase_orders AS po2 WHERE po2.unique_id = purchase_orders.unique_id ) AS pro_ids , (SELECT COUNT(id) FROM purchase_order_boxes WHERE purchase_order_boxes.po_uniquie_id = purchase_orders.unique_id AND purchase_order_boxes.is_scanned = 1) AS scanned_boxes , (SELECT SUM(purchase_orders.pcs * purchase_orders.qty)) AS total_pcs ')->where('unique_id','LIKE','%'.$term.'%');

        $status = 1;
        if($type == 'po'){                                    
            $data = $data->where('status', 1);
            $status = 1;
        } else if ($type == 'grn') {            
            $data = $data->where('status', 2);
            $status = 2;
        }
        $data = $data->orderBy('id','desc')->paginate(5);

        $data = $data->appends(['term'=>$term,'page'=>$request->page,'type'=>$type]);
        $total = PurchaseOrder::distinct('unique_id')->where('status',$status)->count();
        // echo $total; die;
        // dd($data);
        return view('admin.purchaseorder.index', compact('data','term','total','type'));
    }

    public function create(Request $request,$supplier_id=0)
    {
        $products = $supplier_details = array();        
        $products = DB::table('products')->select('id','name')->where('status', 1)->orderBy('name','asc')->get();
        
        $suppliers = Supplier::where('status',1)->get();
        if(!empty($supplier_id)){
            $supplier_details = Supplier::find($supplier_id);
        }
        // dd($suppliers);
        $app_settings = DB::table('app_settings')->find(1);
        return view('admin.purchaseorder.create', compact('products', 'suppliers','app_settings','supplier_details','supplier_id'));
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'supplier_id' => 'required',
            'total_price.*' => 'required|not_in:0'
        ],[
            'supplier_id.required' => "Please select a supplier",
            'total_price.required' => "Total price required",
            "total_price.not_in" => "Total price required"
        ]);

        // dd($request->old);

        $params = $request->except('_token');

        // dd($params);

        foreach(array_count_values($params['product']) as $val => $c){
            if($c > 1){
                $err_msg = "Same product is exist";
                return redirect()->route('admin.purchaseorder.create', $request->supplier_id)->withErrors([ 'supplier_id'=> $err_msg ])->withInput($request->all());
            }
    
        }

        $storeData = $this->PurchaseOrderRepository->create($params);
        
        if ($storeData) {
            Session::flash('message', 'Purchase order created successfully');
            return redirect()->route('admin.purchaseorder.index', ['type'=>'po']);
        } else {
            return redirect()->route('admin.purchaseorder.create')->withInput($request->all());
        }
    }

    public function show(Request $request, $unique_id)
    {
        $code_html_arr = array();
        $data = $this->PurchaseOrderRepository->listById($unique_id);
        // dd($data);

        $purchase_order_boxes = DB::table('purchase_order_boxes')->where('po_uniquie_id',$unique_id)->take(1)->get()->toarray();

        $total_po_price = PurchaseOrder::where('unique_id',$unique_id)->sum('total_price');

        if(!empty($purchase_order_boxes)){
            foreach($purchase_order_boxes as $pob){
                $code_html_arr[] = $pob->code_html;
            }
        }
        // die($total_po_price);
        return view('admin.purchaseorder.detail', compact('data','code_html_arr','unique_id','total_po_price'));
    }

    public function barcodes($unique_id)
    {
        $code_html_arr = array();
        $purchase_order_boxes = DB::table('purchase_order_boxes')->where('po_uniquie_id',$unique_id)->get()->toarray();

        // if(!empty($purchase_order_boxes)){
        //     foreach($purchase_order_boxes as $pob){
        //         $code_html_arr[] = $pob->code_html;
        //     }
        // }

        return view('admin.purchaseorder.barcode', compact('purchase_order_boxes','unique_id'));
    }

    public function edit(Request $request, $unique_id)
    {
        $data = $this->PurchaseOrderRepository->listById($unique_id);
        // $products = $this->PurchaseOrderRepository->productList();
        
        $suppliers = $this->PurchaseOrderRepository->supplierList();
        $supplier_details = Supplier::find($data[0]->supplier_id);

        // dd($data);
        // echo $data[0]->product->name; die;
        // dd($data[0]->supplier);
        
        $products = DB::table('products')->where('status',1)->orderBy('name','asc')->get();
        return view('admin.purchaseorder.edit', compact('data', 'products', 'supplier_details'));
    }

    public function update(Request $request)
    {
        // dd($request->all());
        $data = $request->except('_token');
        // dd($data);
        $storeData = $this->PurchaseOrderRepository->update($data);
        // dd($storeData);
        if ($storeData) {
            Session::flash('message', 'Purchase order updated successfully');
            return redirect()->route('admin.purchaseorder.index', ['type'=>'po']);
        } else {
            return redirect()->route('admin.purchaseorder.edit')->withInput($request->all());
        }
    }

    public function bulkSuspend(Request $request)
    {
        // die('h');
        // print_r($request->suspend_check);
        $data = $this->PurchaseOrderRepository->bulkSuspend($request->suspend_check);  

        if($data){
            return redirect()->route('admin.purchaseorder.index', ['type'=>'po']);
        }else{
            return redirect()->route('admin.purchaseorder.index', ['type'=>'po']);
        }
    }

    
    public function showboxes($unique_id,$product_id=0)
    {
        $code_html_arr = array();
        $data = $this->PurchaseOrderRepository->showboxes($unique_id,$product_id);
        if(!empty($purchase_order_boxes)){
            foreach($purchase_order_boxes as $pob){
                $code_html_arr[] = $pob->code_html;
            }
        }
        return view('admin.purchaseorder.showboxes', compact('data','unique_id','code_html_arr'));
    }

    

    public function grn($unique_id)
    {
        $data = $this->PurchaseOrderRepository->showProductBoxes($unique_id);
        // dd($data);
        $total_po_price = PurchaseOrder::where('unique_id',$unique_id)->sum('total_price');
        
        return view('admin.purchaseorder.grn', compact('data','unique_id','total_po_price'));
    }

    public function addbox($unique_id,$product_id)
    {
        $data = $this->PurchaseOrderRepository->addBox($unique_id,$product_id);

        if($data){
            Session::flash('message', 'New carton added suceesfully'); 
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }else{
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }
    }

    public function deletebox($unique_id,$product_id,$barcode_no)
    {
        $data = $this->PurchaseOrderRepository->deleteBox($unique_id,$product_id,$barcode_no);

        if($data){
            Session::flash('message', 'Box '.$barcode_no.' is deleted suceesfully'); 
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }else{
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }
    }

    public function archiveBox($unique_id,$product_id,$barcode_no)
    {
        # remove box and archive box to another place ...
        $data = $this->PurchaseOrderRepository->archiveBox($unique_id,$product_id,$barcode_no);

        if($data){
            Session::flash('message', 'Carton '.$barcode_no.' is archived suceesfully'); 
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }else{
            return redirect()->route('admin.purchaseorder.grn', $unique_id);
        }

    }

    public function archivedBoxes($unique_id)
    {
        # code...
        $data = DB::table('purchase_order_archived_boxes AS poab')->select('poab.*','products.name AS pro_name','purchase_orders.status')->leftJoin('products', 'products.id','poab.product_id')->leftJoin('purchase_orders', 'purchase_orders.id','poab.po_id')->where('poab.po_uniquie_id',$unique_id)->get()->toarray();

        // dd($data);
        return view('admin.purchaseorder.archived', compact('unique_id','data'));
    }

    public function saveinventory(Request $request)
    {
        $request->validate([
            'barcode_no.*' => 'required'
        ],
        [
            // 'barcode_no.required' => 'Please add atleast one scanned box for generating GRN'
            'barcode_no.required' => 'Please add all scanned box for generating GRN or archive other not scanned box'
        ]
        );

        $params = $request->except('_token');
        
        $data = $this->PurchaseOrderRepository->saveInventory($params);
        // $archive = $this->generateNewPOArchived($params['unique_id']);

        $successMsg = "Stock inventory has been generated with GRN successfully";
        

        if($data){
            Session::flash('message', $successMsg); 
            return redirect()->route('admin.purchaseorder.index', ['type'=>'grn']);
        }else{
            return redirect()->route('admin.purchaseorder.index', ['type'=>'po']);
        } 
          
    }

    private function generateNewPOArchived($unique_id)
    {
        # code...
        $isArchive = false;
        $purchase_orders = PurchaseOrder::where('unique_id',$unique_id)->first();
        $supplier_id = $purchase_orders->supplier_id;
        $address = $purchase_orders->address;
        $state = $purchase_orders->state;
        $city = $purchase_orders->city;
        $country = $purchase_orders->country;
        $pin = $purchase_orders->pin;

        $data = DB::table('purchase_order_archived_boxes')->select('barcode_no','product_id','code_html','code_base64_img')->where('po_uniquie_id',$unique_id)->get();

        $products = DB::table('purchase_order_archived_boxes')->select('product_id',DB::raw('count(*) as total'))->where('po_uniquie_id',$unique_id)->groupBy('product_id')->get();

        // echo '<pre>'; print_r($products); die;
        $new_unique_id = time();
        // echo $new_unique_id;

        /* Add New Purchase Order */
        if(!empty($products)){
            foreach($products as $p){

        
                $product = Product::find($p->product_id);
                $pro_name = $product->name;
                $pro_hsn_code = $product->hsn_code;
                $pro_unit_value = $product->unit_value;
                $pro_unit_type = $product->unit_type;
                $pro_threshold_price = $product->threshold_price;
                $total_price = ($p->total * $pro_threshold_price);
    
                $newEntry = new PurchaseOrder;
                $newEntry->supplier_id = $supplier_id;
                $newEntry->unique_id = $new_unique_id;
                $newEntry->address = $address;
                $newEntry->state = $state;
                $newEntry->city = $city;
                $newEntry->country = $country;
                $newEntry->pin = $pin;
                $newEntry->product_id = $p->product_id;
                $newEntry->product = $pro_name;
                $newEntry->qty = $p->total;
                $newEntry->unit_value = $pro_unit_value;
                $newEntry->unit_type = $pro_unit_type;
                $newEntry->unit_price = $pro_threshold_price;
                $newEntry->total_price = $total_price;
                $newEntry->hsn_code = $pro_hsn_code;
                $newEntry->save();
                $po_id = $newEntry->id;
    
                foreach($data as $d){
                    DB::table('purchase_order_boxes')->insert([
                        'po_id' => $po_id,
                        'po_uniquie_id' => $new_unique_id,
                        'product_id' => $d->product_id,
                        'product_description' => productUnit($d->product_id),
                        'barcode_no' => $d->barcode_no,
                        'code_html' => $d->code_html,
                        'code_base64_img' => $d->code_base64_img
                    ]);
                }
            }
            $isArchive = true;
        }
        

        /* Delete Existing Archived Boxes */
        DB::table('purchase_order_archived_boxes')->where('po_uniquie_id',$unique_id)->delete();
        
        // echo '<pre>'; print_r($data); 
        // die;
        return $isArchive;
    }

    public function viewstocks($unique_id)
    {
        $data = $this->PurchaseOrderRepository->viewStocks($unique_id);
        // dd($data);
        return view('admin.purchaseorder.viewstock', compact('data'));
    }

    public function getProductsSupplier(Request $request)
    {
        $supplier_id = $request->supplier_id;
        $products = DB::table('products')->select('*')->where('supplier_id',$supplier_id)->get();
        return $products;
    }

    // Ajax    
    public function checkScannedboxes(Request $request)
    {
        # code...
        $po_uniquie_id = $request->uniquie_id;
        $data = DB::table('purchase_order_boxes')->select('barcode_no','is_scanned','scanned_weight_val')->where('po_uniquie_id',$po_uniquie_id)->where('is_scanned', 1)->get();

        return $data;
        // return response()->json(array('successData'=>$data));
    }

    public function viewGrn($unique_id)
    {
        # code...
        $data = $products = array();
        $products = DB::table('purchase_orders AS po')
                        ->select('po.*','p.name AS pro_name')
                        ->where('unique_id',$unique_id)
                        ->leftJoin('products AS p', 'p.id','po.product_id')
                        ->get()->toarray();
                       
        if(!empty($products)){
            foreach($products as $p){
                $data = DB::table('purchase_order_boxes AS pob')->select('pob.*')->where('pob.product_id', $p->product_id)->where('pob.po_uniquie_id', $p->unique_id)->orderBy('pob.id', 'desc')->get()->toarray();

                $scanned_box = DB::table('purchase_order_boxes AS pob')->where('pob.is_scanned', 1)->where('pob.product_id', $p->product_id)->where('pob.po_uniquie_id', $p->unique_id)->count();

                $p->boxes = $data;
                $p->scanned_box = $scanned_box;
            }
        }

        // dd($products);
        
        $total_po_price = PurchaseOrder::where('unique_id',$unique_id)->sum('total_price');
        
        return view('admin.purchaseorder.viewgrn', compact('products','data','unique_id','total_po_price'));
    }
    
}
