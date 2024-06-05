@extends('admin.layouts.app')
@section('page', 'Purchase Order Detail')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Purchase Order</li>
        @if ($data[0]->status == 1)
        <li><a href="{{ route('admin.purchaseorder.index') }}?type=po">PO</a></li>
        @elseif ($data[0]->status == 2)
        <li><a href="{{ route('admin.purchaseorder.index') }}?type=grn">GRN</a></li>
        @endif        
        <li>Purchase Order Detail</li>
    </ul>    
    <div class="row">
        <div class="col-sm-9" id="invoice-div">
            <div class="card shadow-sm">
                <div class="card-body">                    
                    <div class="admin__content">
                        <aside>
                            <nav>Order Information</nav>
                        </aside>
                        <content>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">Order Id</label>
                                </div>
                                <div class="col-9">
                                    <p class="">#{{$data[0]->unique_id}}</p>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">Supplier</label>
                                </div>
                                <div class="col-9">
                                    <p class="">{{$data[0]->supplier->name}}</p>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">Contact</label>
                                </div>
                                <div class="col-9">
                                    <p class="">{{$data[0]->supplier->mobile}}</p>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">Email</label>
                                </div>
                                <div class="col-9">
                                    <p class="">{{$data[0]->supplier->email}}</p>
                                </div>
                            </div>
                        </content>
                    </div>                    
                </div>
            </div>                            
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-sm" id="timePriceTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product</th>
                                <th>No of Cartons</th>
                                <th>Pieces per Ctn</th>
                                <th>Weight per Ctn</th>
                                <th>Cost Price</th>
                                <th>Price per Ctn</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i=1;
                            @endphp
                            @foreach ($data as $item)
                                <tr>
                                    <td>
                                        {{$i}}
                                    </td>
                                    <td> {{$item->product}} </td>                                        
                                    <td> {{$item->qty}} ctns</td>
                                    <td> {{$item->pcs}} pieces</td> 
                                    <td> {{$item->weight}} {{$item->weight_unit}}</td>                                       
                                    <td> Rs. {{$item->piece_price}}</td>
                                    <td> Rs. {{$item->unit_price}}</td>
                                    <td> Rs. {{$item->total_price}}</td>
                                </tr>
                                @php
                                    $i++;
                                @endphp
                            @endforeach
                            
                        </tbody>
                        <tbody>
                            <tr class="table-info">
                                <td></td>
                                <td colspan="6">Total PO Price</td>
                                <td><span>Rs. {{$total_po_price}}</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>                
        </div>
        <div class="col-sm-3">
            <div class="card shadow-sm">
                <div class="card-header" id="btnDownload">
                    Action
                </div>
                <div class="card-body text-end">
                    @if ($data[0]->status == 1)
                        <a href="{{ route('admin.purchaseorder.index') }}?type=po" class="btn btn-sm btn-danger">Back to PO </a>
                    @else
                        <a href="{{ route('admin.purchaseorder.index') }}?type=grn" class="btn btn-sm btn-danger">Back to GRN </a>
                    @endif
                    
                    <a onclick='printtag({{$data}})' class="btn btn-sm btn-outline-info">Print</a>
                    <a href="{{ route('admin.barcodes', $unique_id) }}" class="btn btn-sm btn-outline-info">Download Barcodes</a>
                </div>
            </div>
        </div>
    </div>    
</section>
@endsection

