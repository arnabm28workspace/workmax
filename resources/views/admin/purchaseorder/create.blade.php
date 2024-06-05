@extends('admin.layouts.app')
@section('page', 'Create Purchase Order')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Purchase Order</li>
        <li><a href="{{ route('admin.purchaseorder.index') }}?type=po">PO</a></li>
        <li>Create Purchase Order</li>
    </ul>
    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    <form method="post" action="{{ route('admin.purchaseorder.store') }}">
    @csrf
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-4">
                    <select class="form-control select-md"  name="supplier_id" required id="supplier_id">
                    <option  value="" selected hidden>Select a supplier</option>
                    @foreach ($suppliers as $item)
                    <option value="{{$item->id}}" {{ old('supplier_id') ?? (old('supplier_id') == $item->id) ? 'selected' : ''}} @if(isset($supplier_id) && $supplier_id == $item->id) selected @endif >{{ $item->name }}</option>
                    @endforeach
                    </select>   
                    <p class="small text-danger">*** Please choose supplier first and then proceed for adding product items</p>                
                </div>            
                <input type="hidden" required name="unique_id" id="unique_id">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="row">                            
                            <div class="col-sm-4">
                                <div class="form-group mb-3">
                                    <h6>Depot Address</h6>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Address :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{ $app_settings->po_order_address }}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>City :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{ $app_settings->po_order_city }}</p></div>
                                    </div>                                    
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>State :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{ $app_settings->po_order_state }} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Country :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{ $app_settings->po_order_country }} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Pincode :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{ $app_settings->po_order_pin }} </p></div>
                                    </div>
                                    <input type="hidden" name="address" value="{{ $app_settings->po_order_address }}">
                                    <input type="hidden" name="city" value="{{ $app_settings->po_order_city }}">
                                    <input type="hidden" name="state" value="{{ $app_settings->po_order_state }}">
                                    <input type="hidden" name="country" value="{{ $app_settings->po_order_country }}">
                                    <input type="hidden" name="pin" value="{{ $app_settings->po_order_pin }}">
                                </div>
                            </div>
                            @if (!empty($supplier_id))
                            <div class="col-sm-4">
                                <div class="form-group mb-3">
                                    <h6>Supplier Billing Address</h6>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Address :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_address}}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Landmark :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_landmark}}</p></div>
                                    </div>                                    
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>City :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_city}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>State :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_state}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Country :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_country}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Pincode :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->billing_pin}} </p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group mb-3">
                                    <h6>Supplier Shipping Address</h6>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Address :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_address}}</p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Landmark :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_landmark}}</p></div>
                                    </div>                                    
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>City :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_city}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>State :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_state}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Country :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_country}} </p></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4"><p class="small m-0"><strong>Pincode :</strong></p></div>
                                        <div class="col-sm-8"><p class="small m-0">{{$supplier_details->shipping_pin}} </p></div>
                                    </div>
                                </div>
                            </div>   
                            @endif
                            
                        </div>
                    </div>
                </div>
                <p class="small text-danger">*** Please make sure if change supplier in middle of adding product items all added items will be lost.</p>                 
                <table class="table table-sm" @if(empty($supplier_id)) style="display: none;" @endif id="timePriceTable">
                    <thead>
                        <tr>
                            <th width="400px">Product</th>
                            <th>HSN Code</th>
                            <th>Pcs per Ctn</th>
                            <th rowspan="2">Weight per Ctn</th>
                            <th>Price/Pc (Inc.Tax)</th>
                            <th>No of Ctns</th>
                            <th>Price Per Ctn (Inc.Tax)</th>
                            <th colspan="2">Total Amount (Inc.Tax)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="tr_1" class="tr_pro">
                            <td>                                        
                                {{-- <select required name="product[]" id="product_name1" class="form-control product-dropdown" placeholder="Product name" onchange="getProductDetail(this, 1)">
                                    <option value="" hidden>-select-</option>
                                    @foreach ($products as $item)
                                        <option value="{{$item->name}}" data-id="{{$item->id}}">{{$item->name}}</option>
                                    @endforeach
                                </select> --}}
                                <input type="text" name="product[]" value="" placeholder="Search product by name ..." class="form-control select-md"  id="product_name1" onkeyup="getProductByName(this.value, 1);" > 
                                <input type="hidden" name="product_id[]" id="product_id1">
                                <div class="respDrop" id="respDrop1"></div>
                            </td>
                            <td>
                                <input type="text" required name="hsn_code[]" id="hsn_code1" class="form-control" value="" placeholder="Enter HSN Code">
                            </td>
                            <td>
                                <input type="number"  name="pcs[]" id="pcs1" class="form-control" value="1" onkeyup="if(value<0) value=0;calculatePrice(1)" onchange="if(value<0) value=0;calculatePrice(1)">
                            </td>
                            <td>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" required name="weight[]" id="weight1" maxlength="5" onkeypress="validateNum(event)" placeholder="Enter carton weight">
                                    </div>
                                    <div class="col-sm-4">
                                        <select name="weight_unit[]" required id="weight_unit1" class="form-control">
                                            {{-- <option value="" hidden selected>Unit</option> --}}
                                            <option value="kg" selected>KG</option>
                                            <option value="g">G</option>
                                        </select>
                                    </div>
                                </div>
                            </td>  
                            <td>
                                <input type="text"  required name="piece_price[]"  id="piece_price1" class="form-control piece_price" value="" placeholder="Product Cost Price" onkeyup="calculatePrice(1)"  onkeypress="validateNum(event)">
                            </td>                           
                            <td>
                                <input type="number"  required name="qty[]" id="qty1" min="1" class="form-control" placeholder="Product qty" value="1" onkeyup="if(value<0) value=0;calculatePrice(1)" onchange="if(value<0) value=0;calculatePrice(1)">
                            </td>   
                            
                            <td>
                                <input type="text" name="price_per_carton[]" readonly class="form-control" required id="price_per_carton1" placeholder="Price per Carton">
                            </td>                             
                            <td>
                                <input type="text" readonly required name="total_price[]" id="total_price1" class="form-control total_price" placeholder="Total Product Price" value="">
                            </td>
                            <td id="btn_td_1">
                                <a class="btn btn-sm btn-success actionTimebtn addNewTime" id="addNew1">+</a>
                                <a class="btn btn-sm btn-danger actionTimebtn removeTimePrice" onclick="removeRow(1)" id="removeNew1">X</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="card shadow-sm">
                    <div class="card-body"> 
                        <div class="row mb-3 justify-content-end">
                            <div class="col-md-8">
                                <h6 class="text-muted mb-2">Total Amount (Inc.Tax)</h6>
                            </div>
                            <div class="col-md-4 text-end">
                                <table class="w-100">            
                                    <tr class="border-top">
                                        <td><h6 class="text-dark mb-0 text-end"> Rs <span id="total_po_price">0</span></h6></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>   
                <div class="card shadow-sm">
                    <div class="card-body">
                        <a href="{{ route('admin.purchaseorder.index', ['type'=>'po']) }}" class="btn btn-sm btn-danger">Back</a>
                        <button type="submit" id="submitBtn" class="btn btn-sm btn-success">Add</button>
                    </div>
                </div>
            </div>
            
        </div>
    </form>
