@extends('admin.layouts.app')
@section('page', 'Show Cartons')
@section('content')
<section>
    <ul class="breadcrumb_menu">
        <li>Purchase Order</li>
        <li><a href="{{ route('admin.purchaseorder.index') }}?type=po">PO</a></li>
        <li>Show Cartons</li>
    </ul>   
    <div class="search__filter">
        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <div class="row">
                    <div class="col">                
                        <div class="row g-3 align-items-center">                            
                            <div class="col-auto">
                                <a href="{{ route('admin.purchaseorder.index') }}" class="btn btn-outline-danger btn-sm">Back</a>
                            </div>
                        </div>
                
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <h3>#{{$unique_id}}</h3>
        @forelse ($data as $index => $item)
        <div class="col-md-3">
            <h5>{{$item->pro_name}}</h5>
            <img alt="Barcoded value {{$item->barcode_no}}"
 src="https://bwipjs-api.metafloor.com/?bcid=code128&text={{$item->barcode_no}}&includetext">
        </div>    
        @empty
            
        @endforelse
    </div>
</section>

@endsection
@section('script')
<script>
    
</script>
@endsection
