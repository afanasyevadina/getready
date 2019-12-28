@extends('layouts.app')
@section('content')
<main class="small-4 medium-3 col">
    <h1>Pre-Orders</h1>
    <!-- pagination -->
    {{ $orders->render() }}
    <ol class="order-list">
        @foreach($orders as $order)
        <a href="orders/{{ $order->id }}">
                <li>
                    <span class="status">
                        Status: {{ $order->status }}<br>
                        Order date: {{ date('d.m.Y', strtotime($order->created_at)) }}
                    </span>
                    <strong>#ORDER{{ $order->id }}</strong>
                    <ul class="product-list">
                        @foreach($order->items as $item)
                            <li>
                                <!-- preview -->
                                <div class="img">
                                    <img class="placeholder" src="{{ $item->product->path[$item->color->name] }}" alt="">
                                    <img src="{{ $item->symbol !== null ? $item->symbol->path : '' }}" class="thumb"/>
                                </div>
                            </li>
                        @endforeach
                    </ul>
                </li>
            </a>
        @endforeach
    </ol>
</main>
<aside class="small-4 medium-1 col">
    <h2>Filters</h2>
    <form action="orders">
        <label>Date from</label>
        <input type="date" name="from" value="{{ @$_GET['from'] ?? date('Y-m-d') }}" />
        <label>Date to</label>
        <input type="date" name="to" value="{{ @$_GET['to'] ?? date('Y-m-d') }}" />
        <label>Status filter</label>
        <select name="status">
            <option value="">All orders</option>
            <option {{ @$_GET['status'] == 'Open' ? 'selected' : ''}}>Open</option>
            <option {{ @$_GET['status'] == 'Prepared' ? 'selected' : ''}}>Prepared</option>
            <option {{ @$_GET['status'] == 'Closed/Delivered' ? 'selected' : ''}}>Closed/Delivered</option>
        </select>
        <input type="submit" value="Show" class="filter"/>
    </form>
</aside>
@endsection