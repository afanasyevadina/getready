<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\OrderItem;

class OrderController extends Controller
{

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
        $id = $order->id;
        foreach($request->get('orders') as $item) {
            $orderItem = new OrderItem();
            $orderItem->order_id = $id;
            $orderItem->fill($item);
            $orderItem->save();
        }
        return ['Order ID' => 1];
    }
}
