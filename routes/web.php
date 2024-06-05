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
Route::middleware(['guest:admin'])->group(function() {
    Route::view('/', 'admin.auth.login')->name('home');
    Route::get('/login', 'Admin\Auth\AuthController@index');
});


Route::prefix('cron')->name('cron.')->group(function(){
    Route::get('/generateTask', 'CronController@generateTask')->name('generateTask');
    Route::get('/test', 'CronController@test')->name('test');    
});


Route::prefix('test')->name('test.')->group(function(){    
    Route::get('/invoicePayments', 'TestController@invoicePayments')->name('invoicePayments');
    Route::get('/staffCommission', 'TestController@staffCommission')->name('staffCommission');
    Route::get('/save', 'TestController@save')->name('save');
    Route::get('/saveStoreVisitLedger', 'TestController@saveStoreVisitLedger')->name('saveStoreVisitLedger');
    Route::any('/chatSendMsg', 'TestController@chatSendMsg')->name('chatSendMsg');
});

Auth::routes();

// admin guard
Route::prefix('admin')->name('admin.')->group(function() {
    Route::middleware(['guest:admin'])->group(function() {
        Route::view('/login', 'admin.auth.login')->name('login');
        Route::post('/check', 'Admin\Auth\AuthController@login')->name('login.check');
        // Route::post('/check', 'Admin\AdminController@check')->name('login.check');
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
            Route::post('/store', 'Admin\CategoryController@store')->name('store');
            Route::get('/{id}/view', 'Admin\CategoryController@show')->name('view');
            Route::post('/{id}/update', 'Admin\CategoryController@update')->name('update');
            Route::get('/{id}/status', 'Admin\CategoryController@status')->name('status');
            Route::post('/bulkSuspend', 'Admin\CategoryController@bulkSuspend')->name('bulkSuspend');
        });

        // sub-category
        Route::prefix('subcategory')->name('subcategory.')->group(function () {
            Route::get('/', 'Admin\SubCategoryController@index')->name('index');
            Route::post('/store', 'Admin\SubCategoryController@store')->name('store');
            Route::get('/{id}/view', 'Admin\SubCategoryController@show')->name('view');
            Route::post('/{id}/update', 'Admin\SubCategoryController@update')->name('update');
            Route::get('/{id}/status', 'Admin\SubCategoryController@status')->name('status');
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

        // purchaseorder
        Route::prefix('purchaseorder')->name('purchaseorder.')->group(function () {
            Route::get('/', 'Admin\PurchaseOrderController@index')->name('index');
            Route::get('/create/{supplier_id?}', 'Admin\PurchaseOrderController@create')->name('create');
            Route::post('/store', 'Admin\PurchaseOrderController@store')->name('store');
            Route::get('/{unique_id}/view', 'Admin\PurchaseOrderController@show')->name('view');
            Route::get('/{unique_id}/edit', 'Admin\PurchaseOrderController@edit')->name('edit');
            Route::post('/update', 'Admin\PurchaseOrderController@update')->name('update');
            Route::post('/bulkSuspend', 'Admin\PurchaseOrderController@bulkSuspend')->name('bulkSuspend');
            Route::get('/showboxes/{unique_id}/{product_id?}', 'Admin\PurchaseOrderController@showboxes')->name('showboxes');            
            Route::post('/saveinventory', 'Admin\PurchaseOrderController@saveinventory')->name('saveinventory');
            Route::get('/{unique_id}/grn', 'Admin\PurchaseOrderController@grn')->name('grn');
            Route::get('/addbox/{unique_id}/{product_id}', 'Admin\PurchaseOrderController@addbox')->name('addbox');
            Route::get('/deletebox/{unique_id}/{product_id}/{barcode_no}', 'Admin\PurchaseOrderController@deletebox')->name('deletebox');
            Route::get('/archiveBox/{unique_id}/{product_id}/{barcode_no}', 'Admin\PurchaseOrderController@archiveBox')->name('archiveBox');
            Route::get('/{unique_id}/viewstocks', 'Admin\PurchaseOrderController@viewstocks')->name('viewstocks');
            Route::get('/{unique_id}/archivedBoxes', 'Admin\PurchaseOrderController@archivedBoxes')->name('archivedBoxes');
            Route::Post('/getProductsSupplier', 'Admin\PurchaseOrderController@getProductsSupplier')->name('getProductsSupplier');
            Route::post('/checkScannedboxes', 'Admin\PurchaseOrderController@checkScannedboxes')->name('checkScannedboxes');
            Route::get('/{unique_id}/viewGrn','Admin\PurchaseOrderController@viewGrn')->name('viewGrn');
            
        });

        // grn
        Route::prefix('grn')->name('grn.*')->group(function() {
            Route::get('/', 'Admin\StockController@listgrn')->name('list');
        });

        // stock
        /*Route::prefix('stock')->name('stock.')->group(function(){
            Route::get('/', 'Admin\StockController@index')->name('index');
            Route::get('/{product_id?}', 'Admin\StockController@details')->name('details');
        });*/

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
            Route::get('/', 'Admin\PackingslipController@index')->name('index');
            Route::get('/{id}/add', 'Admin\PackingslipController@add')->name('add');
            Route::post('/save', 'Admin\PackingslipController@save')->name('save');
            Route::get('/{slip_no}/boxes', 'Admin\PackingslipController@boxes')->name('boxes');
            Route::get('/{slip_no}/get_pdf', 'Admin\PackingslipController@get_pdf')->name('get_pdf');
            Route::get('/{invoice_no}/view_invoice', 'Admin\PackingslipController@view_invoice')->name('view_invoice');

            Route::get('/{slip_no}/raise_invoice_form', 'Admin\PackingslipController@raise_invoice_form')->name('raise_invoice_form');
            Route::post('/save_invoice', 'Admin\PackingslipController@save_invoice')->name('save_invoice');
            Route::post('/upload_trn', 'Admin\PackingslipController@upload_trn')->name('upload_trn');

            Route::get('/{slip_no}/view_goods_stock', 'Admin\PackingslipController@view_goods_stock')->name('view_goods_stock');
            Route::post('/checkScannedboxes', 'Admin\PackingslipController@checkScannedboxes')->name('checkScannedboxes');
            Route::post('/save_goods_out', 'Admin\PackingslipController@save_goods_out')->name('save_goods_out');

            Route::get('/{order_id}/{product_id}/{ctns}/{pcs}/pieces', 'Admin\PackingslipController@pieces')->name('pieces');
            Route::get('/{order_id}/{product_id}/pieces', 'Admin\PackingslipController@removepieces')->name('removepieces');
            Route::post('/set_product_ctns_pcs_ps', 'Admin\PackingslipController@set_product_ctns_pcs_ps')->name('set_product_ctns_pcs_ps');
        });

        // invoice
        Route::prefix('invoice')->name('invoice.')->group(function(){
            Route::get('/', 'Admin\InvoiceController@index')->name('index');
            Route::get('/store/{id}', 'Admin\InvoiceController@store')->name('store');
            Route::get('/staff/{id}', 'Admin\InvoiceController@staff')->name('staff');
            Route::get('/payments/{id}/{user_id?}/{user_type?}', 'Admin\InvoiceController@payments')->name('payments');
        });

        Route::get('/generateQrCode1', 'Admin\PackingslipController@generateQrCode1')->name('generateQrCode1');
        
        Route::get('/barcodes/{unique_id}', 'Admin\PurchaseOrderController@barcodes')->name('barcodes');

        // store
        Route::prefix('store')->name('store.')->group(function() {
            Route::get('/', 'Admin\StoreController@index')->name('index');
            Route::get('/create', 'Admin\StoreController@create')->name('create');
            Route::post('/store', 'Admin\StoreController@store')->name('store');
            Route::get('/{id}/edit', 'Admin\StoreController@edit')->name('edit');
            Route::get('/{id}/view', 'Admin\StoreController@show')->name('view');
            Route::post('/{id}/update', 'Admin\StoreController@update')->name('update');
            Route::get('/{id}/status', 'Admin\StoreController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\StoreController@destroy')->name('delete');
            Route::post('/bulkSuspend', 'Admin\StoreController@bulkSuspend')->name('bulkSuspend');
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
            // Route::view('/create', 'admin.staff.create')->name('create');
            Route::get('/create', 'Admin\UserController@createStaff')->name('create');
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

        // designation
        Route::prefix('designation')->name('designation.')->group(function() {
            Route::get('/', 'Admin\DesignationController@index')->name('index');
            Route::get('/{id}/view', 'Admin\DesignationController@show')->name('view');
            Route::get('/{id}/status', 'Admin\DesignationController@status')->name('status');
            Route::post('/{id}/update', 'Admin\DesignationController@update')->name('update');
            Route::post('/store', 'Admin\DesignationController@store')->name('store');
            Route::post('/bulkSuspend', 'Admin\DesignationController@bulkSuspend')->name('bulkSuspend');
        });

        // staff's store visit
        Route::prefix('visit')->name('visit.')->group(function() {
            Route::get('/{user_id}', 'Admin\VisitController@index')->name('index');
            Route::get('/details/{visit_id}', 'Admin\VisitController@details')->name('details');
        });

        //user activity
        Route::prefix('useractivity')->name('useractivity.')->group(function() {
            Route::get('/', 'Admin\ActivityController@index')->name('index');
            Route::get('/{id}/view', 'Admin\ActivityController@show')->name('view');
        });

        // product
        Route::prefix('product')->name('product.')->group(function () {
            Route::get('/list', 'Admin\ProductController@index')->name('index');            
            Route::post('/subcategoriesByCategory','Admin\ProductController@subcategoriesByCategory')->name('subcategoriesByCategory');
            Route::get('/create', 'Admin\ProductController@create')->name('create');
            Route::post('/store', 'Admin\ProductController@store')->name('store');
            Route::get('/{id}/view', 'Admin\ProductController@show')->name('view');            
            Route::get('/{id}/edit', 'Admin\ProductController@edit')->name('edit');
            Route::post('/update', 'Admin\ProductController@update')->name('update');
            Route::get('/{id}/status', 'Admin\ProductController@status')->name('status');
            Route::get('/{id}/delete', 'Admin\ProductController@destroy')->name('delete');
            Route::get('/{id}/image/delete', 'Admin\ProductController@destroySingleImage')->name('image.delete');
            Route::post('/bulkSuspend', 'Admin\ProductController@bulkSuspend')->name('bulkSuspend');
            Route::get('/thresholdRequest', 'Admin\ProductController@thresholdRequest')->name('thresholdRequest');            
            Route::get('/{id}/viewThresholdRequest', 'Admin\ProductController@viewThresholdRequest')->name('viewThresholdRequest');
            Route::post('/setThreshold', 'Admin\ProductController@setThreshold')->name('setThreshold');
            Route::get('/{id}/viewRequestedPriceReceiveOrder', 'Admin\ProductController@viewRequestedPriceReceiveOrder')->name('viewRequestedPriceReceiveOrder');
            Route::post('/saveRequestedPriceReceiveOrder', 'Admin\ProductController@saveRequestedPriceReceiveOrder')->name('saveRequestedPriceReceiveOrder');
            Route::get('/{id}/viewDetail','Admin\ProductController@viewDetail')->name('viewDetail');
            Route::post('/searchByName', 'Admin\ProductController@searchByName')->name('searchByName');
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

        Route::get('/store-wise-report', 'Admin\AdminController@storeWiseReport')->name('storeWiseReport');
        Route::get('/staff-wise-report', 'Admin\AdminController@staffWiseReport')->name('staffWiseReport');
        Route::get('/payment-collection-report', 'Admin\AdminController@paymentCollectionReport')->name('paymentCollectionReport');
        Route::get('/choose-ledger-user', 'Admin\AdminController@ledgerUser')->name('choose-ledger-user');
        
        Route::any('/ledgerPDF', 'Admin\AdminController@ledgerPDF')->name('ledgerPDF');
        Route::any('/ledgerExcel', 'Admin\AdminController@ledgerExcel')->name('ledgerExcel');


        Route::prefix('ledger')->name('ledger.')->group(function(){            
            Route::any('/getUsersByType', 'Admin\LedgerController@getUsersByType')->name('getUsersByType');
            Route::post('/getRequiredExpenses', 'Admin\LedgerController@getRequiredExpenses')->name('getRequiredExpenses');
            Route::any('/getBankList', 'Admin\LedgerController@getBankList')->name('getBankList');            
        });

        Route::prefix('accounting')->name('accounting.')->group(function(){
            Route::get('/add_opening_balance/{type?}', 'Admin\AccountingController@add_opening_balance')->name('add-opening-balance');
            Route::post('/save_opening_balance', 'Admin\AccountingController@save_opening_balance')->name('save_opening_balance');
            Route::post('/save_opening_balance_partner', 'Admin\AccountingController@save_opening_balance_partner')->name('save_opening_balance_partner');
            Route::get('/add_expenses', 'Admin\AccountingController@add_expenses')->name('add_expenses');
            Route::get('/add_expense_partner_withdrawls/{id}', 'Admin\AccountingController@add_expense_partner_withdrawls')->name('add_expense_partner_withdrawls');
            Route::post('/save_expenses', 'Admin\AccountingController@save_expenses')->name('save_expenses');
            Route::get('/add_payment_receipt/{paymentCollectionId?}', 'Admin\AccountingController@add_payment_receipt')->name('add_payment_receipt');
            Route::post('/save_payment_receipt', 'Admin\AccountingController@save_payment_receipt')->name('save_payment_receipt');
            Route::get('listopeningbalance', 'Admin\AccountingController@listopeningbalance')->name('listopeningbalance');
            Route::get('/{id}/deleteopeningbalance','Admin\AccountingController@deleteopeningbalance')->name('deleteopeningbalance');
        });

        // app settings

        Route::prefix('appsettings')->name('appsettings.')->group(function(){
            Route::get('/view', 'Admin\AppSettingsController@view')->name('view');
            Route::post('/save', 'Admin\AppSettingsController@save')->name('save');
        });

        // revenue
        Route::prefix('revenue')->name('revenue.')->group(function(){
            Route::get('/','Admin\RevenueController@details')->name('index');
            Route::get('/withdraw_form', 'Admin\RevenueController@withdraw_form')->name('withdraw_form');
            Route::post('/withdraw_partner_amount','Admin\RevenueController@withdraw_partner_amount')->name('withdraw_partner_amount');
            Route::get('/withdrawls', 'Admin\RevenueController@withdrawls')->name('withdrawls');
            Route::get('/delete_request/{id}', 'Admin\RevenueController@delete_request')->name('delete_request');
        });
    });
});

Route::get('/home', 'HomeController@index')->name('home');
