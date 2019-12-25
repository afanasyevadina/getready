<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\OrderItem;

class OrderController extends Controller
{
    public function index()
    {
        $from = \Request::get('from');
        $to = \Request::get('to');
        $status = \Request::get('status');
        $orders = Order::where('id', '>', 0);
        if($from) $orders->where('created_at', '>=', $from);
        if($to) $orders->where('created_at', '<=', $to);
        if($status) $orders->where('status', $status);
        return view('admin.orders', ['orders' => $orders->paginate(20)]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $order = Order::create($request->get('contact'));
        $order->total = $request->get('total');
        $order->save();
        foreach($request->get('orders') as $item) {
            $orderItem = new OrderItem();
            $orderItem->order_id = $order->id;
            $orderItem->fill($item);
            $orderItem->save();
        }
        return [
            'message' => 'Thank you, '.$order->firstname.' '.$order->lastname.', your order ID is: '.$order->id
        ];
    }

    public function view($id)
    {
        return view('admin.order', ['order' => Order::find($id)]);
    }

    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $order->status = $request->status;
        $order->remarks .= "\n".$request->remarks;
        $order->save();
        return back();
    }
}
