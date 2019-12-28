<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class ProductController extends Controller
{
    //for API
    public function index()
    {
        return Product::all();
    }
}
