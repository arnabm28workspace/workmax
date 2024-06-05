@extends('admin.layouts.app')

@section('page', 'Create Staff')

@section('content')
<section>
    <form method="post" action="{{ route('admin.staff.update', $data[0]->id) }}" enctype="multipart/form-data">@csrf
        <input type="hidden" name="id" id="id" value="{{$data[0]->id}}">
        <div class="row">
        <div class="col-sm-9">

            <div class="card shadow-sm">
                <div class="row m-3">
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Name</label>
                        <input type="text" name="name" placeholder="User Name" class="form-control" value="{{$data[0]->name}}">
                        @error('name') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Official name</label>
                        <input type="text" name="official_name" placeholder="User official_name" class="form-control" value="{{$data[0]->official_name}}">
                        @error('official_name') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Alias</label>
                        <input type="text" name="alias" placeholder="User alias" class="form-control" value="{{$data[0]->alias}}">
                        @error('alias') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Email</label>
                        <input type="email" name="email" placeholder="Staff email" class="form-control" value="{{$data[0]->email}}">
                        @error('email') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Mobile</label>
                        <input type="tel" name="mobile" placeholder="Staff mobile" class="form-control" value="{{$data[0]->mobile}}">
                        @error('mobile') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>

                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Aadhar Number</label>
                        <input type="number" name="aadhar_no" placeholder="Staff Aadhar Number" class="form-control" value="{{$data[0]->aadhar_no}}">
                        @error('aadhar_no') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Salary</label>
                        <input type="number" name="salary" placeholder="Staff Salary" class="form-control" value="{{$data[0]->salary}}">
                        @error('salary') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Bank account no</label>
                        <input type="text" name="bank_account_no" placeholder="Staff Account Number" class="form-control" value="{{$data[0]->bank_account_no}}">
                        @error('bank_account_no') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                    <div class="form-group col-sm-4 mb-3">
                        <label for="">Designition</label>
                        <input type="text" name="designation" placeholder="Staff Designation" class="form-control" value="{{$data[0]->designation}}">
                        @error('designation') <p class="small text-danger">{{ $message }}</p> @enderror
                    </div>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header">
                    Address
                </div>
                <div class="card-body pt-0">
                    <div class="admin__content">
                        <aside>
                            <nav>Allowance</nav>
                        </aside>
                        <content>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">House Rent</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="house_rent" value="{{$data[0]->name}}">
                                    @error('house_rent') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="priceHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Convenience</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="convenience" value="{{$data[0]->name}}">
                                    @error('convenience') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Dearness</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="dearness" value="{{$data[0]->dearness}}">
                                    @error('dearness') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Medical</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="medical" value="{{$data[0]->medical}}">
                                    @error('medical') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Overtime</label>
                                </div>
                                <div class="col-auto">
                                    <input type="number" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="overtime" value="{{$data[0]->overtime}}">
                                    @error('overtime') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">City Compensatory</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="city_compensatory" value="{{$data[0]->city_compensatory}}">
                                    @error('city_compensatory') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Project</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="project" value="{{$data[0]->project}}">
                                    @error('project') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Food</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="food" value="{{$data[0]->food}}">
                                    @error('food') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Special</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="special" value="{{$data[0]->special}}">
                                    @error('special') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                        </content>
                    </div>
                    <div class="admin__content">
                        <aside>
                            <nav>Staff Details</nav>
                        </aside>
                        <content>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputPassword6" class="col-form-label">Address</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="address" value="{{$data[0]->address}}">
                                    @error('address') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="priceHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">Landmark</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="landmark" value="{{$data[0]->landmark}}">
                                    @error('landmark') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">state</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="state" value="{{$data[0]->state}}">
                                    @error('state') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">city</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="city" value="{{$data[0]->city}}">
                                    @error('city') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">pin</label>
                                </div>
                                <div class="col-auto">
                                    <input type="number" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="pin" value="{{$data[0]->pin}}">
                                    @error('pin') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
                                </div>
                            </div>
                            <div class="row mb-2 align-items-center">
                                <div class="col-3">
                                    <label for="inputprice6" class="col-form-label">country</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" id="inputprice6" class="form-control" aria-describedby="priceHelpInline" name="country" value="{{$data[0]->country}}">
                                    @error('country') <p class="small text-danger">{{ $message }}</p> @enderror
                                </div>
                                <div class="col-auto">
                                    <span id="passwordHelpInline" class="form-text">
                                    Must be 1-100 characters long.
                                    </span>
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
                Update Staff
            </div>
            <div class="card-body text-end">
                <button type="submit" class="btn btn-sm btn-danger">Create </button>
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

@endsection
