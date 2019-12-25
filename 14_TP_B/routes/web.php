<?php

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

Route::get('/', function () {
    return view('index');
});
Route::get('cart.php', 'CartController@index');

Auth::routes();

Route::middleware('auth')->get('/admin/orders', 'OrderController@index')->name('orders');
Route::middleware('auth')->get('/admin/orders/{id}', 'OrderController@view');
Route::middleware('auth')->post('/admin/orders/{id}/update', 'OrderController@update');
Route::middleware('auth')->get('/admin/nav', 'NavController@edit')->name('nav');
Route::middleware('auth')->get('/admin/symbols', 'SymbolController@edit')->name('symbols');
Route::middleware('auth')->post('/admin/symbols', 'SymbolController@store');
Route::middleware('auth')->post('/admin/nav', 'NavController@store');
Route::middleware('auth')->get('/admin/symbols/{id}/update', 'SymbolController@update');
Route::middleware('auth')->get('/admin/symbols/{id}/delete', 'SymbolController@destroy');
