<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\SubCategoryController;
use App\Http\Controllers\Api\CollectionController;
use App\Http\Controllers\Api\UserController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//product section
Route::any('products', 'Api\ProductController@list');
//store section
// Route::get('store', 'Api\StoreController@list');
Route::post('store/create', 'Api\StoreController@store');
Route::post('store/invoices', 'Api\StoreController@invoices');
Route::post('no-order-reason/add', 'Api\StoreController@noorder');
Route::get('task-store-list/{userId}', 'Api\StoreController@taskStoreList');
//store visit
Route::post('store-visit/start', 'Api\ActivityController@storeVisitStore');
Route::post('store-visit/locationupdate', 'Api\ActivityController@updateVisitLocation');
Route::post('store-visit/end', 'Api\ActivityController@storeVisitEnd');
//staff auth
Route::post('get-otp', 'Api\UserController@logincheck');
Route::post('login-via-otp', 'Api\UserController@otpcheck');
//no order reason
Route::post('no-order-reason/add', 'Api\StoreController@noorder');
// cart
Route::post('simpleBulkAddcart', 'Api\CartController@simpleBulkAddcart');
Route::get('cart/delete/{id}', 'Api\CartController@delete');
Route::get('cart/show/{userId}', 'Api\CartController@show');
Route::post('cart/add-price-request', 'Api\CartController@addPriceRequest')->name('addPriceRequest');
Route::post('cart/requested-products', 'Api\CartController@requestedProducts')->name('requestedProducts');
// order
Route::post('place-order', 'Api\OrderController@placeorder');
Route::get('order/view/{userid}/{storeid}', 'Api\OrderController@view');
// payment collection
Route::post('payment-collection/add','Api\PaymentCollectionController@store');
Route::post('payment-collection/list-by-store', 'Api\PaymentCollectionController@listByStore');
// scan
Route::post('scan/box', 'Api\ScanController@box');
Route::post('scan/stockout', 'Api\ScanController@stockout');
