@extends('layouts.app')
@section('content')
<main class="small-4 col">
        <h1>Order Detail for #ORDER {{ $order->id }}</h1>
    
        <ol class="status-bar">
          <li class="{{ $order->status == 'Open' ? 'active': '' }}">Opened</li>
          <li class="{{ $order->status == 'Prepared' ? 'active': '' }}">Prepared</li>
          <li class="{{ $order->status == 'Closed/Delivered' ? 'active': '' }}">Closed/Delivered</li>
        </ol>
    
        <div class="contacts">
            <p>First Name: {{ $order->firstname }}</p>
            <p>Last Name: {{ $order->lastname }}</p>
            <p>E-mail: {{ $order->email }}</p>
            <p><i>Remarks: {{ $order->remarks }}</i></p>
        </div>
        <ul class="product-list">
            @foreach($order->items as $item)
            <li>
                <div class="img">
                    <img class="placeholder" src="{{ $item->product->path[$item->color->name] }}" alt="">
                    <img src="{{ $item->symbol->path }}" class="thumb"/>
                </div>
                <div class="info">
                    <p>Product ID: {{ $item->product_id }}</p>
                    <p>Price: ${{ $item->product->price }}</p>
                    <p>Color ID: {{ $item->color_id }}</p>
                </div>
            </li>
            @endforeach
        </ul>
        <form action="{{ action('OrderController@update', ['id' => $order->id]) }}" method="POST">
            @csrf
            <label>
            Remarks<br>
            <textarea name="remarks"></textarea>
            </label>
            @if($order->status != 'Closed/Delivered')        
            <p>
                Status<br>
                @if($order->status == 'Open')
                <label>
                    <input type="radio" name="status" value="Open" checked>Opened
                </label>
                <label>
                    <input type="radio" name="status" value="Prepared">Prepared
                </label>
                @endif
                @if($order->status == 'Prepared')
                <label>
                    <input type="radio" name="status" value="Prepared" checked>Prepared
                </label>
                <label>
                    <input type="radio" name="status" value="Closed/Delivered">Closed/Delivered
                </label>
                @endif
            </p>
            @endif
        
            <p><input type="submit" value="Update"></p>
        </form>
    
      </main>
@endsection