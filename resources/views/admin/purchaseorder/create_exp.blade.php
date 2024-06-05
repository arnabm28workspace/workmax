@extends('admin.layouts.app')
@section('page', 'Create Purchase Order')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Purchase Order</li>
        <li><a href="{{ route('admin.purchaseorder.index') }}">All POs</a></li>
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
                <div class="row mb-3">
                    <div class="col-sm-4">
                        <select class="form-control"  name="supplier_id" id="supplier_id">
                        <option  value="">Select supplier...</option>
                        @foreach ($suppliers as $index => $item)
                        <option value="{{$item->id}}" {{ old('supplier_id') ?? (old('supplier_id') == $item->id) ? 'selected' : ''}} >{{ $item->name }}</option>
                        @endforeach
                        </select>
                        {{-- @error('supplier_id') <p class="small text-danger">{{ $message }}</p> @enderror --}}
                    </div>
                </div>

                <input type="hidden" required name="unique_id" id="unique_id">

                <div class="card shadow-sm">
                    <div class="card-header">
                    Details
                    </div>
                    <div class="card-body pt-0">
                        <div class="admin__content">
                            <aside>
                                <nav>Address</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputPassword6" class="col-form-label">Address</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" readonly name="address" value="{{ $app_settings->po_order_address }}">
                                        
                                    </div>
                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputPassword6" class="col-form-label">city</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" readonly name="city" value="{{ $app_settings->po_order_city }}">
                                        
                                    </div>
                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputPassword6" class="col-form-label">state</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" readonly name="state" value="{{ $app_settings->po_order_state }}">
                                        
                                    </div>
                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputPassword6" class="col-form-label">country</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" readonly name="country" value="{{ $app_settings->po_order_city }}">
                                        
                                    </div>
                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputPassword6" class="col-form-label">pin</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" readonly name="pin" value="{{ $app_settings->po_order_pin }}">
                                        
                                    </div>
                                    
                                </div>
                            </content>
                        </div>
                    </div>
                </div>
                <table class="table table-sm" id="timePriceTable">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>HSN Code</th>
                            <th>Unit / Carton</th>
                            <th>Unit</th>
                            <th>Cost Price</th>
                            <th>Cartons Quantity</th>
                            <th colspan="2">Total Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(old('addmore'))  
                            {{ 'Count:- '.count(old('addmore')) }}
                            @for( $i =1; $i < count(old('addmore')); $i++ ) 
                                {{ old('addmore.'.$i.'.product_id') }}                     
                            <tr id="tr_{{$i}}" class="tr_pro">
                                <td>                                        
                                    <select name="addmore[{{$i}}][product]"   id="product_name{{$i}}" class="form-control product-dropdown" placeholder="Product name" onchange="getProductDetail(this, {{$i}})">
                                        <option value="" hidden>-select-</option>
                                        @foreach ($products as $item)
                                            <option @if(old('addmore.'.$i.'.product') == $item->id) selected @endif value="{{$item->name}}" data-id="{{$item->id}}">{{$item->name}}</option>
                                        @endforeach
                                    </select>
                                    <input type="hidden" name="addmore[{{$i}}][product_id]" id="product_id{{$i}}" value="{{ old('addmore.'.$i.'.product_id') }}">
                                </td>
                                <td>
                                    <input type="text"  name="addmore[{{$i}}][hsn_code]" id="hsn_code{{$i}}" class="form-control" value="{{ old('addmore.'.$i.'.hsn_code') }}" >
                                </td>
                                <td>
                                    <input type="text" onkeypress="validateNum(event)" name="addmore[{{$i}}][unit_value]" id="unit_value{{$i}}" class="form-control" value="{{ old('addmore.'.$i.'.unit_value') }}" >
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="addmore[{{$i}}][unit_type]" id="unit_type{{$i}}" value="{{ old('addmore.'.$i.'.unit_type') }}" readonly>
                                </td>
                                <td>
                                    <input type="text" onkeypress="validateNum(event)"  name="addmore[{{$i}}][unit_price]" id="unit_price{{$i}}" class="form-control" placeholder="Product cost price" value="{{ old('addmore.'.$i.'.unit_price') }}" onkeyup="calculate({{$i}})">
                                </td>                                    
                                <td>
                                    <input type="number" onkeypress="validateNum(event)"  name="addmore[{{$i}}][qty]" id="qty{{$i}}" min="{{$i}}" class="form-control" placeholder="Product qty" value="{{$i}}" onkeyup="calculate({{$i}})" onchange="calculate({{$i}})">
                                </td>                                    
                                <td>
                                    <input type="text" readonly  name="addmore[{{$i}}][total_price]" id="total_price{{$i}}" class="form-control" placeholder="Product total price" value="{{ old('addmore.'.$i.'.total_price') }}">
                                </td>
                                <td id="btn_td_{{$i}}">
                                    <a class="btn btn-sm btn-success actionTimebtn addNewTime" id="addNew{{$i}}">+</a>
                                    <a class="btn btn-sm btn-danger actionTimebtn removeTimePrice" onclick="removeRow({{$i}})" id="removeNew{{$i}}">X</a>
                                </td>
                            </tr>
                                                          
                           @endfor
                        @else
                        <tr id="tr_1" class="tr_pro">
                            <td>                                        
                                <select name="addmore[1][product]"   id="product_name1" class="form-control product-dropdown" placeholder="Product name" onchange="getProductDetail(this, 1)">
                                    <option value="" hidden>-select-</option>
                                    @foreach ($products as $item)
                                        <option value="{{$item->name}}" data-id="{{$item->id}}">{{$item->name}}</option>
                                    @endforeach
                                </select>
                                <input type="hidden" name="addmore[1][product_id]" id="product_id1" value="">
                            </td>
                            <td>
                                <input type="text"  name="addmore[1][hsn_code]" id="hsn_code1" class="form-control" value="" >
                            </td>
                            <td>
                                <input type="text" onkeypress="validateNum(event)" name="addmore[1][unit_value]" id="unit_value1" class="form-control" value="" >
                            </td>
                            <td>
                                <input type="text" class="form-control" name="addmore[1][unit_type]" id="unit_type1" value="" readonly>
                            </td>
                            <td>
                                <input type="text" onkeypress="validateNum(event)"  name="addmore[1][unit_price]" id="unit_price1" class="form-control" placeholder="Product cost price" value="" onkeyup="calculate(1)">
                            </td>                                    
                            <td>
                                <input type="number" onkeypress="validateNum(event)"  name="addmore[1][qty]" id="qty1" min="1" class="form-control" placeholder="Product qty" value="1" onkeyup="calculate(1)" onchange="calculate(1)">
                            </td>                                    
                            <td>
                                <input type="text" readonly  name="addmore[1][total_price]" id="total_price1" class="form-control" placeholder="Product total price" value="">
                            </td>
                            <td id="btn_td_1">
                                <a class="btn btn-sm btn-success actionTimebtn addNewTime" id="addNew1">+</a>
                                <a class="btn btn-sm btn-danger actionTimebtn removeTimePrice" onclick="removeRow(1)" id="removeNew1">X</a>
                            </td>
                        </tr>
                        @endif
                        
                    </tbody>
                </table>
                <div class="card shadow-sm">
                    <div class="card-body">                   
    
                        <div class="row mb-3 justify-content-end">
                            <div class="col-md-8"><p class="small text-muted mb-2">Total Pricing</p></div>
                            <div class="col-md-4 text-end">
                                <table class="w-100">
                                    <tr>
                                        <td><p class="small text-muted mb-0">Total Cost Price : </p></td>
                                        <td><p class="small text-dark mb-0 text-end">Rs 0</p></td>
                                    </tr>
                                    <tr>
                                        <td><p class="small text-muted mb-0">Total PO Price : </p></td>
                                        <td><p class="small text-dark mb-0 text-end"> Rs 0</p></td>
                                    </tr>
                                    {{-- <tr>
                                        <td><p class="small text-muted mb-0">Discount : </p></td>
                                        <td><p class="small text-dark mb-0 text-end">- Rs 0</p></td>
                                    </tr> --}}
                                    <tr class="border-top">
                                        <td><p class="small text-muted mb-0">Final Amount : </p></td>
                                        <td><p class="small text-dark mb-0 text-end">Rs 0</p></td>
                                    </tr>
                                </table>
                            </div>
    
                        </div>
    
                    </div>
                </div>           
                    
                <div class="card shadow-sm">
                    <div class="card-body">
                        <a href="{{ route('admin.purchaseorder.index') }}" class="btn btn-sm btn-danger">Back</a>
                        <button type="submit" class="btn btn-sm btn-success">Add</button>
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
        
        if(rowCount == 1){
            $('#removeNew1').hide();
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

    /*$('#supplier_id').on('change', function(){
        // console.log(this.value);
        var supplier_id = $('#supplier_id').val();
        $.ajax({
            url: "{{ route('admin.purchaseorder.getProductsSupplier') }}",
            dataType: 'JSON',
            type: 'POST',
            data: {
                'supplier_id': this.value,
                '_token': '{{ csrf_token() }}'
            },
            success: function(data){
                // console.log(data);
                var proHtml = ``;
                proHtml += `<option value="">Select a product</option>`;
                for(var i=0;i < data.length; i++){
                    proHtml += `<option value="`+data[i].id+`" data-id="`+data[i].id+`">`+data[i].name+`</option>`;
                }


                $('.product-dropdown').html(proHtml);

                
                
            }
        });
        console.log(`{{ url('admin/purchaseorder/create/`+supplier_id+`') }}`);
        window.location = `{{ url('admin/purchaseorder/create/`+supplier_id+`') }}`;
        // window.location.href = `"{{ url('admin/purchaseorder/create/`+supplier_id+`') }}"`;
        // window.location.replace("http://www.w3schools.com");
    });*/ 

    $("#unique_id").val(Date.now());
    var i = 2;
    $(document).on('click','.addNewTime',function(){
        var thisClickedBtn = $(this);
        
        var toAppend = `
        <tr id="tr_`+i+`" class="tr_pro">
            <td>
                <select  name="addmore[`+i+`][product]" id="product_name`+i+`" class="form-control product-dropdown" placeholder="Product name" onchange="getProductDetail(this, `+i+`)">
                    <option value="" hidden>-select-</option>

                    @foreach ($products as $item)
                        <option value="{{$item->name}}" data-id="{{$item->id}}">{{$item->name}}</option>
                    @endforeach
                </select>
                <input type="hidden" name="addmore[`+i+`][product_id]" id="product_id`+i+`">
            </td> 
            <td>
                <input type="text"  name="addmore[`+i+`][hsn_code]" id="hsn_code`+i+`" class="form-control" value="{{ old('addmore.`+i+`.hsn_code') }}" >
            </td> 
            <td>
                <input type="text" onkeypress="validateNum(event)" name="addmore[`+i+`][unit_value]" id="unit_value`+i+`" class="form-control" value="{{ old('addmore.`+i+`.unit_value') }}">
            </td>          
            <td>
                <input type="text" name="addmore[`+i+`][unit_type]" id="unit_type`+i+`" class="form-control" value="{{ old('addmore.`+i+`.unit_type') }}" readonly>
            </td>
            <td>
                <input type="text"  name="addmore[`+i+`][unit_price]" id="unit_price`+i+`" class="form-control" onkeypress="validateNum(event)" value="{{ old('addmore.`+i+`.unit_price') }}" placeholder="Product cost price" onkeyup="calculate(`+i+`)">
            </td>
            <td>
                <input type="number" onkeypress="validateNum(event)"  name="addmore[`+i+`][qty]" id="qty`+i+`" min="1" class="form-control" placeholder="Product qty" value="1" onkeyup="calculate(`+i+`)" onchange="calculate(`+i+`)">
            </td>   
            
            <td>
                <input type="text" readonly required name="addmore[`+i+`][total_price]" id="total_price`+i+`" class="form-control" placeholder="Product total price" value="{{ old('addmore.`+i+`.total_price') }}">
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
            $('#tr_'+i).remove();
        }
        
    }

    function calculate(number)
    {
        // alert(number);
        /* Clear previous output */   
        $('#total_price'+number).val('');

        /* Calculate new entry */

        var unit_price = $('#unit_price'+number).val();
        var qty = $('#qty'+number).val();

        var final_amount = (unit_price * qty);
        $('#total_price'+number).val(final_amount);
    }

    function getProductDetail(product, count) {
        var opt = product.options[product.selectedIndex];
        var productId = opt.dataset.id;
        console.log(productId);
        
        var url = '{{ route("product.detail.show", ":id") }}';
        url = url.replace(':id', productId);

        $.ajax({
            type:'get',
            url,
            success:function(data) {
                console.log(data);
                $("#product_id" + count).val(data?.data[0]?.id);
                $("#hsn_code" + count).val(data?.data[0]?.hsn_code);
                $("#unit_value" + count).val(data?.data[0]?.unit_value);
                $('#unit_type'+count).val(data?.data[0]?.unit_type);
                $('#unit_price'+count).val(data?.data[0]?.threshold_price);

                var unit_price = $('#unit_price'+count).val();
                var  qty = $('#qty'+count).val();
                var final_amount = (unit_price * qty);
                $('#total_price'+count).val(final_amount);
                
                $('#removeNew'+count).show();
                
                
            }
        });
    }

    // var exists = false; 
    // $('.product-dropdown  option').each(function(){
    // if (this.value == productId) {
    //     exists = true;
    // }
    // });
</script>
@endsection
