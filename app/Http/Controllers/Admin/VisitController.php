<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VisitController extends Controller
{
    //

    public function index(Request $request,$user_id)
    {
        # user's store visits
        $user = User::find($user_id);
        $user_name = $user->name; 
        $data = DB::table('store_visits AS sv')->select('sv.*','s.store_name')->leftJoin('stores AS s','s.id','sv.store_id')->where('sv.user_id',$user_id)->orderBy('sv.id','desc')->paginate(5);


        return view('admin.storevisit.index', compact('data','user_name','user_id'));

    }

    public function details($visit_id)
    {
        $data = DB::table('store_visit_details AS svd')->select('svd.*','store_visits.user_id')->leftJoin('store_visits', 'store_visits.id','svd.visit_id')->where('svd.visit_id',$visit_id)->orderBy('svd.id','asc')->get()->toarray();
        

        return view('admin.storevisit.details', compact('data',));
    }
}