</section>
@endsection

@section('script')
<script>
    
    var rowCount = $('#timePriceTable tbody tr').length;
    $(document).ready(function(){    
                
        // alert(rowCount)
        if(rowCount == 1){
            $('#removeNew1').hide();
        }

        var supplier_id = $('#supplier_id').val();
        if(supplier_id != ''){
            $('#submitBtn').attr('disabled', false);
        } else {
            $('#submitBtn').attr('disabled', true);
        }
    })
    function validateNum(evt) {
        var theEvent = evt || window.event;

        // Handle paste
        if (theEvent.type === 'paste') {
            key = event.clipboardData.getData('text/plain');
        } else {
        // Handle key press
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
        }
        var regex = /[0-9]|\./;
        if( !regex.test(key) ) {
            theEvent.returnValue = false;
            if(theEvent.preventDefault) theEvent.preventDefault();
        }
    }

    $('#supplier_id').on('change', function(){
        // console.log(this.value);
        var supplier_id = $('#supplier_id').val();
        // $.ajax({
        //     url: "{{ route('admin.purchaseorder.getProductsSupplier') }}",
        //     dataType: 'JSON',
        //     type: 'POST',
        //     data: {
        //         'supplier_id': this.value,
        //         '_token': '{{ csrf_token() }}'
        //     },
        //     success: function(data){
        //         // console.log(data);
        //         var proHtml = ``;
        //         proHtml += `<option value="">Select a product</option>`;
        //         for(var i=0;i < data.length; i++){
        //             proHtml += `<option value="`+data[i].id+`" data-id="`+data[i].id+`">`+data[i].name+`</option>`;
        //         }


        //         $('.product-dropdown').html(proHtml);

                
                
        //     }
        // });
        console.log(`{{ url('admin/purchaseorder/create/`+supplier_id+`') }}`);
        window.location = `{{ url('admin/purchaseorder/create/`+supplier_id+`') }}`;
        
    }); 

    $("#unique_id").val(Date.now());
    var i = 2;
    $(document).on('click','.addNewTime',function(){
        var thisClickedBtn = $(this);
        
        var toAppend = `
        <tr id="tr_`+i+`" class="tr_pro">
            <td>
                <input type="text" name="product[]" value="" placeholder="Search product by name ..." class="form-control select-md"  id="product_name`+i+`" onkeyup="getProductByName(this.value, `+i+`);" > 
                <input type="hidden" name="product_id[]" id="product_id`+i+`">
                <div class="respDrop" id="respDrop`+i+`"></div>
            </td> 
            <td>
                <input type="text" required name="hsn_code[]" id="hsn_code`+i+`" class="form-control" value="" placeholder="Enter HSN Code">
            </td>
            <td>
                <input type="number" min="1" name="pcs[]" id="pcs`+i+`" class="form-control" value="1" onkeyup="if(value<0) value=0;calculatePrice(`+i+`)" onchange="if(value<0) value=0;calculatePrice(`+i+`)">
            </td>
            <td>
                <div class="row">
                    <div class="col-sm-8">
                        <input type="text" class="form-control" required name="weight[]" id="weight`+i+`" maxlength="5" onkeypress="validateNum(event)" placeholder="Enter carton weight">
                    </div>
                    <div class="col-sm-4">
                        <select name="weight_unit[]" required id="weight_unit`+i+`" class="form-control">                            
                            <option value="kg" selected>KG</option>
                            <option value="g">G</option>
                        </select>
                    </div>
                </div>
            </td>                              
            <td>
                <input type="text"  required name="piece_price[]"  id="piece_price`+i+`" class="form-control piece_price" value="" placeholder="Product Cost Price" onkeyup="calculatePrice(`+i+`)"  onkeypress="validateNum(event)">
            </td>                           
            <td>
                <input type="number"  required name="qty[]" id="qty`+i+`" min="1" class="form-control" placeholder="Product qty" value="1" onkeyup="if(value<0) value=0;calculatePrice(`+i+`)" onchange="if(value<0) value=0;calculatePrice(`+i+`)">
            </td>   
            
            <td>
                <input type="text" name="price_per_carton[]" readonly class="form-control" required id="price_per_carton`+i+`" placeholder="Price per Carton">
            </td>                             
            <td>
                <input type="text" readonly required name="total_price[]" id="total_price`+i+`" class="form-control total_price" placeholder="Total Product Price" value="">
            </td>
            <td>
                <a class="btn btn-sm btn-success actionTimebtn addNewTime" id="addNew`+i+`">+</a>
                <a class="btn btn-sm btn-danger actionTimebtn removeTimePrice" onclick="removeRow(`+i+`)" id="removeNew`+i+`">X</a>
            </td>
        </tr>
        `;

        $('#timePriceTable').append(toAppend);
        i++;
    });

    
    function removeRow(i){
        // alert(i);
        var count_tr_pro = $('.tr_pro').length;        
        // alert(count_tr_pro);
        if(count_tr_pro > 1){
            var total_price = $('#total_price'+i).val();
            var total_po_price = $('#total_po_price').html();
            var now_po_price = (total_po_price - total_price);
            // alert(now_po_price)
            $('#tr_'+i).remove();
            $('#total_po_price').html(now_po_price);
        }        
    }

    function financial(x) {
        return Number.parseFloat(x).toFixed(2).replace(/[.,]00$/, "");
    }

    function calculatePrice(number)
    {
        // alert(number);
        /* Clear previous output */   
        // $('#total_price'+number).val('');

        /* Calculate new entry */
        var pcs = $('#pcs'+number).val();
        var piece_price = $('#piece_price'+number).val();
        var qty = $('#qty'+number).val();

        var price_per_carton = (pcs * piece_price) ; 
        $('#price_per_carton'+number).val(price_per_carton);

        var new_price_per_ctn = $('#price_per_carton'+number).val();
        var totalPrice = (new_price_per_ctn * qty);
        // var productPrice = (price_per_carton / pcs);
        totalPrice = financial(totalPrice);
        $('#total_price'+number).val(totalPrice);
        
        var sumPO = 0;
        $('.total_price').each(function(){
            sumPO += parseFloat($(this).val());
        });
        $('#total_po_price').text(sumPO);

        // alert(sumPO);
        
    }

    
    function getProductDetail(product, count) {
        var opt = product.options[product.selectedIndex];
        var productId = opt.dataset.id;
        console.log(productId);
        
        var url = '{{ route("admin.product.viewDetail", ":id") }}';
        url = url.replace(':id', productId);

        $.ajax({
            type:'get',
            url,
            success:function(data) {
                console.log(data);
                console.log(data.id);
                $("#product_id" + count).val(data.id);
                $("#hsn_code" + count).val(data.hsn_code);
                $("#pcs" + count).val(data.pcs);
                $('#unit_type'+count).val(data.unit_type);
                $('#piece_price'+count).val(data.cost_price);

                var piece_price = $('#piece_price'+count).val();
                var  qty = $('#qty'+count).val();
                var pcs = $('#pcs'+count).val();

                var price_per_carton = (pcs * piece_price) ; 
                $('#price_per_carton'+count).val(price_per_carton);

                var new_price_per_ctn = $('#price_per_carton'+count).val();
                var totalPrice = (new_price_per_ctn * qty);
                totalPrice = financial(totalPrice);

                // $('#price_per_carton'+count).val(data.cost_price);
                // var price_per_carton = $('#price_per_carton'+count).val();
                $('#total_price'+count).val(totalPrice);
                
                $('#removeNew'+count).show();

                var sumPO = 0;
                $('.total_price').each(function(){
                    sumPO += parseFloat($(this).val());
                });
                $('#total_po_price').text(sumPO);

            }
        });
    }

    function getProductByName(name, count) {  
        if(name.length > 0) {
            $.ajax({
                url: "{{ route('admin.product.searchByName') }}",
                method: 'post',
                data: {
                    '_token': '{{ csrf_token() }}',
                    term: name
                },
                success: function(result) {
                    // console.log(result);
                    var content = '';
                    if (result.length > 0) {
                        content += `<div class="dropdown-menu show w-100 product-dropdown select-md" aria-labelledby="dropdownMenuButton">`;

                        $.each(result, (key, value) => {
                            content += `<a class="dropdown-item" href="javascript: void(0)" onclick="fetchProduct('${count}',${value.id},'${value.name}','${value.hsn_code}','${value.pcs}','${value.cost_price}')">${value.name}</a>`;
                        })
                        content += `</div>`;
                        // $($this).parent().after(content);
                    } else {
                        content += `<div class="dropdown-menu show w-100 product-dropdown select-md" aria-labelledby="dropdownMenuButton"><li class="dropdown-item">No product found</li></div>`;
                    }
                    $('#respDrop'+count).html(content);
                }
            });
        }   else {
            $('.product-dropdown').hide()
        }   
        
    }

    function fetchProduct(count,id,name,hsn_code,pcs,cost_price) {
        $('.product-dropdown').hide()
        $('#product_name'+count).val(name);
        $('#product_id'+count).val(id);
        // $('#product_name_'+count).val(name);

        $("#hsn_code" + count).val(hsn_code);
        $("#pcs" + count).val(pcs);
        $('#piece_price'+count).val(cost_price);

        var piece_price = $('#piece_price'+count).val();
        var  qty = $('#qty'+count).val();
        var pcs = $('#pcs'+count).val();

        var price_per_carton = (pcs * piece_price) ; 
        $('#price_per_carton'+count).val(price_per_carton);

        var new_price_per_ctn = $('#price_per_carton'+count).val();
        var totalPrice = (new_price_per_ctn * qty);
        totalPrice = financial(totalPrice);

        $('#total_price'+count).val(totalPrice);        
        $('#removeNew'+count).show();

        var sumPO = 0;
        $('.total_price').each(function(){
            sumPO += parseFloat($(this).val());
        });
        $('#total_po_price').text(sumPO);
        
    }

</script>
@endsection
