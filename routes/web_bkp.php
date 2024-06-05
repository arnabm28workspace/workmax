<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// website
Route::name('front.')->group(function () {
    // home
    // Route::get('/', 'Front\FrontController@index')->name('home');
    Route::view('/', 'admin.auth.login')->name('home');
    Route::post('/subscribe', 'Front\FrontController@mailSubscribe')->name('subscription');

    // store visit
    Route::name('store.')->group(function () {
        Route::get('/store', 'Front\StoreController@index')->name('index');
        // Route::get('/store/{slug}', 'Front\StoreController@detail')->name('detail');
        Route::get('/store/{id}', 'Front\StoreController@detail')->name('detail');
        Route::post('/store/filter', 'Front\StoreController@filter')->name('filter');
    });

    // order on call
    Route::name('store.order.call.')->group(function () {
        Route::get('/order-on-call', 'Front\OrderOnCallController@index')->name('index');
        // Route::get('/order-on-call/{slug}', 'Front\OrderOnCallController@detail')->name('detail');
        Route::get('/order-on-call/{id}', 'Front\OrderOnCallController@detail')->name('detail');
        // Route::post('/order/filter', 'Front\OrderOnCallController@filter')->name('filter');
    });

    // category detail
    Route::name('category.')->group(function () {
        Route::get('/category/{slug}', 'Front\CategoryController@detail')->name('detail');
        Route::post('/category/filter', 'Front\CategoryController@filter')->name('filter');
    });

    // sale
    Route::name('sale.')->group(function () {
        Route::get('/sale', 'Front\SaleController@index')->name('index');
    });

    // collection detail
    Route::name('collection.')->group(function () {
        Route::get('/collection/{slug}', 'Front\CollectionController@detail')->name('detail');
        Route::post('/collection/filter', 'Front\CollectionController@filter')->name('filter');
    });

    // product detail
    Route::name('product.')->group(function () {
        Route::get('/product/{slug}', 'Front\ProductController@detail')->name('detail');
        Route::post('/size', 'Front\ProductController@size')->name('size');
    });

    // wishlist
    Route::prefix('wishlist')->name('wishlist.')->group(function () {
        // Route::get('/', 'Front\WishlistController@viewByIp')->name('index');
        Route::post('/add', 'Front\WishlistController@add')->name('add');
        Route::get('/delete/{id}', 'Front\WishlistController@delete')->name('delete');
    });

    // catalouge
    Route::prefix('catalouge')->name('catalouge.')->group(function () {
        Route::get('/', 'Front\CategoryController@index')->name('index');
        Route::get('/{slug}', 'Front\CategoryController@detail')->name('detail');
    });

    // cart
    Route::prefix('cart')->name('cart.')->group(function () {
        Route::get('/', 'Front\CartController@viewByUserId')->name('index');
        Route::post('/coupon/check', 'Front\CartController@couponCheck')->name('coupon.check');
        Route::post('/coupon/remove', 'Front\CartController@couponRemove')->name('coupon.remove');
        Route::post('/add', 'Front\CartController@add')->name('add');
        Route::post('/add/bulk', 'Front\CartController@addBulk')->name('add.bulk');
        Route::get('/delete2/{id}', 'Front\CartController@delete')->name('delete');
        Route::get('/quantity/{id}/{type}', 'Front\CartController@qtyUpdate')->name('quantity');
    });

    // checkout
    Route::prefix('checkout')->name('checkout.')->group(function () {
        Route::get('/', 'Front\CheckoutController@index')->name('index');
        // Route::post('/coupon/check', 'Front\CheckoutController@coupon')->name('coupon.check');
        Route::post('/store', 'Front\CheckoutController@store')->name('store');
        Route::view('/complete', 'front.checkout.complete')->name('complete');
    });

    // faq
    Route::prefix('faq')->name('faq.')->group(function () {
        Route::get('/', 'Front\FaqController@index')->name('index');
    });

    // search
    Route::prefix('search')->name('search.')->group(function () {
        Route::get('/', 'Front\SearchController@index')->name('index');
    });

    // settings contents
    Route::name('content.')->group(function () {
        Route::get('/terms-and-conditions', 'Front\ContentController@termDetails')->name('terms');
        Route::get('/privacy-statement', 'Front\ContentController@privacyDetails')->name('privacy');
        Route::get('/security', 'Front\ContentController@securityDetails')->name('security');
        Route::get('/disclaimer', 'Front\ContentController@disclaimerDetails')->name('disclaimer');
        Route::get('/shipping-and-delivery', 'Front\ContentController@shippingDetails')->name('shipping');
        Route::get('/payment-voucher-promotion', 'Front\ContentController@paymentDetails')->name('payment');
        Route::get('/return-policy', 'Front\ContentController@returnDetails')->name('return');
        Route::get('/refund-policy', 'Front\ContentController@refundDetails')->name('refund');
        Route::get('/service-and-contact', 'Front\ContentController@serviceDetails')->name('service');
    });

    // user login & registration - guard
    Route::middleware(['guest:web'])->group(function () {
        Route::prefix('user/')->name('user.')->group(function () {
            Route::get('/user/register', 'Front\UserController@register')->name('register');
            Route::post('/create', 'Front\UserController@create')->name('create');
            // Route::get('/login', 'Front\UserController@login')->name('login');
            Route::post('/login/check', 'Front\UserController@check')->name('check');
            Route::post('/login/otp/check', 'Front\UserController@loginOtp')->name('login.otp');
            Route::post('/login/mobile/otp/check', 'Front\UserController@loginMobileOtp')->name('login.mobile.otp');
        });
    });

    // profile login & registration - guard
    Route::middleware(['auth:web'])->group(function () {
        Route::prefix('user/')->name('user.')->group(function () {
            Route::view('profile', 'front.profile.index')->name('profile');
            Route::view('manage', 'front.profile.edit')->name('manage');
            Route::post('manage/update', 'Front\UserController@updateProfile')->name('manage.update');
            Route::post('password/update', 'Front\UserController@updatePassword')->name('password.update');
            Route::get('order', 'Front\UserController@order')->name('order');
            Route::get('coupon', 'Front\UserController@coupon')->name('coupon');
            Route::get('address', 'Front\UserController@address')->name('address');
            Route::view('address/add', 'front.profile.address-add')->name('address.add');
            Route::post('address/add', 'Front\UserController@addressCreate')->name('address.create');
            Route::get('wishlist', 'Front\UserController@wishlist')->name('wishlist');
        });
    });

    // mail template test
    Route::view('/mail/1', 'front.mail.register');
    Route::view('/mail/2', 'front.mail.order-confirm');
});

