@extends('admin.layouts.app')
@section('page', 'Ledger')
@section('content')
<section>  
    <ul class="breadcrumb_menu">
        <li>Report</li>
        <li><a href="{{ route('admin.choose-ledger-user') }}">Ledger</a> </li>
    </ul> 
    @if (Session::has('message'))
    <div class="alert alert-success" role="alert">
        {{ Session::get('message') }}
    </div>
    @endif
    <form action="" id="ledgerForm">
    <div class="row">       
        <div class="col-12">
            <div class="row g-3 align-items-end">
                
                <div class="col-2">
                    <div class="form-group">
                        <label for="">Choose user type <span class="text-danger">*</span> </label>
                        <select name="user_type" id="user_type" class="form-control select-md" onchange="getUserTypes(this.value);">
                            <option value="" hidden selected>Select an option</option>
                            <option value="store" @if($user_type == 'store') selected @endif>Customer</option>  
                            <option value="staff" @if($user_type == 'staff') selected @endif>Staff</option>
                            <option value="partner" @if($user_type == 'partner') selected @endif>Partner</option>                                 
                        </select>  
                    </div>
                </div>
                <div class="col-2">
                    <div class="form-group">
                        <label for="" id="lable_user">
                            @if (empty($user_type))
                            Search user 
                            @else 
                                @if ($user_type == 'store')
                                    Customer
                                @else
                                    {{ucwords($user_type)}}    
                                @endif
                            @endif                    
                        </label> 
                        <span class="text-danger">*</span>                           
                        
                        <input type="hidden" name="staff_id" id="staff_id" value="{{ $staff_id }}">
                        <input type="hidden" name="store_id" id="store_id" value="{{ $store_id }}">
                        <input type="hidden" name="admin_id" id="admin_id" value="{{ $admin_id }}">
                        <input type="text" name="select_user_name" value="{{ $select_user_name }}" placeholder="Please choose user type first and type name of the user" class="form-control select-md"  id="select_user_name" onkeyup="getUsers(this.value);" >       
                    </div>
                    <div class="respDrop"></div>
                </div>
                <div class="col-2">
                    <div class="form-group">
                        <label for="">From</label>
                        <input type="date" name="from_date"  id="from_date" class="form-control select-md dates" value="{{ $from_date }}" @if(!empty($is_opening_bal)) min="{{ $opening_bal_date }}" @endif  max="{{ $to_date }}" placeholder="From" autocomplete="off">
                    </div>
                </div>
                <div class="col-2">
                    <div class="form-group">
                        <label for="">To</label>
                        <input type="date" name="to_date"  id="to_date" class="form-control select-md dates" value="{{ $to_date }}" placeholder="To" max="{{ date('Y-m-t', strtotime(date('Y-m-d'))) }}" min="{{ $from_date }}" autocomplete="off">  
                    </div>
                </div>
                <div class="col-2">
                    <div class="form-group">
                        <label for="">Bank / Cash</label>
                        <select name="bank_cash" onchange="this.form.submit();" id="bank_cash" class="form-control select-md dates">
                            <option value="" @if(empty($bank_cash)) selected @endif>All</option>
                            <option value="bank" @if($bank_cash == 'bank') selected @endif>Bank</option>
                            <option value="cash" @if($bank_cash == 'cash') selected @endif>Cash</option>
                        </select> 
                    </div>
                </div>
                <div class="col-auto ms-auto">
                    <span>Download As </span>
                    <a href="javascript:void(0)" onclick="downloadLedger('pdf');" class="btn btn-outline-success select-md">PDF</a>
                    <a href="javascript:void(0)" onclick="downloadLedger('csv');" class="btn btn-outline-success select-md">Excel</a>
                    <a href="{{ route('admin.choose-ledger-user') }}" class="btn btn-outline-danger select-md">Reset</a>
                </div>          
            </div>
        </div>               
    </div>
    </form>   
    <div class="row">
        <div class="col-sm-12">                             
            <table class="table table-sm table-hover ledger">
                <thead>
                    <tr> 
                        <th>Date</th>
                        <th>Transaction Id / Voucher No</th>
                        <th>Purpose</th>
                        <th>Debit</th>
                        <th>Credit</th>
                        <th>Closing</th>
                    </tr>
                </thead>
                <tbody id="ledger_body">
                    @php
                        $net_value = 0;
                        $cred_ob_amount = $deb_ob_amount = $zero_ob_amount = "";
                        $getCrDrOB = getCrDr($day_opening_amount);
                        if($getCrDrOB == 'Cr'){
                            $cred_ob_amount = $day_opening_amount;
                        } else if($getCrDrOB == 'Dr'){
                            $deb_ob_amount = $day_opening_amount;
                        } else if($getCrDrOB == ''){
                            $zero_ob_amount = "";
                        }
                        
                        if(!empty($is_opening_bal_showable)){
                            $net_value += $day_opening_amount;
                        }
                        
                        
                        
                    @endphp
                    @if (!empty($user_type) &&  (!empty($is_opening_bal_showable)))
                    <tr>
                        <td>{{ date('d/m/Y', strtotime($from_date)) }}</td>
                        <td></td>
                        <td>Opening Balance</td>
                        <td>
                            <span class="text-danger">{{ replaceMinusSign($deb_ob_amount) }}</span>
                        </td>
                        <td>
                            <span class="text-success">{{ $cred_ob_amount }}</span>
                        </td>
                        <td>                            
                            {{ replaceMinusSign($day_opening_amount) }} 
                            {{ getCrDr($day_opening_amount) }}
                        </td>
                    </tr>
                    
                    @endif
                    
                    @forelse ($data as $key => $item)

                    @php
                    $debit_amount = $credit_amount = '';
                    if(!empty($item->is_credit)){
                        $credit_amount = $item->transaction_amount;
                        $net_value += $item->transaction_amount;
                    }
                    if(!empty($item->is_debit)){
                        $debit_amount = $item->transaction_amount;
                        $net_value -= $item->transaction_amount;
                    }
                    
                    $show_payment_mode = "( ".ucwords($item->bank_cash)." )";
                   
                    @endphp

                    <tr class="store_details_row">
                        <td>{{ date('d/m/Y', strtotime($item->entry_date)) }}</td>
                        <td>{{ $item->transaction_id }}</td>
                        <td>{{ ucwords(str_replace("_"," ",$item->purpose)) }} {{$show_payment_mode}}</td>                        
                        <td>
                            <span class="text-danger">{{ $debit_amount }}</span>
                        </td>
                        <td>
                            <span class="text-success">{{ $credit_amount }}</span>
                        </td>
                        <td>
                            {{ replaceMinusSign($net_value) }} 
                            
                            {{ getCrDr($net_value) }}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="store_details_column">
                            <div class="store_details">
                                <table class="table">
                                    <tr>
                                        <td><strong> {{ $item->transaction_id }}</strong></td>
                                    </tr>
                                    <tr>                                       
                                        <td><span>Purpose: {{ ucwords(str_replace("_"," ",$item->purpose)) }}</span></td>
                                        <td><span>Description: {{ ucwords($item->purpose_description) }} </span></td>
                                        <td><span>Amount: {{$item->transaction_amount}} </span></td>
                                    </tr>
                                    <tr>                           
                                        @if (!empty($item->payment_mode))
                                        <td><span>Payment Mode: {{ ucwords($item->payment_mode)}} </span></td>    
                                        @endif
                                        @if (!empty($item->chq_utr_no))
                                        <td><span>Cheque / UTR No: {{ ucwords($item->chq_utr_no)}} </span></td>    
                                        @endif
                                        @if (!empty($item->narration))
                                        <td><span>Narration: {{ ($item->narration)}} </span></td>    
                                        @endif
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                     
                    @empty
                    <tr>
                        <td colspan="100%" class="small text-muted text-center">No record found</td>
                    </tr>
                    @endforelse
                    @if(!empty($data))
                    <tr class="table-info">
                        <td colspan="5"><strong>Closing Amount</strong>  </td>
                        <td>                            
                            <strong>                                                               
                                {{ replaceMinusSign($net_value) }} {{ getCrDr($net_value)}}
                            </strong>
                        </td>
                    </tr>   
                    @endif
                    
                    
                </tbody>
            </table>    
        </div>        
    </div> 
       
