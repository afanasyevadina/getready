<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Product extends Model
{
    public $timestamps = false;
    protected $appends = ['path'];

    //dynamically returns absolute path to file
    public function getPathAttribute()
    {
        //in folder named as name of product
        //files are named as color variants 
    	$variants = [];
    	foreach(Storage::disk('public')->files('products/'.$this->name) as $file) {
    		$variants[pathinfo($file, PATHINFO_FILENAME)] = asset('storage/app/public/'.$file);
    	}
    	return $variants;
    }
}
