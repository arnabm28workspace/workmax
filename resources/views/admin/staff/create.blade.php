@extends('admin.layouts.app')
@section('page', 'Create Staff')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Master</li>
        <li>Staff Management</li>
        <li><a href="{{ route('admin.staff.index') }}">Staff</a></li>
        <li>Create Staff</li>
    </ul>
    <form id="myForm" method="post" action="{{ route('admin.staff.store') }}" enctype="multipart/form-data">@csrf
        <div class="row">
            <div class="col-sm-9">
                <div class="card shadow-sm">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label for="">Designition <span class="text-danger">*</span></label>
                                <select name="designation" id="" class="form-control">
                                    <option value="">Select a designation</option>
                                    @forelse ($designation as $d)
                                        <option value="{{ $d->id }}">{{$d->name}}</option>
                                    @empty
                                        
                                    @endforelse
                                </select>
                                @error('designation') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div> 
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label for="">Person Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" placeholder="Person Name" class="form-control" value="{{old('name')}}" maxlength="200">
                                @error('name') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group mb-3">
                                <label for="">Email</label>
                                <input type="email" name="email" placeholder="Staff email" class="form-control" value="{{old('email')}}">
                                @error('email') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">                    
                        
                        <div class="col-sm-4">
                            <div class="form-group  mb-3">
                                <label for="">Mobile</label>
                                <input type="text" name="mobile" id="mobile" placeholder="Staff mobile" class="form-control" value="{{old('mobile')}}" onkeypress="validateNum(event)" maxlength="10">
                                
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <input type="hidden" name="is_wa_same" id="checkWhatsappHidden" value="0">
                            <div class="form-group mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="1" name="is_wa_same" id="checkWhatsappSame">
                                    <label class="form-check-label" for="checkWhatsappSame">
                                        Same as Phone Number
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group  mb-3">
                                <label for="">Whatsapp <span class="text-danger">*</span></label>
                                <input type="text" name="whatsapp_no" id="whatsapp_no" placeholder="Staff whatsapp no" class="form-control" value="{{old('whatsapp_no')}}" onkeypress="validateNum(event)" maxlength="10">
                                @error('whatsapp_no') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group mb-3">
                                <label for="">Aadhaar Number <span class="text-danger">*</span></label>
                                <input type="text" maxlength="12" name="aadhar_no" placeholder="Staff Aadhaar Number" class="form-control" value="{{old('aadhar_no')}}" onkeypress="validateNum(event)">
                                @error('aadhar_no') <p class="small text-danger">{{ $message }}</p> @enderror
                            </div>
                        </div>                                                                 
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        Other Details
                    </div>
                    <div class="card-body pt-0">
                        <div class="admin__content">
                            <aside>
                                <nav>Banking</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="account_holder_name" class="col-form-label">A/C Holder Name</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="account_holder_name" class="form-control"  name="account_holder_name" value="{{ old('account_holder_name') }}" maxlength="20">
                                        @error('account_holder_name') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="bank_name" class="col-form-label">Bank Name</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="bank_name" class="form-control"  name="bank_name" value="{{ old('bank_name') }}" maxlength="20">
                                        @error('bank_name') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="branch_name" class="col-form-label">Branch Name</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="branch_name" class="form-control"  name="branch_name" value="{{ old('branch_name') }}" maxlength="20">
                                        @error('branch_name') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="bank_account_no" class="col-form-label">Account No</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="bank_account_no" class="form-control"  name="bank_account_no" value="{{ old('bank_account_no') }}" maxlength="20">
                                        @error('bank_account_no') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="ifsc" class="col-form-label">IFSC</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="text" id="ifsc" class="form-control"  name="ifsc" value="{{ old('ifsc') }}" maxlength="15">
                                        @error('ifsc') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>                                
                            </content>
                        </div>
                        <div class="admin__content">
                            <aside>
                                <nav>Salary & Allowance</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="monthly_salary" class="col-form-label">Salary (In 30 days)</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" pattern="^\d*(\.\d{0,2})?$"  id="monthly_salary" class="form-control"  name="monthly_salary" value="{{old('monthly_salary')}}" maxlength="10" onkeypress="validateNum(event)">
                                        @error('monthly_salary') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                    <div class="col-3 text-end">
                                        <label for="daily_salary" class="col-form-label">Salary (Per Day)</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" id="daily_salary" readonly class="form-control" value="{{old('daily_salary')}}" name="daily_salary" maxlength="10">
                                        @error('daily_salary') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>                                    
                                </div>
                                
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="travelling_allowance" class="col-form-label"> Travelling Allowance (Per KM) </label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" pattern="^\d*(\.\d{0,2})?$" id="travelling_allowance" class="form-control"  name="travelling_allowance" value="{{old('travelling_allowance')}}" maxlength="10" onkeypress="validateNum(event)">
                                        @error('travelling_allowance') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>
                                
                            </content>
                        </div>
                        <div class="admin__content">
                            <aside>
                                <nav>Address</nav>
                            </aside>
                            <content>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="address" class="col-form-label">Address</label>
                                    </div>
                                    <div class="col-9">
                                        <input type="text" id="address" class="form-control"  name="address" value="{{old('address')}}">
                                        @error('address') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="landmark" class="col-form-label">Landmark</label>
                                    </div>
                                    <div class="col-9">
                                        <input type="text" id="landmark" class="form-control"  name="landmark" value="{{old('landmark')}}">
                                        @error('landmark') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="state" class="col-form-label">State</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" id="state" class="form-control"  name="state" value="{{old('state')}}">
                                        @error('state') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                    <div class="col-3 text-end">
                                        <label for="city" class="col-form-label">City</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" id="city" class="form-control"  name="city" value="{{old('city')}}">
                                        @error('city') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>
                                <div class="row mb-2 align-items-center">
                                    <div class="col-3">
                                        <label for="pin" class="col-form-label">Pincode</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" id="pin" class="form-control"  name="pin" value="{{old('pin')}}" onkeypress="validateNum(event)">
                                        @error('pin') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                    <div class="col-3 text-end">
                                        <label for="country" class="col-form-label">Country</label>
                                    </div>
                                    <div class="col-3">
                                        <input type="text" id="country" class="form-control"  name="country" value="{{old('country')}}">
                                        @error('country') <p class="small text-danger">{{ $message }}</p> @enderror
                                    </div>
                                </div>                               
                            </content>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="card shadow-sm">
                    <div class="card-header">
                        Create Staff
                    </div>
                    <div class="card-body text-end">                    
                        <a href="{{ route('admin.staff.index') }}" class="btn btn-sm btn-danger">Back</a>
                        <button id="submitBtn" type="submit" class="btn btn-sm btn-success">Add </button>
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        Image
                    </div>
                    <div class="card-body">
                        <div class="w-100 product__thumb">
                        {{-- <label for="thumbnail"><img id="output" src="{{ asset('admin/images/placeholder-image.jpg') }}"/></label> --}}
                        @error('image') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                        <input type="file" id="thumbnail" accept="image/*" name="image">
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        User ID Front
                    </div>
                    <div class="card-body">
                        <div class="w-100 product__thumb">
                            {{-- <label for="thumbnail"><img id="output1" src="{{ asset('admin/images/placeholder-image.jpg') }}"/></label> --}}
                            @error('user_id_front') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                        <input type="file" id="thumbnail1" accept="image/*" name="user_id_front">
                    </div>
                </div>
                <div class="card shadow-sm">
                    <div class="card-header">
                        User ID Back
                    </div>
                    <div class="card-body">
                        <div class="w-100 product__thumb">
                        {{-- <label for="thumbnail"><img id="output2" src="{{ asset('admin/images/placeholder-image.jpg') }}"/></label> --}}
                        @error('user_id_back') <p class="small text-danger">{{ $message }}</p> @enderror
                        </div>
                        <input type="file" id="thumbnail2" accept="image/*" name="user_id_back">

                    </div>
                </div>

            </div>
        </div>
    </form>
