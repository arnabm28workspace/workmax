<?php

use Illuminate\Http\Request;
// use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\Auth\AuthController;
use App\Http\Controllers\Admin\AdminController;
// use App\Http\Controllers\Admin\ProfileController;
// use App\Http\Controllers\Admin\RoleManagementController;
use App\Http\Middleware\CheckAdmin;
use App\Http\Middleware\CheckAdminLogin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/test', function () {
    return "Hello";
});
Route::middleware([CheckAdminLogin::class])->group(function () {
    Route::get('login', [AuthController::class, 'index'])->name('admin.login');
    Route::post('login', [AuthController::class, 'login'])->name('admin.login.doLogin');
});

Route::middleware([CheckAdmin::class])->group(
    function () {

        Route::post('admin/logout', [AuthController::class, 'adminLogout'])->name('admin.logout');

        Route::get('home', [AdminController::class, 'home'], function () {
            dd('hello');
        })->name('admin.home');

        

    }
);