Route::prefix('cron')->name('cron.')->group(function(){
    Route::get('/generateTask', 'CronController@generateTask')->name('generateTask');
});

Auth::routes();

// Route::get('login', 'Front\UserController@login')->name('login');
Route::get('/login/otp', 'Front\UserController@loginOtpMobile')->name('front.user.login.mobile');

// common & user guard
Route::prefix('user')->name('user.')->group(function() {
    Route::middleware(['guest:web'])->group(function() {
        Route::view('/register', 'auth.register')->name('register');
        Route::post('/create', 'User\UserController@create')->name('create');
        // Route::view('/login', 'auth.login')->name('login');
        Route::post('/check', 'User\UserController@check')->name('check');

    });

    Route::middleware(['auth:web'])->group(function() {
        Route::view('/home', 'user.home')->name('home');
    });
});

// admin guard
Route::prefix('admin')->name('admin.')->group(function() {
    Route::middleware(['guest:admin'])->group(function() {
        Route::view('/login', 'admin.auth.login')->name('login');
        Route::post('/check', 'Admin\AdminController@check')->name('login.check');
        Route::get('forget-password', 'Admin\ForgotPasswordController@showForgetPasswordForm')->name('forget.password.get');
        Route::post('forget-password', 'Admin\ForgotPasswordController@submitForgetPasswordForm')->name('forget.password.post');
        Route::get('reset-password/{token}', 'Admin\ForgotPasswordController@showResetPasswordForm')->name('reset.password.get');
        Route::post('reset-password', 'Admin\ForgotPasswordController@submitResetPasswordForm')->name('reset.password.post');
    });

    Route::middleware(['auth:admin'])->group(function() {
        // dashboard
        Route::get('/home', 'Admin\AdminController@home')->name('home');
        Route::get('/profile', 'Admin\ProfileController@index')->name('admin.profile');
		Route::post('/profile', 'Admin\ProfileController@update')->name('admin.profile.update');
		Route::post('/changepassword', 'Admin\ProfileController@changePassword')->name('admin.profile.changepassword');


        //sub-admin
        Route::prefix('sub-admin')->name('sub-admin.')->group(function () {
            Route::get('/', 'Admin\SubadminController@index')->name('index');
            // Route::get('/active', 'Admin\CategoryController@activeCategory')->name('active');
            // Route::get('/inactive', 'Admin\CategoryController@inactiveCategory')->name('inactive');
            Route::post('/store', 'Admin\SubadminController@store')->name('store');
            Route::get('/{id}/view', 'Admin\SubadminController@show')->name('view');
            Route::post('/{id}/update', 'Admin\SubadminController@update')->name('update');
            Route::get('/{id}/status', 'Admin\SubadminController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\SubadminController@destroy')->name('delete');
           // Route::get('/bulkDelete', 'Admin\SubadminController@bulkDestroy')->name('bulkDestroy');
        });

        // category
        Route::prefix('category')->name('category.')->group(function () {
            Route::get('/', 'Admin\CategoryController@index')->name('index');
            // Route::get('/active', 'Admin\CategoryController@activeCategory')->name('active');
            // Route::get('/inactive', 'Admin\CategoryController@inactiveCategory')->name('inactive');
            Route::post('/store', 'Admin\CategoryController@store')->name('store');
            Route::get('/{id}/view', 'Admin\CategoryController@show')->name('view');
            Route::post('/{id}/update', 'Admin\CategoryController@update')->name('update');
            Route::get('/{id}/status', 'Admin\CategoryController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\CategoryController@destroy')->name('delete');
            Route::get('/bulkDelete', 'Admin\CategoryController@bulkDestroy')->name('bulkDestroy');
            Route::post('/bulkSuspend', 'Admin\CategoryController@bulkSuspend')->name('bulkSuspend');
        });

       // sub-category
        Route::prefix('subcategory')->name('subcategory.')->group(function () {
            Route::get('/', 'Admin\SubCategoryController@index')->name('index');
            Route::post('/store', 'Admin\SubCategoryController@store')->name('store');
            Route::get('/{id}/view', 'Admin\SubCategoryController@show')->name('view');
            Route::post('/{id}/update', 'Admin\SubCategoryController@update')->name('update');
            Route::get('/{id}/status', 'Admin\SubCategoryController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\SubCategoryController@destroy')->name('delete');
            Route::get('/bulkDelete', 'Admin\SubCategoryController@bulkDestroy')->name('bulkDestroy');
            Route::post('/bulkSuspend', 'Admin\SubCategoryController@bulkSuspend')->name('bulkSuspend');
        });

        // unit

        Route::prefix('unit')->name('unit.')->group(function () {
            Route::get('/', 'Admin\UnitController@index')->name('index');
            Route::post('/store', 'Admin\UnitController@store')->name('store');
            Route::get('/{id}/view', 'Admin\UnitController@show')->name('view');
            Route::get('/{id}/status', 'Admin\UnitController@status')->name('status');
            Route::post('/{id}/update', 'Admin\UnitController@update')->name('update');
            Route::post('/bulkSuspend', 'Admin\UnitController@bulkSuspend')->name('bulkSuspend');
        });

        // Expense Type

        Route::prefix('expense')->name('expense.')->group(function () {
            Route::get('/{parent_id}', 'Admin\ExpenseController@index')->name('index');
            Route::post('/store', 'Admin\ExpenseController@store')->name('store');
            Route::get('/{id}/view', 'Admin\ExpenseController@show')->name('view');
            Route::get('/{id}/status', 'Admin\ExpenseController@status')->name('status');
            Route::post('/{id}/update', 'Admin\ExpenseController@update')->name('update');
            Route::post('/bulkSuspend', 'Admin\ExpenseController@bulkSuspend')->name('bulkSuspend');
        });


        // collection
        Route::prefix('purchaseorder')->name('purchaseorder.')->group(function () {
            Route::get('/', 'Admin\PurchaseOrderController@index')->name('index');
            Route::get('/create/{supplier_id?}', 'Admin\PurchaseOrderController@create')->name('create');
            Route::post('/store', 'Admin\PurchaseOrderController@store')->name('store');

            Route::get('/{unique_id}/view', 'Admin\PurchaseOrderController@show')->name('view');
            Route::get('/{unique_id}/edit', 'Admin\PurchaseOrderController@edit')->name('edit');

            Route::post('/update', 'Admin\PurchaseOrderController@update')->name('update');
            // Route::get('/{id}/status', 'Admin\PurchaseOrderController@status')->name('status');
            // Route::get('/{id}/delete', 'Admin\PurchaseOrderController@destroy')->name('delete');
            // Route::get('/bulkDelete', 'Admin\PurchaseOrderController@bulkDestroy')->name('bulkDestroy');
            Route::post('/bulkSuspend', 'Admin\PurchaseOrderController@bulkSuspend')->name('bulkSuspend');
            

            Route::get('/showboxes/{unique_id}/{product_id?}', 'Admin\PurchaseOrderController@showboxes')->name('showboxes');
            
            
            Route::post('/saveinventory', 'Admin\PurchaseOrderController@saveinventory')->name('saveinventory');


            Route::get('/{unique_id}/grn', 'Admin\PurchaseOrderController@grn')->name('grn');
            Route::get('/addbox/{unique_id}/{product_id}', 'Admin\PurchaseOrderController@addbox')->name('addbox');
            Route::get('/deletebox/{unique_id}/{product_id}/{barcode_no}', 'Admin\PurchaseOrderController@deletebox')->name('deletebox');
            Route::get('/{unique_id}/viewstocks', 'Admin\PurchaseOrderController@viewstocks')->name('viewstocks');

            Route::Post('/getProductsSupplier', 'Admin\PurchaseOrderController@getProductsSupplier')->name('getProductsSupplier');
        });

        // stock

        Route::prefix('stock')->name('stock.')->group(function(){
            Route::get('/', 'Admin\StockController@index')->name('index');
            Route::get('/{product_id?}', 'Admin\StockController@details')->name('details');
        });

        // coupon
        Route::prefix('coupon')->name('coupon.')->group(function() {
            Route::get('/', 'Admin\CouponController@index')->name('index');
            Route::post('/store', 'Admin\CouponController@store')->name('store');
            Route::get('/{id}/view', 'Admin\CouponController@show')->name('view');
            Route::post('/{id}/update', 'Admin\CouponController@update')->name('update');
            Route::get('/{id}/status', 'Admin\CouponController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\CouponController@destroy')->name('delete');
        });

        // offer
        Route::prefix('offer')->name('offer.')->group(function() {
            Route::get('/', 'Admin\OfferController@index')->name('index');
            Route::post('/offer', 'Admin\OfferController@store')->name('store');
            Route::get('/{id}/view', 'Admin\OfferController@show')->name('view');
            Route::post('/{id}/update', 'Admin\OfferController@update')->name('update');
            Route::get('/{id}/status', 'Admin\OfferController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\OfferController@destroy')->name('delete');
        });

        // order
        Route::prefix('order')->name('order.')->group(function () {
            Route::get('/', 'Admin\OrderController@index')->name('index');
            Route::post('/store', 'Admin\OrderController@store')->name('store');
            Route::get('/{id}/view', 'Admin\OrderController@show')->name('view');
            Route::post('/{id}/update', 'Admin\OrderController@update')->name('update');
            Route::get('/{id}/status/{status}', 'Admin\OrderController@status')->name('status');
        });

        // packingslip

        Route::prefix('packingslip')->name('packingslip.')->group(function(){
            Route::get('/{order_id?}', 'Admin\PackingslipController@index')->name('index');
            Route::get('/{id}/add', 'Admin\PackingslipController@add')->name('add');
            Route::post('/save', 'Admin\PackingslipController@save')->name('save');
            Route::get('/{slip_no}/boxes', 'Admin\PackingslipController@boxes')->name('boxes');
            Route::get('/{slip_no}/get_pdf', 'Admin\PackingslipController@get_pdf')->name('get_pdf');
            Route::get('/{slip_no}/create_invoice', 'Admin\PackingslipController@create_invoice')->name('create_invoice');
        });

        Route::get('/generateQrCode1', 'Admin\PackingslipController@generateQrCode1')->name('generateQrCode1');
        
        Route::get('/barcodes/{unique_id}', 'Admin\PurchaseOrderController@barcodes')->name('barcodes');

        // transaction
        Route::prefix('transaction')->name('transaction.')->group(function() {
            Route::get('/', 'Admin\TransactionController@index')->name('index');
            Route::get('/{id}/view', 'Admin\TransactionController@show')->name('view');
        });

        // store
        Route::prefix('store')->name('store.')->group(function() {
            Route::get('/', 'Admin\StoreController@index')->name('index');
            Route::get('/create', 'Admin\StoreController@create')->name('create');
            Route::post('/store', 'Admin\StoreController@store')->name('store');
            Route::get('/{id}/view', 'Admin\StoreController@show')->name('view');
            Route::post('/{id}/update', 'Admin\StoreController@update')->name('update');
            Route::get('/{id}/status', 'Admin\StoreController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\StoreController@destroy')->name('delete');
            Route::post('/bulkSuspend', 'Admin\StoreController@bulkSuspend')->name('bulkSuspend');
        });

        Route::prefix('customer')->name('customer.')->group(function() {
            Route::get('/', 'Admin\CustomerController@index')->name('index');
            Route::get('/create', 'Admin\CustomerController@create')->name('create');
            Route::post('/store', 'Admin\CustomerController@store')->name('store');
            Route::get('/{id}/view', 'Admin\CustomerController@show')->name('view');
            Route::get('/{id}/edit', 'Admin\CustomerController@edit')->name('edit');
            Route::post('/{id}/update', 'Admin\CustomerController@update')->name('update');
            Route::get('/{id}/status', 'Admin\CustomerController@status')->name('status');
            // Route::get('/{id}/delete', 'Admin\CustomerController@destroy')->name('delete');
            Route::post('/bulkSuspend', 'Admin\CustomerController@bulkSuspend')->name('bulkSuspend');
        });

        // user
        Route::prefix('user')->name('user.')->group(function() {
            Route::get('/list/{userType}', 'Admin\UserController@index')->name('index');
            Route::get('/create/{user_type}', 'Admin\UserController@create')->name('create');
            Route::post('/store', 'Admin\UserController@store')->name('store');
            Route::get('/{id}/view', 'Admin\UserController@show')->name('view');
            Route::get('/{userType}/{id}/edit', 'Admin\UserController@edit')->name('edit');
            Route::post('/{id}/update', 'Admin\UserController@update')->name('update');
            Route::get('/{id}/{userType}/status', 'Admin\UserController@status')->name('status');
            Route::get('/{id}/verification', 'Admin\UserController@verification')->name('verification');
            Route::get('/{id}/{userType}/delete', 'Admin\UserController@destroy')->name('delete');
            Route::post('/supplierBulkSuspend', 'Admin\UserController@supplierBulkSuspend')->name('supplierBulkSuspend');
        });

        // staff
        Route::prefix('staff')->name('staff.')->group(function() {
            Route::get('/', 'Admin\UserController@staffList')->name('index');
            Route::view('/create', 'admin.staff.create')->name('create');
            Route::post('/store', 'Admin\UserController@storeStaff')->name('store');
            Route::get('/{id}/view', 'Admin\UserController@staffshow')->name('view');
            Route::get('/{id}/edit', 'Admin\UserController@editStaff')->name('edit');
           
            Route::get('/{id}/listtask', 'Admin\UserController@listtask')->name('listtask');
            Route::get('/{id}/createtask', 'Admin\UserController@createtask')->name('createtask');
            Route::post('/savetask','Admin\UserController@savetask')->name('savetask');
            Route::get('/{user_id}/{id}/edittask', 'Admin\UserController@edittask')->name('edittask');
            Route::post('/assignTask', 'Admin\UserController@assignTask')->name('assignTask');
            Route::post('/updatetask','Admin\UserController@updatetask')->name('updatetask');

            Route::post('/{id}/update', 'Admin\UserController@staffupdate')->name('update');
            Route::get('/{id}/delete', 'Admin\UserController@staffdestroy')->name('delete');
            Route::get('/{id}/status', 'Admin\UserController@staffstatus')->name('status');
            Route::post('/bulkSuspend', 'Admin\UserController@bulkSuspend')->name('bulkSuspend');
        });

        //user activity
        Route::prefix('useractivity')->name('useractivity.')->group(function() {
            Route::get('/', 'Admin\ActivityController@index')->name('index');
            Route::get('/{id}/view', 'Admin\ActivityController@show')->name('view');
        });

        // product
        Route::prefix('product')->name('product.')->group(function () {
            Route::get('/list', 'Admin\ProductController@index')->name('index');
            Route::post('/search','Admin\ProductController@search')->name('search');
            Route::post('/subcategoriesByCategory','Admin\ProductController@subcategoriesByCategory')->name('subcategoriesByCategory');
            Route::get('/create', 'Admin\ProductController@create')->name('create');
            Route::post('/store', 'Admin\ProductController@store')->name('store');
            Route::get('/{id}/view', 'Admin\ProductController@show')->name('view');
            Route::post('/size', 'Admin\ProductController@size')->name('size');
            Route::get('/{id}/edit', 'Admin\ProductController@edit')->name('edit');
            Route::post('/update', 'Admin\ProductController@update')->name('update');
            Route::get('/{id}/status', 'Admin\ProductController@status')->name('status');
            Route::get('/{id}/sale', 'Admin\ProductController@sale')->name('sale');
            Route::get('/{id}/trending', 'Admin\ProductController@trending')->name('trending');
            Route::get('/{id}/delete', 'Admin\ProductController@destroy')->name('delete');
            Route::get('/{id}/image/delete', 'Admin\ProductController@destroySingleImage')->name('image.delete');
            Route::get('/bulkDelete', 'Admin\ProductController@bulkDestroy')->name('bulkDestroy');
            Route::post('/bulkSuspend', 'Admin\ProductController@bulkSuspend')->name('bulkSuspend');
            Route::get('/thresholdRequest', 'Admin\ProductController@thresholdRequest')->name('thresholdRequest');            
            Route::get('/{id}/viewThresholdRequest', 'Admin\ProductController@viewThresholdRequest')->name('viewThresholdRequest');
            Route::post('/setThreshold', 'Admin\ProductController@setThreshold')->name('setThreshold');
        });

        // address
        Route::prefix('address')->name('address.')->group(function() {
            Route::get('/', 'Admin\AddressController@index')->name('index');
            Route::post('/store', 'Admin\AddressController@store')->name('store');
            Route::get('/{id}/view', 'Admin\AddressController@show')->name('view');
            Route::post('/{id}/update', 'Admin\AddressController@update')->name('update');
            Route::get('/{id}/status', 'Admin\AddressController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\AddressController@destroy')->name('delete');
        });

        // faq
        Route::prefix('faq')->name('faq.')->group(function() {
            Route::get('/', 'Admin\FaqController@index')->name('index');
            Route::post('/store', 'Admin\FaqController@store')->name('store');
            Route::get('/{id}/view', 'Admin\FaqController@show')->name('view');
            Route::post('/{id}/update', 'Admin\FaqController@update')->name('update');
            Route::get('/{id}/status', 'Admin\FaqController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\FaqController@destroy')->name('delete');
        });

        // settings
        Route::prefix('settings')->name('settings.')->group(function () {
            Route::get('/', 'Admin\SettingsController@index')->name('index');
            Route::post('/store', 'Admin\SettingsController@store')->name('store');
            Route::get('/{id}/view', 'Admin\SettingsController@show')->name('view');
            Route::post('/{id}/update', 'Admin\SettingsController@update')->name('update');
            Route::get('/{id}/status', 'Admin\SettingsController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\SettingsController@destroy')->name('delete');
            Route::get('/bulkDelete', 'Admin\SettingsController@bulkDestroy')->name('bulkDestroy');
        });

        // order
        Route::prefix('order')->name('order.')->group(function() {
            Route::get('/', 'Admin\OrderController@index')->name('index');
            Route::post('/store', 'Admin\OrderController@store')->name('store');
            Route::get('/{id}/view', 'Admin\OrderController@show')->name('view');
            Route::post('/{id}/update', 'Admin\OrderController@update')->name('update');
            Route::get('/{id}/status/{status}', 'Admin\OrderController@status')->name('status');
        });

        // paymentcollection
        Route::prefix('paymentcollection')->name('paymentcollection.')->group(function() {
            Route::get('/', 'Admin\PaymentCollectionController@index')->name('index');
            Route::get('/{id}/approve', 'Admin\PaymentCollectionController@approve')->name('approve');
            
        });

        // transaction
        Route::prefix('transaction')->name('transaction.')->group(function() {
            Route::get('/', 'Admin\TransactionController@index')->name('index');
            Route::get('/{id}/view', 'Admin\TransactionController@show')->name('view');
        });

        Route::get('/store-wise-report', 'Admin\AdminController@storeWiseReport')->name('storeWiseReport');
        Route::get('/staff-wise-report', 'Admin\AdminController@staffWiseReport')->name('staffWiseReport');
        Route::get('/payment-collection-report', 'Admin\AdminController@paymentCollectionReport')->name('paymentCollectionReport');
        Route::get('/choose-ledger-user', 'Admin\AdminController@ledgerUser')->name('choose-ledger-user');
        Route::post('/getLedgerData', 'Admin\AdminController@getLedgerData')->name('getLedgerData');
        Route::any('/ledgerPDF', 'Admin\AdminController@ledgerPDF')->name('ledgerPDF');
        Route::any('/ledgerExcel', 'Admin\AdminController@ledgerExcel')->name('ledgerExcel');


        Route::prefix('ledger')->name('ledger.')->group(function(){
            Route::get('/', 'Admin\LedgerController@index')->name('index');
            Route::get('/add', 'Admin\LedgerController@add')->name('add');
            Route::post('/save', 'Admin\LedgerController@save')->name('save');
            Route::any('/getUsersByType', 'Admin\LedgerController@getUsersByType')->name('getUsersByType');
            Route::post('/getRequiredExpenses', 'Admin\LedgerController@getRequiredExpenses')->name('getRequiredExpenses');
            Route::any('/getBankList', 'Admin\LedgerController@getBankList')->name('getBankList');
        });

        Route::prefix('accounting')->name('accounting.')->group(function(){
            Route::get('/add_opening_balance', 'Admin\AccountingController@add_opening_balance')->name('add-opening-balance');
            Route::post('/save_opening_balance', 'Admin\AccountingController@save_opening_balance')->name('save_opening_balance');
            Route::get('/add_expenses', 'Admin\AccountingController@add_expenses')->name('add_expenses');
            Route::post('/save_expenses', 'Admin\AccountingController@save_expenses')->name('save_expenses');
            Route::get('/add_payment_receipt', 'Admin\AccountingController@add_payment_receipt')->name('add_payment_receipt');
            Route::post('/save_payment_receipt', 'Admin\AccountingController@save_payment_receipt')->name('save_payment_receipt');
        });

        // app settings

        Route::prefix('appsettings')->name('appsettings.')->group(function(){
            Route::get('/view', 'Admin\AppSettingsController@view')->name('view');
            Route::post('/save', 'Admin\AppSettingsController@save')->name('save');
        });
    });
});

Route::get('/home', 'HomeController@index')->name('home');
