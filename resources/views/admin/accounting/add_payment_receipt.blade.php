@extends('admin.layouts.app')
@section('page', 'Add Payment Receipt')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li><a href="{{ route('admin.paymentcollection.index') }}">Payment Collection</a></li>
        <li>Add Payment Receipt</li>
    </ul>
    <div class="row">
        <div class="col-md-12">
            {{-- @if($errors->any())                     
                {!! implode('', $errors->all('<p class="small text-danger">:message</p>')) !!}
            @endif             --}}
            @if (Session::has('message'))
            <div class="alert alert-success" role="alert">
                {{ Session::get('message') }}
            </div>
            @endif
            <form id="payment_form" action="{{ route('admin.accounting.save_payment_receipt') }}" method="POST">
                @csrf   
                <input type="hidden" name="payment_collection_id" value="{{$paymentCollectionId}}">             
                <div class="row">                    
                    <div class="col-sm-4">                        
                        <div class="form-group mb-3">
                            <label for="" id="">Store <span class="text-danger">*</span></label>
                            <input type="hidden" name="store_id" value="{{ $payment_collection->store_id }}">
                            <input type="text" name="" value="{{ $payment_collection->store_name }}" class="form-control"  id="store_name" readonly>   
                        </div>
                        <div class="respDrop"></div>
                    </div>  
                    <div class="col-sm-4">                        
                        <div class="form-group mb-3">
                            <label for="" id="">Staff <span class="text-danger">*</span></label>
                            <input type="hidden" name="staff_id" value="{{ $payment_collection->user_id }}">
                            <input type="text" name="" value="{{ $payment_collection->staff_name }}" class="form-control"  id="store_name" readonly>  
                        </div>
                        <div class="respDrop"></div>
                    </div>                    
                    <div class="col-sm-4">
                        <div class="form-group mb-3">
                            <label for="">Amount <span class="text-danger">*</span></label>
                            <input type="text" value="{{ $payment_collection->collection_amount }}" maxlength="20" name="amount" readonly class="form-control" onkeypress='validateNum(event)'>
                            @error('amount') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                    </div> 
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group mb-3">
                            <label for="">Voucher No</label>
                            <input type="text" value="@if (!empty(old('voucher_no'))) {{old('voucher_no')}} @else {{'PAYRECEIPT'.time()}} @endif" name="voucher_no" readonly class="form-control">
                        </div>
                    </div>
                    @php
                        // $paymentDate = str_replace('/', '-', $payment_collection->cheque_date);                        
                        // $paymentDate = date('Y-m-d', strtotime($paymentDate));
                        $paymentDate = $payment_collection->cheque_date;
                    @endphp
                    <div class="col-sm-4">
                        <div class="form-group mb-3">
                            <label for="">Date <span class="text-danger">*</span></label>
                            <input type="date" name="payment_date" id="payment_date" class="form-control" value="{{ $paymentDate }}"  readonly>
                            @error('payment_date') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                    </div> 
                    <div class="col-sm-4">
                        <input type="hidden" name="payment_mode" value="{{ $payment_collection->payment_type }}">
                        <div class="form-group mb-3">
                            <label for="">Mode of Payment <span class="text-danger">*</span></label>
                            <select name="payment_mode" class="form-control" disabled  id="payment_mode">
                                <option value="">Select One</option>
                                <option value="cheque" @if($payment_collection->payment_type == 'cheque') selected @endif>Cheque</option>
                                <option value="neft" @if($payment_collection->payment_type == 'neft') selected @endif>NEFT</option>
                                <option value="cash" @if($payment_collection->payment_type == 'cash') selected @endif>Cash</option>
                            </select>
                            @error('payment_mode') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                    </div>
                </div>
                <div class="row" id="noncash_sec">                    
                    <div class="col-sm-6">
                        <div class="form-group mb-3">
                            <label for="">Cheque No / UTR No </label>
                            <input type="text" readonly value="{{ $payment_collection->cheque_number }}" name="chq_utr_no" class="form-control" maxlength="100">
                            @error('chq_utr_no') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group mb-3">
                            <label for="">Bank Name </label>
                            <div id="bank_search">
                                <input type="text" id="" value="{{ $payment_collection->bank_name }}" name="bank_name" readonly class="form-control" maxlength="200">
                                
                            </div>                                                      
                        </div>
                    </div>                    
                </div>
                         
                <div class="row">
                    <div class="form-group">
                        <a href="{{ route('admin.paymentcollection.index') }}" class="btn btn-sm btn-danger">Back</a>
                        <button type="submit" id="submit_btn" class="btn btn-sm btn-success">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<script>
    $('#store_name').on('keyup keydown keypress', function(){
        if(this.value.length > 0){
            console.log(this.value);
            $.ajax({
                url: "{{ route('admin.ledger.getUsersByType', ['type'=>'store']) }}",
                method: 'post',
                data: {
                    '_token': '{{ csrf_token() }}',
                    term: this.value,
                },
                success: function(result) {

                    console.log(result);
                    var content = '';
                    if (result.length > 0) {
                        content += `<div class="dropdown-menu show w-100 user-dropdown" aria-labelledby="dropdownMenuButton">`;

                        $.each(result, (key, value) => {
                            content += `<a class="dropdown-item" href="javascript: void(0)" onclick="fetchCode(${value.id},'${value.name}')">${value.name}</a>`;
                        })
                        content += `</div>`;
                        // $($this).parent().after(content);
                    } else {
                        content += `<div class="dropdown-menu show w-100 user-dropdown" aria-labelledby="dropdownMenuButton"><li class="dropdown-item">No store found</li></div>`;
                    }
                    $('.respDrop').html(content);
                }
            });
        }else{
            // alert('0')
            $('.respDrop').text('');
            $('#store_id').val(0);
        }
    });

    function fetchCode(id,name) {
        $('.user-dropdown').hide()
        $('input[name="store_id"]').val(id)
        $('input[name="store_name"]').val(name)
    }

    $('#payment_mode').on('change', function(){
        console.log(this.value);
        if(this.value == 'cash'){
            $('#noncash_sec').hide();
        }else{
            $('#noncash_sec').show();
        }
    });

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

    function getBankList(evt)
    {        
        if(evt.length > 0){
            // console.log(evt);
            $.ajax({
                url: "{{ route('admin.ledger.getBankList') }}",
                method: 'post',
                data: {
                    '_token': '{{ csrf_token() }}',
                    term: evt
                },
                success: function(result) {

                    // console.log(result);
                    var content = '';
                    if (result.length > 0) {
                        content += `<div class="dropdown-menu show w-100 bankname-dropdown" aria-labelledby="dropdownMenuButton">`;

                        $.each(result, (key, value) => {
                            content += `<a class="dropdown-item" href="javascript: void(0)" onclick="fetchBankName('${value.name}')">${value.name}</a>`;
                        })
                        content += `</div>`;
                        // $($this).parent().after(content);
                    } else {
                        content += `<div class="dropdown-menu show w-100 bankname-dropdown" aria-labelledby="dropdownMenuButton"><li class="dropdown-item">No bank found</li></div>`;
                    }
                    $('.resBankProp').html(content);
                }
            });
        }else{
            $('.resBankProp').text('');
            
        }
    }

    function fetchBankName(name)
    {
        // alert(name);
        if(name != ' - OTHERS -'){
            $('.bankname-dropdown').hide();
            $('#bank_name').val(name);
            $('.bank_name').val(name);
        }else{
            $('#bank_search').hide();
            $('#bank_custom').show();
        }
        
    }

    $('#allbankothers').on('click', function(){
        
        $('#bank_custom').hide();
        $('#bank_search').show();
    });

    // $('#submit_btn').on('click', function(){
        
    //     $('#payment_form').submit();
    //     $('#submit_btn').prop('disabled', true);
    //     return true;
    // })

    $("#payment_form").submit(function() {
        // $('input').attr('disabled', 'disabled');
        $('#submit_btn').attr('disabled', 'disabled');
        return true;
    });

</script>
@endsection
