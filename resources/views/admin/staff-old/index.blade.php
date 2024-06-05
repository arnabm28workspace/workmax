@extends('admin.layouts.app')

@section('page', 'Staffs')

@section('content')
<section>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">

                    <div class="search__filter">
                        <div class="row align-items-center justify-content-between">
                            <div class="col">
                                <ul>
                                    <li class="active"><a href="#">All <span class="count">({{$data->count()}})</span></a></li>
                                    <li><a href="#">Active <span class="count">(7)</span></a></li>
                                    <li><a href="#">Inactive <span class="count">(3)</span></a></li>
                                </ul>
                            </div>
                            <div class="col-auto">
                                <form>
                                    <div class="row g-3 align-items-center">
                                        <div class="col-auto">
                                            <input type="search" name="" class="form-control" placeholder="Search here..">
                                        </div>
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-outline-danger btn-sm">Search Staff</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="filter">
                        <div class="row align-items-center justify-content-between">
                        <div class="col">
                            <form>
                            <div class="row g-3 align-items-center">
                                <div class="col-auto">
                                <select class="form-control">
                                    <option>Bulk Action</option>
                                    <option>Delect</option>
                                </select>
                                </div>
                                <div class="col-auto">
                                <button type="submit" class="btn btn-outline-danger btn-sm">Apply</button>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="col-auto">
                            <p>{{$data->count()}} Items</p>
                        </div>
                        </div>
                    </div>

                    <table class="table">
                        <thead>
                            <tr>
                                <th class="check-column">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault"></label>
                                </div>
                                </th>
                                <th class="text-center"><i class="fa-fa icon"></i></th>

                                <th>Name</th>


                                <th>Contact</th>

                                <th>Status</th>
                                {{-- <th>Account Verification</th> --}}
                            </tr>
                        </thead>
                        <tbody>
                            @forelse ($data as $index => $item)
                            <tr>
                                <td class="check-column">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault"></label>
                                    </div>
                                </td>
                                <td class="text-center column-thumb">

                                    @if($item->image)
                                        <img src="{{asset($item->image)}}" alt="" style="height: 100px" class="mr-4">
                                    @else
                                        <img src="{{asset('admin/images/placeholder-image.jpg')}}" alt="" class="mr-4" style="width: 100px;height: 100px;border-radius: 50%;">
                                    @endif
                                </td>
                                <td>
                                {{$item->name}}
                                <div class="row__action">
                                    <a href="{{ route('admin.staff.edit', $item->id) }}">Edit</a>
                                    <a href="{{ route('admin.staff.view', $item->id) }}">View</a>
                                    <a href="{{ route('admin.staff.status', $item->id) }}">{{($item->status == 1) ? 'Active' : 'Inactive'}}</a>
                                    <a href="{{ route('admin.staff.delete', $item->id) }}" class="text-danger">Delete</a>

                                </div>
                                </td>
                                <td>{{ $item->email }} <br> {{ $item->mobile }}</td>


                                <td><span class="badge bg-{{($item->status == 1) ? 'success' : 'danger'}}">{{($item->status == 1) ? 'Active' : 'Inactive'}}</span></td>
                                {{-- <td><span class="badge bg-{{($item->is_verified == 1) ? 'success' : 'danger'}}">{{($item->is_verified == 1) ? 'verified' : 'not verified'}}</span></td> --}}
                            </tr>
                            @empty
                            <tr><td colspan="100%" class="small text-muted">No data found</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</section>
@endsection
