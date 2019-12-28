<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\NavItem;

class NavController extends Controller
{
    //for API
    public function index()
    {
        return NavItem::orderBy('order_num')->get();
    }

    //for admin
    public function edit()
    {
        return view('admin.nav', ['links' => NavItem::orderBy('order_num')->get()]);
    }

    public function store(Request $request)
    {
        //save updated order
        foreach($request->links as $key => $link) {
            NavItem::where('id', $link)->update(['order_num' => $key + 1]);
        }
        return back();
    }
}
