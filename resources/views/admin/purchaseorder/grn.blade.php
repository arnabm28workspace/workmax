@extends('admin.layouts.app')
@section('page', 'Generate GRN')
@section('content')
<section>
    <div class="row">
        <div class="col-sm-12">
            <h5>ID:- <span>{{$unique_id}}</span></h5>
            <h6>Total Price:- <span>{{$total_po_price}}</span></h6>
            <div class="card">
                <div class="card-body">
                    <form id="myForm" method="POST" action="{{ route('admin.purchaseorder.saveinventory') }}">
                    @csrf  
                    <input type="hidden" name="unique_id" value="{{$unique_id}}">                      
                    @if($errors->any())            
                        {!! implode('', $errors->all('<p class="small text-danger">:message</p>')) !!}
                    @endif
                    @if (Session::has('message'))
                         <div class="alert alert-success" role="alert">
                            {{ Session::get('message') }}
                        </div>
                    @endif
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product</th>
                                <th colspan="">No of Ctns</th>
                                <th class="check-column">
                                    <div class="form-check">
                                        <input class="form-check-input" disabled type="checkbox" id="">
                                        <label class="form-check-label" for=""></label>
                                    </div>
                                </th>
                                <th>Barcode per Ctn</th>                                
                                <th>Weight per Ctn</th>
                                <th>Scanned Weight</th>
                                <th>Pcs per Ctn</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $i=1;
                            @endphp
                            @forelse ($data as $item)                            
                            <tr>
                                <td rowspan="{{ count($item->boxes) }}">{{$i}}</td>
                                <td rowspan="{{ count($item->boxes) }}">
                                    <label class="label-control">
                                        {{$item->pro_name}}  
                                    </label>
                                    <br/>
                                    {{-- <a href="{{ url('/admin/purchaseorder/addbox'.'/'.$item->unique_id.'/'.$item->product_id) }}" onclick="return confirm('Are you sure want to add a new carton?');" class="btn btn-success">Add New</a> --}}
                                    <input type="hidden" name="quantity[{{$item->product_id}}]"  value="{{ count($item->boxes) }}">
                                </td>
                                <td rowspan="{{ count($item->boxes) }}">                                    
                                    <span>{{ count($item->boxes)  }}</span>
                                </td>
                                
                                @forelse ($item->boxes as $box)
                                  
                                <td class="check-column">
                                    <div class="form-check">
                                        @php                                    
                                            $checked = "checked=checked";
                                            if($box->is_scanned == 0){                                            
                                                $checked = "";
                                            }                                            
                                        @endphp 
                                        <input name="barcode_no[]" readonly onclick="return false"  class="form-check-input data-check" type="checkbox" {{$checked}}  value="{{$box->barcode_no}}" id="checkbox{{$box->barcode_no}}">
                                    </div>
                                </td>
                                <td>
                                    <span title="{{$box->barcode_no}}">
                                        {!! $box->code_html !!}
                                        <strong>{{$box->barcode_no}}</strong>
                                    </span>                                   
                                </td>                                
                                <td>
                                    {{$item->weight}} {{$item->weight_unit}}
                                </td>
                                <td>
                                    <span id="scannedweight{{$box->barcode_no}}">{{$box->scanned_weight_val / 1000}} kg</span>
                                </td>
                                <td>
                                    {{$box->pcs}} pieces
                                </td>
                                <input type="hidden" name="pcs[]" value="{{$box->pcs}}">
                                <td>
                                    @if($box->is_scanned == 1)
                                    <span class="badge bg-primary" id="scanstatus{{$box->barcode_no}}">Scanned</span>
                                    @else
                                    <span class="badge bg-secondary" id="scanstatus{{$box->barcode_no}}">Yet to Scan</span>
                                    @endif
                                    
                                    @if (!empty($box->is_new))
                                        <span class="badge bg-dark">New</span>
                                    @endif                                     
                                </td>
                                <td>
                                    <button type="button" class="btn btn-success" onclick="downloadImage('{{$box->barcode_no}}')" >DOWNLOAD</button>
                                    
                                    <?php 
                                        if($box->is_scanned == 0){
                                    ?>
                                    <a href="{{ url('/admin/purchaseorder/archiveBox'.'/'.$item->unique_id.'/'.$item->product_id.'/'.$box->barcode_no) }}" onclick="return confirm('Are you sure want to archive box?');" class="btn btn-warning" id="archivebtn{{$box->barcode_no}}">Archive</a>
                                    <?php 
                                        }   
                                    ?>
                                </td>
                            </tr> 
                            
                            @empty
                            <tr></tr>
                            @endforelse
                            @php
                                $i++;
                            @endphp   
                            @empty
                                
                            @endforelse
                        <tbody>
                    </table> 
                    <div class="form-group">
                        <a href="{{ route('admin.purchaseorder.index') }}" class="btn btn-sm btn-danger">Back</a>
                        <button id="submitBtn" type="submit" class="btn btn-sm btn-success">Generate</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function(){
        $('div.alert').delay(3000).slideUp(300);
        var total_checkbox = $('input:checkbox.data-check').length;
        var total_checked = $('input:checkbox.data-check:checked').length;

        var po_unique_id = "{{ $unique_id }}"
        if(total_checked == total_checkbox){
            $('#submitBtn').prop('disabled', false);
        }else{
            $('#submitBtn').prop('disabled', true);
            const interval = setInterval(() => {        
                getScannedImages(po_unique_id);
            }, 5000);
        }
        $("#myForm").submit(function() {
            // $('input').attr('disabled', 'disabled');
            $('#submitBtn').attr('disabled', 'disabled');
            return true;
        });

                
    })

    function getScannedImages(po){
        $.ajax({
            url: "{{ route('admin.purchaseorder.checkScannedboxes') }}",
            dataType: 'json',
            type: 'post',
            data: {
                "_token": "{{ csrf_token() }}",
                "uniquie_id": po
            },
            success: function(data){
                
                var sucessData = data;
                console.log(sucessData)
                
                // console.log(sucessData);
                for(var i = 0; i < sucessData.length; i++) {
                    // alert(sucessData[i].barcode_no)
                    var scanned_weight_val = (sucessData[i].scanned_weight_val / 1000);
                    $('#scanstatus'+sucessData[i].barcode_no).text('Scanned');
                    $('#scannedweight'+sucessData[i].barcode_no).text(scanned_weight_val+' kg');
                    $('#scanstatus'+sucessData[i].barcode_no).removeClass('badge bg-secondary');
                    $('#scanstatus'+sucessData[i].barcode_no).addClass('badge bg-primary');
                    $('#archivebtn'+sucessData[i].barcode_no).hide();
                    $('#checkbox'+sucessData[i].barcode_no).attr('checked', 'checked');

                    var total_checkbox = $('input:checkbox.data-check').length;
                    var total_checked = $('input:checkbox.data-check:checked').length;

                    if(total_checked == total_checkbox){
                        $('#submitBtn').prop('disabled', false);
                    }

                }
               
            }
        });
    }

    function downloadImage(name){
        var url = "https://bwipjs-api.metafloor.com/?bcid=code128&text="+name;

        fetch(url)
            .then(resp => resp.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = name;
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
            })
            .catch(() => alert('An error sorry'));
    }
</script>
@endsection
