<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    public $timestamps = false;
    protected $fillable = ['symbol_id', 'product_id', 'color_id'];

    public function product()
    {
        return $this->belongsTo('App\Product');
    }

    public function color()
    {
        return $this->belongsTo('App\Color');
    }

    public function symbol()
    {
        return $this->belongsTo('App\Symbol');
    }
}
