<?php

use Illuminate\Http\Request;
use App\Color;
use App\Product;
use App\NavItem;
use Illuminate\Support\Facades\Storage;

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
Route::get('colors', function() {
	return Color::all()->pluck('name');
});
Route::get('products', function() {
	return Product::all();
});
Route::get('links', function() {
	return NavItem::all();
});
Route::get('symbols', function() {
	return array_map(function($file) {
		return [
			'name' => $file,
			'path' => asset('storage/app/public/'.$file)
		];
	}, Storage::disk('public')->files('symbols'));
});
Route::post('orders', 'Api\OrderController@store');
