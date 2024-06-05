@extends('admin.layouts.app')
@section('page', 'Designation')
@section('content')
<section>
    <div class="row">
        <div class="col-xl-8 order-2 order-xl-1">
            <div class="card">
                <div class="card-body">
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
                                {{-- <form action="{{ route('admin.designation.index') }}" id="searchForm">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-auto">
                                            <input type="search" name="term" class="form-control" placeholder="Search here.." id="term" value="" autocomplete="off">
                                        </div>                                        
                                    </div>
                                </form> --}}
                            </div>
                        </div>
                    </div>
                    <form action="{{ route('admin.designation.bulkSuspend') }}" method="POST">
                        @csrf
                        <div class="filter">
                            <div class="row align-items-center justify-content-between">
                                <div class="col">
                                       <div class="col-auto">
                                            <button id="btnSuspend" type="submit" class="btn btn-outline-danger btn-sm">Suspend</button>
                                        </div>
                                </div>
                                <div class="col-auto">                                    
                                    <p></p>
                                </div>
                            </div>
                        </div>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th class="check-column">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="checkAll">
                                        </div>
                                    </th>                                    
                                    <th>Name</th>
                                    <th>Count Staff</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($data as $index => $item)
                                <tr>                                    
                                    <td class="check-column">
                                        @if ($item->status != 0)
                                        <div class="form-check">
                                            <input name="suspend_check[]" class="data-check" type="checkbox"  value="{{$item->id}}">
                                        </div>
                                        @endif                                        
                                    </td>                                    
                                    <td>
                                        <h6 class="text-dark">{{$item->name}}</h6>
                                        <div class="row__action">
                                            <a href="{{ route('admin.designation.view', $item->id) }}">Edit</a>
                                            <a href="{{ route('admin.designation.view', $item->id) }}">View</a>
                                            <a href="{{ route('admin.designation.status', $item->id) }}">{{($item->status == 1) ? 'Suspend' : 'Active'}}</a>
                                        </div>
                                    </td>
                                    <td>{{ $item->count_staff }}</td>
                                    <td><span class="badge bg-{{($item->status == 1) ? 'success' : 'danger'}}">{{($item->status == 1) ? 'Active' : 'Suspend'}}</span></td>
                                </tr>
                                @empty
                                <tr>
                                    <td colspan="100%" class="small text-muted">No data found</td>
                                </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </form>
                    
                </div>
            </div>
        </div>

        <div class="col-xl-4 order-1 order-xl-2">
            <div class="card">
                <div class="card-body">
                    <form method="POST" action="{{ route('admin.designation.store') }}">
                        @csrf
                        <h4 class="page__subtitle">Add New Designation</h4>
                        <div class="row">
                            <div class="col-12 col-md-6 col-xl-12">
                                <div class="form-group mb-3">
                                    <label class="label-control">Name <span class="text-danger">*</span> </label>
                                    <input type="text" name="name" placeholder="Enter  name" class="form-control" value="{{old('name')}}">
                                    @error('name') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                
                            </div>                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-sm btn-success">Add</button>
                            </div>
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
        
        $('#btnSuspend').prop('disabled', true);        
        $("#checkAll").change(function () {
            $("input:checkbox").prop('checked', $(this).prop("checked"));
            var checkAllStatus = $("#checkAll:checked").length;
            // console.log(checkAllStatus)
            if(checkAllStatus == 1){
                $('#btnSuspend').prop('disabled', false);
            }else{
                $('#btnSuspend').prop('disabled', true);
            }
        });

        $('.data-check').change(function () {
            $('#btnSuspend').prop('disabled', false);
            var total_checkbox = $('input:checkbox.data-check').length;
            var total_checked = $('input:checkbox.data-check:checked').length;
            // console.log( total_checkbox);
            // console.log(total_checked);

            if(total_checked == 0){
                $('#btnSuspend').prop('disabled', true);
            }
          
            if(total_checkbox == total_checked){
                console.log('All checked')
                $('#checkAll').prop('checked', true);
            }else{
                console.log('Not All checked')
                $('#checkAll').prop('checked', false);
            }
        })
    });

    
    
</script>
@endsection