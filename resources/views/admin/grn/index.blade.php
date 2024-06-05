@extends('admin.layouts.app')
@section('page', 'GRN')
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
                    <th>GRN No</th>
                    <th>PO ID</th>  
                    <th>Products</th>                  
                    <th>Net Amount</th>
                    <th>Total Ctns</th>
                    <th>Total Pieces</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i=1;
                @endphp
                @forelse ($data as $index => $item)   
                @php
                    // $pro_id_arr = explode(",",$item->pro_ids);
                    // $groupConcatNames = groupConcatNames('products','name',$pro_id_arr);
                @endphp             
                <tr>
                    <td>
                        {{$i}}
                    </td>                    
                    <td>
                        {{$item->grn_no}}                       
                    </td>
                    <td>{{$item->po_unique_id}}</td>
                    <td></td>
                    <td></td>
                    <td>{{$item->total_qty}}</td>
                    <td>{{$item->total_pcs}}</td>
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
