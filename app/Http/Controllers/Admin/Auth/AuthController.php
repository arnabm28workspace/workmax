<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;

class AuthController extends Controller
{
    public function index()
    {
        return view('admin.auth.login');
    }
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required | string | email | exists:admins',
            'password' => 'required | string'
        ]);

        $adminCreds = $request->only('email', 'password');

        $checkAdmin = \App\Models\Admin::where('email',$request->email)->first();

        if(!empty($checkAdmin)){
            if(!empty($checkAdmin->status)){
                if ( Auth::guard('admin')->attempt($adminCreds) ) {
                    return redirect()->route('admin.home');
                } else {
                    return redirect()->route('admin.login')->withInputs($request->all())->with('failure', 'Invalid credentials. Try again');
                }
            }else{
                return redirect()->route('admin.login')->withInputs($request->all())->with('failure', 'Inactive user');
            }
        }else{
            return redirect()->route('admin.login')->withInputs($request->all())->with('failure', 'No user found');
        }

    }

    public function adminLogout()
    {
        Auth::guard('admin')->logout();
        return redirect(route('admin.login'));
    }
}
