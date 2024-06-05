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
use Illuminate\Support\Facades\File; 

class PackingslipController extends Controller
{
    
    public function index(Request $request)
    {
        // echo 'View Packing Slip'; exit;
        $data = DB::table('packing_slip AS ps')
                        ->select('ps.*','p.name AS pro_name','o.order_no','s.address_outstation','i.trn_file')
                        ->selectRaw("SUM(quantity) AS total_qty , (SELECT GROUP_CONCAT(ps2.product_id) FROM packing_slip AS ps2 WHERE ps2.slip_no = ps.slip_no ) AS pro_ids , (SELECT COUNT(id) FROM packing_slip_boxes AS psb WHERE psb.slip_no = ps.slip_no AND psb.is_disbursed = 1) AS scanned_boxes ")
                        ->leftJoin('products AS p', 'p.id','ps.product_id')
                        ->leftJoin('orders AS o','o.id','ps.order_id')
                        ->leftJoin('stores AS s','s.id','o.store_id')
                        ->leftJoin('invoice AS i','i.invoice_no','ps.invoice_no')
                        ->groupBy('ps.slip_no')
                        ->orderBy('ps.created_at', 'desc')
                        ->paginate(5);
        
        return view('admin.packingslip.index', compact('data'));
    }
    
    public function add($order_id)
    {
        $order_products = DB::table('order_products AS op')->select('op.product_id','op.qty','op.release_qty','p.name AS pro_name','p.pcs')->leftJoin('products AS p', 'p.id','op.product_id')->where('op.order_id',$order_id)->get()->toarray();
        $order = DB::table('orders')->find($order_id);

        // dd($order_products);
        return view('admin.packingslip.add', compact('order','order_products','order_id'));
    }

    public function save(Request $request)
    {
        # code...
        $request->validate([
            'qty' => 'required|array',
            'pcs' => 'required|array'
        ]);
        $slip_no = date('YmdHis');
        $order_status = 2;
        $params = $request->except('_token');
        $barcode = $params['barcode'];
        
        $all_barcodes = implode(",",$barcode);        
        $barcodeArr = array();
        $barcodeArr = explode(",",$all_barcodes);
        $product = $params['product'];
        $qty = $params['qty'];
        // dd($product);
        if(!empty($qty)){
            for ($i=0; $i < count($qty); $i++) { 
                // dd($params['product'][$i]);
                # delete ctns from set_product_ctns_pcs_ps
                DB::table('set_product_ctns_pcs_ps')->where('order_id',$params['order_id'])->where('product_id',$params['product'][$i])->delete();
                
                $pro_barcodes = explode(",",$params['barcode'][$i]);    
                $pro_barcode_arr = json_encode($pro_barcodes);
                
                $id = DB::table('packing_slip')->insertGetId([                    
                    'order_id' => $params['order_id'],
                    'product_id' => $params['product'][$i],
                    'pcs' => $params['pcs'][$i],
                    'quantity' => $qty[$i],
                    'slip_no' => $slip_no,
                    'barcode_arr' => $pro_barcode_arr                 
                ]);

                # packing slip boxes
                for ($j=0; $j < count($pro_barcodes); $j++){
                    $getBarcodeDetailsStock = getBarcodeDetailsStock($pro_barcodes[$j]);
                    $code_html = $getBarcodeDetailsStock['code_html'];
                    $code_base64_img = $getBarcodeDetailsStock['code_base64_img'];
                    $pcs = $getBarcodeDetailsStock['pcs'];
                    $packing_slip_box_id = DB::table('packing_slip_boxes')->insertGetId([
                        'packing_slip_id' => $id,
                        'slip_no' => $slip_no,
                        'product_id' => $params['product'][$i],
                        'pcs' => $pcs,
                        'barcode_no' => $pro_barcodes[$j],
                        'code_html' => $code_html,
                        'code_base64_img' => $code_base64_img
                    ]);
                }
                # Getting last updated released quantity or ctns and pieces from order product 
                $order_products = DB::table('order_products')->where('order_id',$params['order_id'])->where('product_id', $params['product'][$i] )->first();

                $existing_release_qty = $order_products->release_qty;
                $existing_release_pcs = $order_products->release_pcs;
                
                $net_release_qty = ( $existing_release_qty + $params['qty'][$i] );
                $net_release_pcs = ( $existing_release_pcs + $params['pcs'][$i] );

                # Updated with new release quantity and pieces 

                DB::table('order_products')->where('order_id',$params['order_id'])->where('product_id', $product[$i])->update([
                    'release_qty' => $net_release_qty,
                    'release_pcs' => $net_release_pcs
                ]);

                if($order_products->pcs < $net_release_pcs){
                    # total ordered quantity and net release quantity if gone not same some more left then order delivery status changed to 2 or Pending 
                    $order_status = 2;                   
                }
                
                if($order_products->pcs >= $net_release_pcs){
                    # total ordered quantity and net release quantity if gone same order delivery status changed to 4 or Completed 
                    $order_status = 4;
                }
                
            }

            DB::table('orders')->where('id', $params['order_id'])->update(['status'=>$order_status]);
        }

        // die('Inserted');
        # *** very important  --- > make stock boxes scanned status
        if(!empty($barcodeArr)){
            foreach($barcodeArr as $b){                
                DB::table('stock_boxes')->where('barcode_no',$b)->update([
                    'is_scanned'=>1,
                    'updated_at'=>date('Y-m-d H:i:s') 
                ]);
            }
        }
        Session::flash('message', 'Packing slip generated successfully'); 
        return redirect()->route('admin.packingslip.index');        
    }

