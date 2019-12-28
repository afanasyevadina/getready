<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Color;

class ColorController extends Controller
{
    //for API
    public function index()
    {
        return Color::all();
    }
}
