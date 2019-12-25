<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = ['firstname', 'lastname', 'email', 'status', 'remarks'];

    public function items()
    {
        return $this->hasMany('App\OrderItem');
    }
}