    /*public function save_old(Request $request)
    {                
        $request->validate([
            'qty' => 'required|array'
        ]);

        $slip_no = date('YmdHis');
        $order_status = 2;

        if(!empty($request->qty)){
            $i=1;
            
            foreach($request->qty as $key => $value){
                $product_id = $key;
                $count = $value;

                if(!empty($count)){
                    $getStockBoxes = DB::table('stock_boxes')->where('product_id',$product_id)->where('is_scanned', 0)->take($count)->get();
                    $id = DB::table('packing_slip')->insertGetId([
                        'order_id' => $request->order_id,
                        'product_id' => $product_id,
                        'quantity' => $count,
                        'slip_no' => $slip_no                        
                    ]);
                    foreach($getStockBoxes as $item){
                        
                        $packing_slip_box_id = DB::table('packing_slip_boxes')->insertGetId([
                            'packing_slip_id' => $id,
                            'slip_no' => $slip_no,
                            'product_id' => $product_id,
                            'pcs' => $item->pcs,
                            'barcode_no' => $item->barcode_no,
                            'code_html' => $item->code_html,
                            'code_base64_img' => $item->code_base64_img
                        ]);
                        DB::table('stock_boxes')->where('id',$item->id)->update(['is_scanned'=>1,'packing_slip_box_id'=>$packing_slip_box_id,'updated_at'=>date('Y-m-d H:i:s') ]);
                    }
                }

                # Getting last updated released quantity from order product

                $order_products = DB::table('order_products')->where('order_id',$request->order_id)->where('product_id', $product_id)->first();
                $existing_release_qty = $order_products->release_qty;
                $net_release_qty = $existing_release_qty+$count;

                # Updated with new release quantity 

                DB::table('order_products')->where('order_id',$request->order_id)->where('product_id', $product_id)->update(['release_qty' => $net_release_qty]);

                if($order_products->qty > $net_release_qty){
                    # total ordered quantity and net release quantity if gone not same some more left then order delivery status changed to 2 or Pending 

                    $order_status = 2;                   
                }
                
                if($order_products->qty == $net_release_qty){

                    # total ordered quantity and net release quantity if gone same order delivery status changed to 4 or Completed                  

                    $order_status = 4;
                }
                $i++;
            }

            DB::table('orders')->where('id', $request->order_id)->update(['status'=>$order_status]);
            // die;
        }
        
        Session::flash('message', 'Packing slip generated successfully'); 
        return redirect()->route('admin.packingslip.index');
        // return redirect()->route('admin.order.index',['status'=>$order_status]);
    }*/

    public function pieces($order_id,$product_id,$ctns,$pcs)
    {
        # arrannge pieces for order product for generating packinglsip...
        
        $order = DB::table('orders')->find($order_id);
        $order_no = $order->order_no;

        $product = DB::table('products')->find($product_id);
        $product_name = $product->name;

        $data = DB::table('stock_boxes AS sb')->select('sb.*')->where('sb.is_scanned', 0)->where('sb.product_id',$product_id)->orderBy('sb.id','asc')->get();

        $set_product_ctns_pcs_ps = DB::table('set_product_ctns_pcs_ps')->where('order_id',$order_id)->where('product_id',$product_id)->get();
       
        
        return view('admin.packingslip.pieces', compact('data','order_id','product_id','order_no','product_name','ctns','pcs'));
    }

    public function removepieces($order_id,$product_id)
    {
        DB::table('set_product_ctns_pcs_ps')->where('order_id',$order_id)->where('product_id',$product_id)->delete();
        Session::flash('message', 'Cartons removed for this product successfully'); 
        return redirect()->route('admin.packingslip.add',$order_id);
    }

