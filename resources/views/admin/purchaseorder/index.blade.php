@extends('admin.layouts.app')
@section('page', strtoupper($type))
@section('content')
<section>
    <div class="search__filter">
        <div class="row align-items-center justify-content-between">
            <div class="col">
                @if (Session::has('message'))
                <div class="alert alert-success" role="alert">
                    {{ Session::get('message') }}
                </div>
                @endif
            </div>
            <div class="col-auto">
                @if ($type == 'po')                    
                <a class="btn-sm btn-outline-success btn" href="{{ route('admin.purchaseorder.create') }}">Add New PO</a>
                @endif
            </div>
            <div class="col-auto">
                <form action="{{ route('admin.purchaseorder.index') }}" id="searchForm">
                <div class="row g-3 align-items-center">
                    <div class="col-auto">
                        <input type="search" name="term" id="term" class="form-control" placeholder="Search here.." value="{{$term}}" autocomplete="off">
                    </div>
                    <input type="submit" hidden>
                </div>
                </form>
            </div>
        </div>
    </div>
    <form>        
        <div class="filter">
            <div class="row align-items-center justify-content-between">                
                <div class="col"></div>
                <div class="col-auto">                    
                    <p>{{$total}} {{ ($total > 1) ? 'Total Items' : 'Total Item' }}</p>
                </div>
            </div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Ordered At</th>
                    <th>ID</th>
                    <th>Products</th>
                    <th>Net Amount</th>
                    <th>Total Ctns</th>
                    <th>Total Pcs</th>
                    <th>Scanned Ctns</th>
                    <th>Archived Ctns</th>
                    <th>Supplier</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i=1;
                @endphp
                @forelse ($data as $index => $item)   
                @php
                    $pro_id_arr = explode(",",$item->pro_ids);
                    $groupConcatNames = groupConcatNames('products','name',$pro_id_arr);
                @endphp             
                <tr>
                    <td>
                        {{$i}}
                    </td>  
                    <td>{{date('d/m/Y', strtotime($item->created_at))}}</td>                  
                    <td>
                        #{{$item->unique_id}}
                        @if ($item->status == 1)
                        <div class="row__action">   
                            @if (empty($item->scanned_boxes))
                            <a href="{{ route('admin.purchaseorder.edit', $item->unique_id) }}">Edit</a>   
                            @endif       
                            <a href="{{ url('admin/purchaseorder/showboxes'.'/'.$item->unique_id) }}">Show Cartons</a>
                            <a href="{{ route('admin.purchaseorder.grn', $item->unique_id) }}">Generate GRN</a>
                            {{-- <a href="{{ url('admin/purchaseorder/receiveorder'.'/'.$item->unique_id) }}">Receive Order</a> --}}
                        </div>
                        @else
                        <div class="row__action">
                            {{-- <a href="{{ route('admin.purchaseorder.viewstocks', $item->unique_id) }}">View Stock</a> --}}
                            <a href="{{ route('admin.purchaseorder.viewGrn', $item->unique_id) }}">View GRN</a>
                        </div>

                        
                        @endif  
                        <div class="row__action">
                            <a href="{{ route('admin.purchaseorder.view', $item->unique_id) }}">View Details</a>
                            @if (!empty($item->total_archived_qty))
                            <a href="{{ route('admin.purchaseorder.archivedBoxes', $item->unique_id) }}">Archived Cartons</a>
                            @endif
                            
                        </div>                      
                    </td>
                    <td>
                        {{$groupConcatNames}}
                    </td>
                    <td>
                        Rs. {{$item->amount}}
                    </td>
                    <td>{{ $item->total_qty }}</td>
                    <td>{{ $item->total_pcs }}</td>
                    <td>{{ $item->scanned_boxes }}</td>
                    <td>{{ $item->total_archived_qty }}</td>
                    <td>
                        {{ !empty($item->supplier->name) ? $item->supplier->name : '' }}
                    </td>
                </tr>
                @php
                    $i++;
                @endphp
                @empty
                <tr><td colspan="100%" class="small text-muted text-center">No data found</td></tr>
                @endforelse
            </tbody>
        </table>
    </form>
    {{$data->links()}}
</section>

@endsection

@section('script')
<script>
    $(document).ready(function(){
        $('div.alert').delay(3000).slideUp(300);
    })
    $('input[type=search]').on('search', function () {
        // search logic here
        // this function will be executed on click of X (clear button)
        // alert('Cleared');
        $('#searchForm').submit();
    });

    $('#term').on('keyup', function(){
        var timer;
        clearTimeout(timer);
        setInterval(() => {
            $('#searchForm').submit();
        }, 1500);
    });
</script>
@endsection