</section>
<style>
    /* .table.ledger tr:last-child td {
        background-color: #bee5eb;
    } */
    
</style>
<script>
    function downloadLedger(e){        
        var from_date = $('#from_date').val();
        var to_date = $('#to_date').val();
        var user_type = $('#user_type').val();
        var staff_id = $('#staff_id').val();
        var store_id = $('#store_id').val();
        var admin_id = $('#admin_id').val();
        var select_user_name = $('#select_user_name').val();
        var bank_cash = $('#bank_cash').val();
        var sort_by = 'asc';

        if(user_type == ''){
            alert("Please get the record first");
            return true;
        }

        var dataString = "from_date="+from_date+"&to_date="+to_date+"&user_type="+user_type+"&staff_id="+staff_id+"&store_id="+store_id+"&admin_id="+admin_id+"&select_user_name="+select_user_name+"&sort_by="+sort_by+"&bank_cash="+bank_cash ;
        if(e == 'pdf'){
            window.location.href = "{{ route('admin.ledgerPDF') }}?"+dataString; 
        }
        if(e == 'csv'){
            window.location.href = "{{ route('admin.ledgerExcel') }}?"+dataString; 
        }
        
    }
    function orderModal(order_id){
        $('#orderModal').modal({
            keyboard: true,
            backdrop: "static"
        });
    };

    $("[type='date']").bind('keypress keyup keydown',function (evt) {
        evt.preventDefault();
        alert('Please choose date by clicking on calender icon');
    });

    $('.dates').on('change', function(){
        // var timer;
        // clearTimeout(timer);
        // timer=setTimeout(()=>{            
            $('#ledgerForm').submit();
        // },3000);
    });   
    

    function getUserTypes(evt)
    {
        if(evt != ''){
            $('#select_user_name').val('');
            $('#store_id').val('');
            $('#staff_id').val('');
            $('#admin_id').val('');            
            if(evt == 'staff'){                
                $('#select_user_name').attr("placeholder", "Please type name of staff");
                $('#lable_user').html('Staff');
            }else if(evt == 'store'){                
                $('#select_user_name').attr("placeholder", "Please type name of customer");
                $('#lable_user').text('Customer');
            }
            else if(evt == 'partner'){                
                $('#select_user_name').attr("placeholder", "Please type name of partner");
                $('#lable_user').text('Partner');
            }            
        }else{
            $('#select_user_name').val('');
            $('#store_id').val('');
            $('#staff_id').val('');
            $('#admin_id').val('');            
            $('#ledger_body').html('');
            $('#select_user_name').val('');
            $('#select_user_name').attr("placeholder", "");
            
        }        
    } 

    function getUsers(evt){
        var user_type = $('#user_type').val();
        if(evt.length > 0){            
            $.ajax({
                url: "{{ route('admin.ledger.getUsersByType') }}",
                method: 'post',
                data: {
                    '_token': '{{ csrf_token() }}',
                    term: evt,
                    type: user_type
                },
                success: function(result) {
                    var content = '';
                    if (result.length > 0) {
                        content += `<div class="dropdown-menu show w-100 user-dropdown select-md" aria-labelledby="dropdownMenuButton">`;

                        $.each(result, (key, value) => {
                            content += `<a class="dropdown-item" href="javascript: void(0)" onclick="fetchCode(${value.id},'${value.name}')">${value.name}</a>`;
                        })
                        content += `</div>`;
                        // $($this).parent().after(content);
                    } else {
                        content += `<div class="dropdown-menu show w-100 user-dropdown select-md" aria-labelledby="dropdownMenuButton"><li class="dropdown-item">No user found</li></div>`;
                    }
                    $('.respDrop').html(content);
                }
            });
            
        }else{
            $('.respDrop').text('');            
            $('#ledger_body').html('');
            
        }
    }

    function fetchCode(id,name) {
        var user_type = $('#user_type').val();
        $('.user-dropdown').hide()

        $('#store_id').val(0);
        $('#staff_id').val(0);
        $('#admin_id').val(0);
        if(user_type == 'store'){
            $('#store_id').val(id)
            
        }else if(user_type == 'staff'){
            $('#staff_id').val(id)
            
        }else if(user_type == 'partner'){
            $('#admin_id').val(id)
            
        }
        $('#select_user_name').val(name);        
        $('#ledgerForm').submit();
    }

    function getDifferenceInDays(date1, date2) {
        const diffInMs = Math.abs(date2 - date1);
        return diffInMs / (1000 * 60 * 60 * 24);
    }    
</script>
@endsection