    public function set_product_ctns_pcs_ps(Request $request)
    {
        # set_product_ctns_pcs_ps...
        // dd($request->all());
        $request->validate([
            'barcode_no' => 'required'
        ],[
            'barcode_no.required' => "Please choose at least one carton"
        ]);

        $params = $request->except('_token');
        # delete old ctns 
        DB::table('set_product_ctns_pcs_ps')->where('order_id',$params['order_id'])->where('product_id',$params['product_id'])->delete();
        $barcodes = $params['barcode_no'];
        foreach($barcodes as $barcode){
            $stock = DB::table('stock_boxes')->where('barcode_no',$barcode)->first();
            
            $pcs = $stock->pcs;
            DB::table('set_product_ctns_pcs_ps')->insert([
                'order_id' => $params['order_id'],
                'product_id' => $params['product_id'],
                'barcode_no' => $barcode,
                'pcs' => $pcs
            ]);
            # make stock box set for ps
            // DB::table('stock_boxes')->where('barcode_no',$barcode)->update(['is_set_for_ps' => 1]); 
        }

        Session::flash('message', 'Cartons saved for packing slip successfully'); 
        return redirect()->route('admin.packingslip.add', $params['order_id']);

    }

    public function generateQrCode1()
    {
        // dd('Hi');
        // die('Hi');
        // \QrCode::size(500)
        //         ->format('png')
        //         ->generate('codingdriver.com', public_path('images/qrcode.png'));
        
        // return view('qr-code');

        // $im = imagecreate(100, 30);

        // // White background and blue text
        // $bg = imagecolorallocate($im, 255, 255, 255);
        // $textcolor = imagecolorallocate($im, 0, 0, 255);

        // // Write the string at the top left
        // imagestring($im, 5, 0, 0, 'Hello world!', $textcolor);

        // // Output the image
        // header('Content-type: image/png');

        // imagepng($im);
        // imagedestroy($im);

        $barcodeGenerator =  barcodeGenerator();
        echo $barcodeGenerator['code_html'];
    }

    public function boxes($slip_no)
    {
        $data = DB::table('packing_slip_boxes AS psb')->select('psb.*','ps.slip_no','sb.code_html')->leftJoin('packing_slip AS ps','ps.id','psb.packing_slip_id')->leftJoin('stock_boxes AS sb','sb.barcode_no','psb.barcode_no')->where('ps.slip_no',$slip_no)->get();

        // dd($data);

        return view('admin.packingslip.box', compact('data'));
    }

    public function get_pdf($slip_no)
    {
        $data = DB::table('packing_slip AS ps')
        ->select('ps.*','p.name AS pro_name','o.order_no','o.created_at AS ordered_at','s.store_name','s.whatsapp AS store_whatsapp')
        // ->selectRaw("ps.*,p.name AS pro_name,s.store_name,s.whatsapp AS store_whatsapp,GROUP_CONCAT(packing_slip_boxes.pcs) AS ctn_pcs FROM packing_slip_boxes  WHERE packing_slip_boxes.packing_slip_id = ps.id AND packing_slip_boxes.product_id = ps.product_id)")
        // ->selectRaw("GROUP_CONCAT(packing_slip_boxes.pcs) AS ctn_pcs FROM packing_slip_boxes  WHERE packing_slip_boxes.packing_slip_id = ps.id AND packing_slip_boxes.product_id = ps.product_id) ")
        ->leftJoin('orders AS o','o.id','ps.order_id')
        ->leftJoin('products AS p','p.id','ps.product_id')
        ->leftJoin('stores AS s','s.id','o.store_id')            
        ->where('ps.slip_no',$slip_no)->get();

        // dd($data);

        return view('admin.packingslip.pdf', compact('data'));
    }

    public function raise_invoice_form($slip_no)
    {
        # check invoice raised for PS

        $checkInvoiceRaised = DB::table('packing_slip')->where('slip_no',$slip_no)->where('is_invoice_raised', 1)->first();
        if(!empty($checkInvoiceRaised)){
            Session::flash('message', "Invoice raised already for this packing slip");
            return redirect()->route('admin.packingslip.index');
        }

        $data = DB::table('packing_slip AS ps')
        ->select('ps.*','p.name AS pro_name','p.igst','p.cgst','p.sgst','p.hsn_code','o.order_no','o.user_id','o.created_at AS ordered_at','s.store_name','s.bussiness_name','s.whatsapp AS store_whatsapp','s.email AS store_email','s.contact AS store_contact','s.address_outstation','s.billing_address AS store_billing_address','s.billing_landmark AS store_billing_landmark','s.billing_state AS store_billing_state','s.billing_city AS store_billing_city','s.billing_pin AS store_billing_pin','s.shipping_address AS store_shipping_address','s.shipping_landmark AS store_shipping_landmark','s.shipping_state AS store_shipping_state','s.shipping_city AS store_shipping_city','s.shipping_pin AS store_shipping_pin','o.store_id')
        ->leftJoin('orders AS o','o.id','ps.order_id')
        ->leftJoin('products AS p','p.id','ps.product_id')
        ->leftJoin('stores AS s','s.id','o.store_id')             
        ->where('ps.slip_no',$slip_no)->get();

        // dd($data);

       
        return view('admin.packingslip.raise-invoice', compact('data'));
    }

