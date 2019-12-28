<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\OrderItem;
use Carbon\Carbon;

class OrderController extends Controller
{
    //for admin
    public function index()
    {
        //filter by date and status
        $from = \Request::get('from');
        $to = \Request::get('to');
        $status = \Request::get('status');
        $orders = Order::where('id', '>', 0);
        if($from) $orders->where('created_at', '>=', $from);
        if($to) $orders->where('created_at', '<', Carbon::parse($to)->addDays(1)->format('Y-m-d'));
        if($status) $orders->where('status', $status);
        return view('admin.orders', ['orders' => $orders->paginate(20)]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    //from API
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

    //order details page
    public function view($id)
    {
        return view('admin.order', ['order' => Order::find($id)]);
    }

    //set status and add remarks
    public function update(Request $request, $id)
    {
        $order = Order::find($id);
        $order->status = $request->status;
        $order->remarks .= "\n".$request->remarks;
        $order->save();
        return back();
    }
}
