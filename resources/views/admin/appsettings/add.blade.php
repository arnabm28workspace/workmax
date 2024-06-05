@extends('admin.layouts.app')
@section('page',  'App Settings')
@section('content')
<section>
    @if (Session::has('message'))
    <div class="alert alert-success" role="alert">
        {{ Session::get('message') }}
    </div>
    @endif
    <form method="post" action="{{ route('admin.appsettings.save') }}">
        @csrf
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group mb-3">         
                    @error('type') <p class="small text-danger">{{ $message }}</p> @enderror
                </div>
                <div class="card shadow-sm">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group mb-3">
                                <label for="">Website Name <span class="text-danger">*</span></label>
                                <input type="text" name="website_name" placeholder="" class="form-control" value="{{$data->website_name}}">
                                    @error('website_name') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>                    
                        <div class="col-sm-6">
                            <div class="form-group mb-3">
                                <label class="label-control">Website Link <span class="text-danger">*</span></label>
                                <input type="text" name="website_link" placeholder="" class="form-control" value="{{$data->website_link}}">
                                @error('website_link') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="card-header">
                            Sales Order
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group mb-3">
                                <label for="">Product Sales Price Threshold Percentage <span class="text-danger">*</span></label>
                                <input type="text" maxlength="2"  name="product_sales_price_threshold_percentage" onkeypress="validateNum(event)"  placeholder="" class="form-control" value="{{$data->product_sales_price_threshold_percentage}}">
                                @error('product_sales_price_threshold_percentage') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div> 
                        {{-- <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label for="">State GST <span class="text-danger">*</span></label>
                                <input type="number" min="1" name="sgst_percentage" placeholder="" class="form-control" value="{{$data->sgst_percentage}}">
                                @error('sgst_percentage') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>                    
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label class="label-control">Central GST <span class="text-danger">*</span></label>
                                <input type="number" min="1" name="cgst_percentage" placeholder="" class="form-control" value="{{$data->cgst_percentage}}">
                                @error('cgst_percentage') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div> --}}
                    </div>    
                    <div class="row">
                        <div class="card-header">
                            Payment Commission For Staff
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label for="">Commission Percentage<span class="text-danger">*</span></label>
                                <input type="text" maxlength="5" name="staff_payment_incentive" placeholder="" class="form-control" value="{{$data->staff_payment_incentive}}" onkeypress="validateNum(event)">
                                @error('staff_payment_incentive') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>                    
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label class="label-control">Order Collector Percentage<span class="text-danger">*</span></label>
                                <input type="text" maxlength="5" name="order_collector_commission" placeholder="" class="form-control" value="{{$data->order_collector_commission}}" onkeypress="validateNum(event)">
                                @error('order_collector_commission') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label class="label-control">Payment Creator Percentage<span class="text-danger">*</span></label>
                                <input type="number" maxlength="5" name="payment_collector_commission" placeholder="" class="form-control" value="{{$data->payment_collector_commission}}" onkeypress="validateNum(event)">
                                @error('payment_collector_commission') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        PO Address
                    </div>
                    <div class="card-body pt-0">
                        <div class="admin__content">
                            <aside>
                                <nav>Depot Address</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">Address <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" id="billing_addr" class="form-control" aria-describedby="priceHelpInline" name="po_order_address" value="{{$data->po_order_address}}">
                                        @error('po_order_address') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                                             
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">City <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" id="po_order_city" class="form-control" aria-describedby="priceHelpInline" name="po_order_city" value="{{$data->po_order_city}}">
                                        @error('po_order_city') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">State <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" id="po_order_state" class="form-control" aria-describedby="priceHelpInline" name="po_order_state" value="{{$data->po_order_state}}">
                                        @error('po_order_state') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>                                
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">Country <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" id="po_order_country" class="form-control" aria-describedby="priceHelpInline" name="po_order_country" value="{{$data->po_order_country}}">
                                        @error('po_order_country') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="" class="col-form-label">PIN <span class="text-danger">*</span></label>
                                    </div>
                                    <div class="col-8">
                                        <input type="text" id="po_order_pin" class="form-control" aria-describedby="priceHelpInline" name="po_order_pin" value="{{$data->po_order_pin}}" onkeypress="validateNum(event)" maxlength="10">
                                        @error('po_order_pin') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                            </content>
                        </div>                                                
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="row">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-sm btn-success">Save </button>                            
                        </div>
                    </div>                    
                </div>
            </div>            
        </div>
    </form>
</section>
@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('div.alert').delay(5000).slideUp(300);
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
    </script>
@endsection
