@extends('admin.layouts.app')
@section('page', 'Create Product')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Master</li>
        <li><a href="{{ route('admin.product.index') }}">Product</a> </li>
        <li>Create Product</li>
    </ul>
    <form id="myForm" method="post" action="{{ route('admin.product.store') }}" enctype="multipart/form-data">@csrf
        <div class="row">
            <div class="col-sm-9">

                <div class="row mb-3">                
                    <div class="col-sm-6">
                        <select class="form-control" name="cat_id" id="cat_id">
                            <option value="" hidden selected>Select category</option>
                            @foreach ($categories as $index => $item)
                                <option value="{{$item->id}}" @if(old('cat_id') == $item->id) selected @endif >{{ $item->name }}</option>
                            @endforeach
                        </select>
                        @error('cat_id') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>

                    <div class="col-sm-6">
                        <select class="form-control" name="sub_cat_id" id="sub_cat_id">
                            <option value="" hidden selected>Select sub category</option>
                            
                        </select>
                        @error('sub_cat_id') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>

                    
                </div>

                <div class="row mb-3">
                    <div class="col-sm-8">
                        <input type="text" name="name" placeholder="Add Product Name" class="form-control" value="{{old('name')}}" maxlength="150">
                        @error('name') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="col-sm-4">
                        <input type="text" name="hsn_code" placeholder="Add Product HSN Code" class="form-control" value="{{old('hsn_code')}}">
                        @error('hsn_code') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                </div>
                

                <div class="card shadow-sm">
                    <div class="card-header">
                        Short Description
                    </div>
                    <div class="card-body">
                        <textarea id="product_short_des" name="short_desc">{{old('short_desc')}}</textarea>
                        @error('short_desc') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-header">
                        Description
                    </div>
                    <div class="card-body">
                        <textarea id="product_des" name="desc">{{old('desc')}}</textarea>
                        @error('desc') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-header">
                        GST Section
                    </div>
                    <div class="card-body pt-0">                    
                        <div class="admin__content">
                            <aside>
                                <nav>GST Details (In Percent)</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">IGST (%)</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" min="1" id="igst" class="form-control"   name="igst" value="{{ old('igst') }}">
                                        @error('igst') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">CGST (%)</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="cgst" readonly class="form-control"  min="1" name="cgst"  value="{{ old('cgst') }}">
                                        @error('cgst') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">SGST (%)</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="sgst" readonly class="form-control" min="1"  name="sgst"  value="{{ old('sgst') }}">
                                        @error('sgst') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>                                
                            </content>
                        </div>                        
                    </div>
                </div>

                <div class="card shadow-sm">
                    <div class="card-header">
                        Carton
                    </div>
                    <div class="card-body pt-0">                    
                        <div class="admin__content">
                            <aside>
                                <nav>Unit</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">Value</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="" class="form-control" min="1" oninput="this.value = Math.abs(this.value)" aria-describedby="priceHelpInline" name="unit_value" value="{{old('unit_value')}}">
                                        @error('unit_value') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">Type</label>
                                    </div>
                                    <div class="col-auto">                                    
                                        <select name="unit_type" id="unit_type" class="form-control" value="{{old('unit_type')}}">
                                        @if (!empty($units))
                                        @foreach ($units as $unit)
                                            <option value="{{$unit->value}}">{{$unit->name}}</option>
                                        @endforeach                                           
                                        @endif
                                        </select>

                                        @error('unit_type') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>                                
                            </content>
                        </div>
                        <div class="admin__content">
                            <aside>
                                <nav>Weight</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">Value</label>
                                    </div>
                                    <div class="col-auto">
                                        <input type="text" id="" class="form-control" min="1" aria-describedby="priceHelpInline" name="weight_value" value="{{old('weight_value')}}" onkeypress="validateNum(event)">
                                        @error('weight_value') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="inputprice6" class="col-form-label">Type</label>
                                    </div>
                                    <div class="col-auto">
                                        <select name="weight_type" id="weight_type" class="form-control" value="{{old('weight_type')}}">
                                            <option value="kg">KG</option>
                                            <option value="g">G</option>
                                        </select>

                                        @error('weight_type') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>                                
                            </content>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="col-sm-3">
                <div class="card shadow-sm">            
                    <div class="card-body text-end">
                        <a href="{{ route('admin.product.index') }}" class="btn btn-sm btn-danger">Back</a>
                        <button id="submitBtn" type="submit" class="btn btn-sm btn-success">Add </button>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        Product Main Image
                    </div>
                    <div class="card-body">
                        <div class="w-100 product__thumb">
                        <label for="thumbnail"><img id="output" src="{{ asset('admin/images/placeholder-image.jpg') }}"/></label>
                        @error('image') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                        <input type="file" id="thumbnail" accept="image/*" name="image" onchange="loadFile(event)" class="d-none">
                        <script>
                        var loadFile = function(event) {
                            var output = document.getElementById('output');
                            output.src = URL.createObjectURL(event.target.files[0]);
                            output.onload = function() {
                            URL.revokeObjectURL(output.src) // free memory
                            }
                        };
                        </script>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        More product images
                    </div>
                    <div class="card-body">
                        <input type="file" accept="image/*" name="product_images[]" multiple>
                        @error('product_images') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                </div>

                
            </div>
        </div>
    </form>
</section>
@endsection

@section('script')
<script>

    $('#igst').on('keyup', function(){
        var igst = $('#igst').val();
        rest_gst = (igst / 2);
        $('#cgst').val(rest_gst);
        $('#sgst').val(rest_gst);
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

    $(document).ready(function(){
        $("#myForm").submit(function() {
            // $('input').attr('disabled', 'disabled');
            $('#submitBtn').attr('disabled', 'disabled');
            return true;
        });
    })
    ClassicEditor
    .create( document.querySelector( '#product_des' ) )
    .catch( error => {
        console.error( error );
    });
    ClassicEditor
    .create( document.querySelector( '#product_short_des' ) )
    .catch( error => {
        console.error( error );
    });

    $('#cat_id').on('change', function(){
        // alert(this.value);
        $.ajax({
            url: "{{ route('admin.product.subcategoriesByCategory') }}",
            dataType: 'json',
            type: 'post',
            data: {
                "_token": "{{ csrf_token() }}",
                "cat_id": this.value
            },
            success: function(data){
                console.log(data);
                var subcatHTML = ``;
                subcatHTML += `<option value="" hidden selected>Select sub category</option>`;
                for(var i=0; i < data.length; i++){
                    subcatHTML += `<option value="`+data[i].id+`">`+data[i].name+`</option>`;
                }

                $('#sub_cat_id').html(subcatHTML);
            }
        });

    });
</script>
@endsection