    public function save_invoice(Request $request)
    {        
        $params = $request->except('_token');
        
        $trn_file = '';

        // dd($params);
        
        $invoice_no = getRandString(15);
        $sum_total_price = 0;
        $net_price = $params['net_price'];

        $id = DB::table('invoice')->insertGetId([
            'invoice_no' => $invoice_no,
            'net_price' => $net_price,
            'required_payment_amount' => $net_price,
            'order_id' => $params['order_id'],
            'store_id' => $params['store_id'],
            'store_name' => $params['store_name'],
            'store_whatsapp' => $params['store_whatsapp'],
            'store_contact' => $params['store_contact'],
            'store_billing_address' => $params['store_billing_address'],
            'store_billing_latitude' => $params['store_billing_latitude'],
            'store_billing_longitude' => $params['store_billing_longitude'],
            'store_billing_landmark' => $params['store_billing_landmark'],
            'store_billing_state' => $params['store_billing_state'],
            'store_billing_city' => $params['store_billing_city'],
            'store_billing_pin' => $params['store_billing_pin'],
            'store_shipping_address' => $params['store_shipping_address'],
            'store_shipping_latitude' => $params['store_shipping_latitude'],
            'store_shipping_longitude' => $params['store_shipping_longitude'],
            'store_shipping_landmark' => $params['store_shipping_landmark'],
            'store_shipping_state' => $params['store_shipping_state'],
            'store_shipping_city' => $params['store_shipping_city'],
            'store_shipping_pin' => $params['store_shipping_pin'],
            'store_address_outstation' => $params['store_address_outstation'],
            'user_id' => $params['user_id'],
            'order_no' => $params['order_no'],
            'slip_no' => $params['slip_no'],            
            'product_id_arr' => json_encode($params['product_id']),
            'trn_file' => $trn_file
        ]);

        /* invoice_products entry */

        for($i=0; $i< count($params['product_id']); $i++){
            
            $getOrderProductDetails = getOrderProductDetails($params['order_id'],$params['product_id'][$i]);
            
            DB::table('invoice_products')->insert([
                'invoice_id' => $id,
                'product_id' => $params['product_id'][$i],
                'product_name' => $params['product_name'][$i],
                'quantity' => $params['quantity'][$i],
                'pcs' => $params['pcs'][$i],
                'price' => $params['price'][$i],
                'count_price' => $params['count_price'][$i],
                'total_price' => $params['total_price'][$i],
                'is_store_address_outstation' => $params['is_store_address_outstation'][$i],
                'hsn_code' => $params['hsn_code'][$i],
                'igst' => $params['igst'][$i],
                'cgst' => $params['cgst'][$i],
                'sgst' => $params['sgst'][$i]
            ]);
            
        }

        /* Change status invoice generated in packing slip */

        DB::table('packing_slip')->where('slip_no',$params['slip_no'])->update(['is_invoice_raised' => 1 , 'invoice_no' => $invoice_no]);
       
        /* ledger entry */

        $ledgerBalance = DB::table('ledger')->where('store_id',$params['store_id'])->orderBy('id','desc')->first();

        if(!empty($ledgerBalance)){
            $last_closing_amount = $ledgerBalance->last_closing_amount;
        }else{
            $last_closing_amount = 0;
        }

        DB::table('ledger')->insert([
            'user_type' => 'store',
            'staff_id' => 0,
            'store_id' => $params['store_id'],
            'transaction_id' => $invoice_no,
            'transaction_amount' => $net_price,
            'is_debit' => 1,
            'entry_date' => date('Y-m-d'),
            'purpose' => 'invoice',
            'purpose_description' => 'invoice raised of sales order for store'
        ]);

        

        Session::flash('message', 'Invoice raised successfully for packing slip no '.$params['slip_no']); 
        return redirect()->route('admin.invoice.index');
        
    }

    
    public function upload_trn(Request $request)
    {
        # upload TRN pdf for invoice if store address found outstation...
        $params = $request->except('_token');
        $slip_no = $params['slip_no'];
        $invoice_no = $params['invoice_no'];
        $order_id = $params['order_id'];

        /* Existing file remove */

        $invoiceData = DB::table('invoice')->where('invoice_no',$invoice_no)->first();
        $old_trn_file = !empty($invoiceData->trn_file)?$invoiceData->trn_file:'';
        if(!empty($old_trn_file)){
            $file_path = public_path().'/'.$old_trn_file;
            // echo $old_trn_file;
            // echo '<br/>'; 
            // echo $file_path; 
            File::delete($file_path);
            // die;
        }

        $upload_path = "uploads/trn/";
        $pdf = $params['trn_file'];           
    
        $PdfName = time().".".$pdf->getClientOriginalName();
        $pdf->move($upload_path, $PdfName);
        $uploadedPdf = $PdfName;
        $trn_file= $upload_path.$uploadedPdf;
        
        DB::table('invoice')->where('invoice_no',$invoice_no)->update(['trn_file'=>$trn_file,'updated_at' => date('Y-m-d H:i:s')]);

        Session::flash('message', 'TRN file uploaded successfully for Invoice no '.$invoice_no); 
        return redirect()->route('admin.packingslip.index', $order_id);

    }

