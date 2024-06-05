<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class DesignationController extends Controller
{
    // Staff Designations
    public function index(Request $request)
    {
        # code...

        $data = DB::table('designation')->select('*')->selectRaw("(SELECT COUNT(id) FROM users WHERE users.designation = designation.id) AS count_staff")->orderBy('id','desc')->get();

        // dd($data);
        return view('admin.designation.index', compact('data'));
    }

    public function store(Request $request)
    {
        # code...
        $request->validate([
            'name' => 'required|max:200|unique:designation,name'
        ]);

        $params = $request->except('_token');
        $name = $params['name'];
        
        DB::table('designation')->insert(['name'=>$name]);

        Session::flash('message', 'Designation created successfully');
        return redirect()->route('admin.designation.index');
        
    }

    public function show(Request $request, $id)
    {
        # code...
        $data = DB::table('designation')->find($id);
        return view('admin.designation.detail', compact('data'));
    }

    public function update(Request $request, $id)
    {
        # code...
        $request->validate([
            'name' => 'required|max:200|unique:designation,name,'.$id
        ]);

        $params = $request->except('_token');
        $name = $params['name'];
        
        DB::table('designation')->where('id',$id)->update(['name'=>$name,'updated_at'=>date('Y-m-d H:i:s')]);

        Session::flash('message', 'Designation updated successfully');
        return redirect()->route('admin.designation.index');
    }

    public function bulkSuspend(Request $request)
    {
        # code...
        if(!empty($request->suspend_check)){
            $count_data = count($request->suspend_check);
             
            DB::table('designation')->whereIn('id', $request->suspend_check)->update(['status' => 0]);
            
            Session::flash('message', $count_data.' designations suspended successfully');
            return redirect()->route('admin.designation.index');
            
        }else{
            return redirect()->route('admin.designation.index');
        }
    }

    public function status(Request $request, $id)
    {
        $designation = DB::table('designation')->find($id);
        if($designation->status == 1){
            $status = 0;
            $statusText = "Suspended";
        } else {
            $status = 1;
            $statusText = "Activated";
        }

        DB::table('designation')->where('id',$id)->update(['status'=>$status]);

        Session::flash('message', $statusText.' successfully');
        return redirect()->route('admin.designation.index');
        
    }
}
