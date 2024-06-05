<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Interfaces\StoreInterface;
use Illuminate\Http\Request;
use App\Models\Store;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class StoreController extends Controller
{
    public function __construct(StoreInterface $storeRepository)
    {
        $this->storeRepository = $storeRepository;
    }
    /**
     * This method is for show store list
     *
     */
    public function index(Request $request)
    {
        $term = !empty($request->term)?$request->term:'';
        $data = Store::select('stores.*');
        
        $data = $data->where(function($q) use ($term){
            $q->where('store_name', 'LIKE', '%'.$term.'%')->orWhere('contact','LIKE','%'.$term.'%');
        });      
        $data = $data->orderBy('stores.id','desc')->paginate(5);
        
        // $users = $this->storeRepository->listUsers();
        $total = Store::count();
        return view('admin.store.index', compact('data','term','total'));
    }

    public function create()
    {
        return view('admin.store.create');
    }
    /**
     * This method is for create store
     *
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            "store_name" => "required|string|max:200",             
            "bussiness_name" => "required|string|max:200",           
            "whatsapp"=>"required|unique:stores",
            "email" => "nullable|string",
            "shipping_address" => "required|string",
            "shipping_landmark" => "required|string",
            "shipping_state" => "required|string",
            "shipping_city" => "required|string",
            "shipping_pin" => "required|string",
            "shipping_country" => "required|string",
            "billing_address" => "required|string",
            "billing_landmark" => "required|string",
            "billing_state" => "required|string",
            "billing_city" => "required|string",
            "billing_pin" => "required|string",
            "billing_country" => "required|string",
            "gst_file" =>"nullable|mimes:jpg,jpeg,png,svg,gif|max:10000000"
            // "address" => "nullable|string",
            // "state" => "nullable|string",
            // "city" => "nullable|string",
            // "pin" => "nullable|string",
            // "lat" => "required",
            // "lng" => "required"            
        ],[
            'store_name.required' => "Please add person name",
            'bussiness_name.required' => "Please add company name",
            'store_name.max' => "Please add person name within 200 characters",
            'bussiness_name.max' => "Please add company name within 200 characters",
        ]);
        $params = $request->except('_token');

        // dd($params);

        $Store = $this->storeRepository->create($params);

        if ($Store) {
            return redirect()->route('admin.store.index');
        } else {
            return redirect()->route('admin.store.create')->withInput($request->all());
        }
    }

    /**
     * This method is for show store details
     * @param  $id
     *
     */

    public function edit($id)
    {
        $data = $this->storeRepository->listById($id);
        return view('admin.store.edit', compact('id','data'));
    }

    /**
     * This method is for show store details
     * @param  $id
     *
     */
    public function show(Request $request, $id)
    {
        $data = $this->storeRepository->listById($id);
        $users = $this->storeRepository->listUsers();
        return view('admin.store.detail', compact('data','users'));
    }
    /**
     * This method is for store update
     *
     *
     */
    public function update(Request $request, $id)
    {
        // dd($request->all());

        $request->validate([
            "store_name" => "required|string|max:150",
            "bussiness_name" => "required|string|max:150",
            "contact" => "required|",
            "whatsapp"=>"required|unique:stores,whatsapp,".$id,
            "email" => "nullable|string|max:150",
            "shipping_address" => "required|string",
            "shipping_landmark" => "required|string",
            "shipping_state" => "required|string",
            "shipping_city" => "required|string",
            "shipping_pin" => "required|string",
            "shipping_country" => "required|string",
            "billing_address" => "required|string",
            "billing_landmark" => "required|string",
            "billing_state" => "required|string",
            "billing_city" => "required|string",
            "billing_pin" => "required|string",
            "billing_country" => "required|string",
            "gst_file" =>"nullable|mimes:jpg,jpeg,png,svg,gif|max:10000000"
            // "address" => "nullable|string",
            // "state" => "nullable|string",
            // "city" => "nullable|string",
            // "pin" => "nullable|string",
            // "lat" => "string",
            // "lng" => "string"
        ]);


        $params = $request->except('_token');

        $store = $this->storeRepository->update($id, $params);

        if ($store) {
            return redirect()->route('admin.store.index');
        } else {
            return redirect()->route('admin.store.create')->withInput($request->all());
        }
    }


    /**
     * This method is for update store status
     * @param  $id
     *
     */
    public function status(Request $request, $id)
    {
        $storeStat = $this->storeRepository->toggle($id);

        // if ($storeStat) {
            if($storeStat == 1){
                $storeStatVal = "Activated Successfully";
            } else {
                $storeStatVal = "Suspended Successfully";
            }
            
            Session::flash('message', $storeStatVal); 
            return redirect()->route('admin.store.index');
        // } else {
        //     return redirect()->route('admin.store.create')->withInput($request->all());
        // }
    }
    /**
     * This method is for store delete
     * @param  $id
     *
     */
    public function destroy(Request $request, $id)
    {
        $this->storeRepository->delete($id);

        return redirect()->route('admin.store.index');
    }

    public function bulkSuspend(Request $request)
    {
        if(!empty($request->suspend_check)){
            $data = $this->storeRepository->bulkSuspend($request->suspend_check);

            return redirect()->route('admin.store.index');
        }else{
            return redirect()->route('admin.store.index');
        }
        
    }


}