@section('script')
<script>
    function printtag(item) {
        console.log(item);
        // var allcontent = "<body  onload="window.print()" ><p>hello</p></body></html>"  ;
        var allcontent = '<body onload="window.print()" class="body" style="padding:0 !important; margin:0 !important; display:block !important; min-width:100% !important; width:100% !important; background:#f9f9f9; -webkit-text-size-adjust:none;"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f9f9f9" style="margin-top:10px;"><tr><td align="center"><table width="500" border="0" cellspacing="0" cellpadding="0" class="mobile-shell" style="padding: 0px 0px 0px 0px;"><tr><td class="td" style="width:600px; min-width:600px; font-size:0pt; line-height:0pt; padding:3px; margin:0; font-weight:normal;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="padding:0px 0px 0px 0px; margin-bottom: 0px; background: #ffffff; background-repeat: no-repeat; background-position: center left; background-size: 100%;"><tr><td class="p30-15 tbrr" style="padding: 5px 0px 5px 0px;"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><th class="column-top" width="400" style="font-size:0pt; line-height:0pt; padding:0 10px; margin:0; font-weight:normal; vertical-align:middle; text-align: left;"><a href="JavaScript:void(0);" target="_blank"><img src="{{ asset("admin/images/AGNI.png") }}" style="width: 110px;"></a></th><th class="column-empty2" width="200" style="font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal; vertical-align:top;"><p style="color:#3b4e87; font-family:Arial, sans-serif; font-size:16px; line-height:24px; text-align:left; font-weight:600; padding:0; margin:0px 0 0 0; letter-spacing: 1.5px;">INVOICE</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0; margin:0px 0 0 0">Invoice No. - '+item[0].unique_id+'</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0; margin:0px 0 0 0">Invoice Date - '+item[0].created_at.split(" ")[0]+'</p></th></tr></table></td></tr></table><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" style="padding:0px 0px 0px 0px;"><tr><td style="padding: 0 0 0 0"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding-bottom:12px; font-weight:500; padding:10px;"><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:600; padding:0; margin:0px 0 0 0">Company Detail</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0; margin:0px 0 0 0">City - Kolkata</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0; margin:0px 0 0 0">Phone No. - 12345678</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0; margin:0px 0 0 0">Fax No. - 12345678</p></td></tr><tr><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding-bottom:12px; font-weight:500; width: 300px; vertical-align: baseline;"><h2 style="color:#ffffff; font-weight:600; margin-top: 0px; font-size:14px; background-color: #3b4e87; padding: 5px 5px 5px 10px;">Bill Form:</h2><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:600; padding:0 10px 0 10px; margin-bottom: 0;">'+item[0].supplier.name+' </p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0 10px 0 10px; margin:0 0 0 0;">'+item[0].supplier.billing_address+', '+item[0].supplier.billing_city+', '+item[0].supplier.billing_state+', '+item[0].supplier.billing_country+', pin-'+item[0].supplier.billing_pin+'</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0 10px 0 10px; margin:15px 0 0 0;">GSTIN : 123456789</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0 10px 0 10px; margin:0px 0 0 0;">CIN : 123456789</p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0 10px 0 10px; margin:0px 0 0 0;">PAN : 123456789</p></td><td class="text pb15" style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding-bottom:12px; font-weight:500; width: 300px; vertical-align: baseline;"><h2 style="color:#ffffff; font-weight:600; margin-top: 0px; font-size:14px; background-color: #3b4e87; padding: 5px 5px 5px 10px;">Bill To:</h2><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:600; padding:0 10px 0 10px; margin:0 0 0 0;">AGNI </p><p style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; font-weight:400; padding:0 10px 0 10px; margin:0px 0 0 0;">'+item[0].address+', '+item[0].city+', '+item[0].state+', '+item[0].country+', pin-'+item[0].pin+'</p></td></tr><tr><table border="1" width="600" border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;"><thead><tr><th style="color:#ffffff; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:left; padding:4px 10px; font-weight:bold; background-color: #3b4e87;" width="360">Product</th><th style="color:#ffffff; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:left; padding:4px 10px; font-weight:bold; background-color: #3b4e87;" width="120">Unit</th><th style="color:#ffffff; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:left; padding:4px 10px; font-weight:bold; background-color: #3b4e87;" width="120">Boxes</th><th style="color:#ffffff; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:left; padding:4px 10px; font-weight:bold; background-color: #3b4e87;" width="120">Net Price</th><th style="color:#ffffff; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:center; padding:4px 10px; font-weight:bold; background-color: #3b4e87;" width="120">Total (in Rs.)</th></tr></thead><tbody>';

        let total_amount = 0;

        for (let index = 0; index < item.length; index++) {
            allcontent += '<tr><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding:4px 10px; font-weight:400; background-color:#efefef; border-bottom:1px solid #d8d8d8; width: 30%;">'+item[index].product+'</td><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding:4px 10px; font-weight:400; background-color:#efefef; border-bottom:1px solid #d8d8d8;">'+item[index].unit+'</td><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding:4px 10px; font-weight:400; background-color:#efefef; border-bottom:1px solid #d8d8d8;">'+item[index].qty+'</td><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:left; padding:4px 10px; font-weight:400; background-color:#efefef; border-bottom:1px solid #d8d8d8;">'+item[index].unit_price+'</td><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:center; padding:4px 10px; font-weight:400; background-color:#efefef; border-bottom:1px solid #d8d8d8;">'+item[index].total_price+'</td></tr>'

            total_amount = total_amount+Number(item[index].total_price);
        }

        allcontent += '<tr><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:20px; text-align:right; padding:4px 10px 4px 4px; font-weight:bold;" width="120" colspan="4">Total Amount</td><td style="color:#2f3c56; font-family:Arial, sans-serif; font-size:14px; line-height:24px; text-align:center; padding:4px; font-weight:400; background-color:#efefef;">'+total_amount+'</td></tr></tbody></table></tr><table width="600" border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;"><tr><td style="width:100%; height:30px; background-color:#3b4e87;"></td></tr></table></td></tr></table></td></tr></table></td></tr></table></body>'  ;
        var newWin=window.open('','Print-Window');
        newWin.document.open();
        newWin.document.write(allcontent);
        newWin.document.close();
        setTimeout(function(){newWin.close();},1000);
    }
</script>

<script>
    function downloadPDF()
    {
        // console.log('Hi'); return true;
        
        
        
        var htmlUrl = '{{url('admin/barcodes')}}/{{$unique_id}}';
        console.log(htmlUrl);
        $.ajax({
            url: htmlUrl,
            type: "GET",
            dataType: "html",
            data: {
                txtsearch: 'abc'
            },
            success: function(data){
                console.log(data);
                // var mywindow = window.open("", "PRINT", "height=400,width=600");        
                // mywindow.document.write(data);
                // // mywindow.document.write(makepdf.innerHTML);
                // mywindow.document.close();
                // mywindow.focus();

                // mywindow.print();
                // mywindow.close();

                // return true;
            }
        });
        

        
        
    }


</script>
@endsection