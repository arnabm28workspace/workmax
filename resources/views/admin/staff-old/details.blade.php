@extends('admin.layouts.app')

@section('page', 'Staff detail')

@section('content')
<section>
    <div class="row">
        <div class="col-sm-9">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-2">
                            {{-- {{ dd($data[0]) }} --}}
                        @if($data[0]->image)
                            <img src="{{asset($data[0]->image)}}" alt="" style="height: 100px" class="mr-4">
                        @else
                            <img src="{{asset('admin/images/placeholder-image.jpg')}}" alt="" class="mr-4" style="width: 100px;height: 100px;border-radius: 50%;">
                        @endif
                        </div>
                        <div class="col-md-10">
                            <h3>{{ $data[0]->name}}</h3>
                            <p><span class="text-muted">Gender :</span> {{ strtoupper($data[0]->gender) }}</p>
                            <p><span class="text-muted">Email :</span> {{ $data[0]->email }}</p>
                                <p><span class="text-muted">Contact Details:</span> {{ $data[0]->mobile }}</p>
                                {{-- <p><span class="text-muted">WhatsApp Details:</span> {{ $data[0]->whatsapp_no }}</p>
                                <p><span class="text-muted">Employee Id:</span> {{ $data[0]->employee_id }}</p> --}}
                                    {{-- <p><span class="text-muted">User Type :</span>{{($item->type == 1) ? 'Distributor' : 'Dealer' :'Sales Person'}}</p> --}}
                                    {{-- <p><span class="text-muted">User Type :</span>@switch($data[0]->type)
                                        @case(1)
                                            Distributor
                                            @break
                                        @case(2)
                                            Dealer
                                            @break
                                        @case(3)
                                            Sales Person
                                            @break
                                    @endswitch</p> --}}
                            <p class="small">  <p><span class="text-muted">Address : </span> {{ $data[0]->address }}</p>
                                <p><span class="text-muted">Landmark :</span> {{ $data[0]->landmark }}</p>
                                    <p><span class="text-muted">City :</span> {{ $data[0]->city }}</p>
                                        <p><span class="text-muted">State :</span> {{ $data[0]->state }}</p>
                                            <p><span class="text-muted">Pincode :</span> {{ $data[0]->pin }}</p>
                                                <p><span class="text-muted">Aadhar Number :</span> {{ $data[0]->aadhar_no }}</p>
                                                    {{-- <p><span class="text-muted">Pan Number :</span> {{ $data[0]->pan_no }}</p> --}}
                                                    <p>Published<br/>{{date('d M Y', strtotime($data[0]->created_at))}}</p>

                        </div>
                    </div>


                </div>
                <a href="{{ route('admin.staff.index', 'customer') }}" class="btn btn-sm btn-danger">Back  </a>
            </div>

        </div>

    </div>
</section>
@endsection
