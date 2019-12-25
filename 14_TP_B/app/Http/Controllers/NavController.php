<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\NavItem;

class NavController extends Controller
{
    public function index()
    {
        return NavItem::orderBy('order_num')->get();
    }

    public function edit()
    {
        return view('admin.nav', ['links' => NavItem::orderBy('order_num')->get()]);
    }

    public function store(Request $request)
    {
        foreach($request->links as $key => $link) {
            NavItem::where('id', $link)->update(['order_num' => $key + 1]);
        }
        return back();
    }
}