    public function view_invoice($invoice_no)
    {
        
        $invoice = DB::table('invoice')
                        ->select('invoice.*','o.created_at AS ordered_at','u.name AS staff_name','u.mobile AS staff_mobile','u.address AS staff_address')
                        ->leftJoin('users AS u','u.id','invoice.user_id')
                        // ->leftJoin('stores AS s','s.id','invoice.store_id')
                        ->leftJoin('orders AS o','o.id','invoice.order_id')
                        ->where('invoice_no',$invoice_no)->first();

        $invoice_products = DB::table('invoice_products AS ip')
                                ->select('ip.*','p.name AS pro_name')
                                ->leftJoin('products AS p','p.id','ip.product_id')
                                ->where('ip.invoice_id',$invoice->id)->get();
        $invoice->invoice_products = $invoice_products;
        $settings = DB::table('app_settings')->find(1);


        // dd($invoice);

        return view('admin.packingslip.invoice', compact('invoice','settings'));
    }

    public function view_goods_stock($slip_no)
    {
        # code...
        $data = DB::table('packing_slip AS ps')->select('ps.id','ps.order_id','ps.product_id','ps.slip_no','ps.invoice_no','ps.quantity','products.name AS pro_name')->leftJoin('products', 'products.id','ps.product_id')->where('ps.slip_no',$slip_no)->get();

        if(!empty($data)){
            foreach($data as $d){
                $packing_slip_boxes = DB::table('packing_slip_boxes AS psb')->select('psb.id','psb.product_id','psb.barcode_no','sb.code_html','sb.code_base64_img','sb.is_scanned','sb.scan_no','sb.stock_in_weight_val','sb.stock_out_weight_val')->leftJoin('stock_boxes AS sb','sb.barcode_no','psb.barcode_no')->where('psb.packing_slip_id',$d->id)->get();

                $d->boxes = $packing_slip_boxes;
            }
        }

        // dd($data);
        return view('admin.packingslip.stockout', compact('slip_no','data'));
    }


    # Ajax
    public function checkScannedboxes(Request $request)
    {
        # code...
        $data = array();
        $slip_no = $request->slip_no;
        $data = DB::table('packing_slip_boxes AS psb')->select('psb.barcode_no','psb.is_disbursed','sb.scan_no','sb.stock_in_weight_val','sb.stock_out_weight_val')->leftJoin('stock_boxes AS sb','sb.barcode_no','psb.barcode_no')->where('psb.slip_no',$slip_no)->where('psb.is_disbursed', 1)->get();

        return $data;
    }

    public function save_goods_out(Request $request)
    {
        # code...

        $request->validate([
            'slip_no' => 'required',
            'barcode_no.*' => 'required'
        ],
        [
            'slip_no.required' => 'Slip no is required',
            'barcode_no.required' => 'Please add all scanned box for generating GRN or archive other not scanned box'
        ]
        );

        $params = $request->except('_token');
        $slip_no = $params['slip_no'];
        DB::table('packing_slip')->where('slip_no',$slip_no)->update(['is_disbursed'=>1]);

        Session::flash('message', 'Goods disbursed successfully from packing slip  '.$slip_no);
        return redirect()->route('admin.packingslip.index');


    }

    
}