</section>
@endsection

@section('script')
<script>
    function financial(x) {
        return Number.parseFloat(x).toFixed(2).replace(/[.,]00$/, "");
    }
    $(document).on('keydown', 'input[pattern]', function(e){
        var input = $(this);
        var oldVal = input.val();
        var regex = new RegExp(input.attr('pattern'), 'g');

        setTimeout(function(){
            var newVal = input.val();
            if(!regex.test(newVal)){
            input.val(oldVal); 
            }
        }, 1);        
    });

    $('#monthly_salary').on('keyup', function(){
        var monthly_salary = $('#monthly_salary').val();
        var daily_salary = (monthly_salary / 30);        
        $('#daily_salary').val(financial(daily_salary))
    })
    
    $(document).ready(function(){
        var contactWhatsapp = $('#whatsapp_no').val().length;

        if(contactWhatsapp >= 10){
            $('#submitBtn').prop('disabled',false);
            $('#checkWhatsappSame').attr('disabled',false);
        } else {
            $('#submitBtn').prop('disabled',true);
            $('#checkWhatsappSame').attr('disabled',true);
        }

        $("#myForm").submit(function() {
            // $('input').attr('disabled', 'disabled');
            $('#submitBtn').attr('disabled', 'disabled');
            return true;
        });
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

    $('#mobile').on('keyup', function(){
        var contactLength = $('#mobile').val().length;
        if(contactLength >= 10){
            $('#checkWhatsappSame').attr('disabled',false);
        }else{
            $('#checkWhatsappSame').attr('disabled',true);
        }
    })

    $('#whatsapp_no').on('keyup', function(){        
        var contactWhatsapp = $('#whatsapp_no').val().length;        
        if(contactWhatsapp >= 10){
            $('#submitBtn').prop('disabled',false);
        }else{
            $('#submitBtn').prop('disabled',true);
        }
    })

    $("input:checkbox#checkWhatsappSame").change(function() {
        var ischecked= $(this).is(':checked');
        var mobile = $('#mobile').val();
        var whatsapp_no = $('#whatsapp_no').val();  
        var checkWhatsappHidden = $('#checkWhatsappHidden').val();      

        if(ischecked){
            $('#whatsapp_no').val(mobile);  
            $('#whatsapp_no').prop('readonly', true);  
            $('#checkWhatsappHidden').val(1); 
            $('#submitBtn').prop('disabled',false);       
        }else{
            $('#whatsapp_no').val('');  
            $('#whatsapp_no').prop('readonly', false);   
            $('#checkWhatsappHidden').val(0);    
            $('#submitBtn').prop('disabled',true);    
        }       
    });
</script>
@endsection
