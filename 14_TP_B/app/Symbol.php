<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Symbol extends Model
{
    public $timestamps = false;

    protected $hidden = ['filename'];
    protected $appends = ['path'];

    //returns absolute path
    public function getPathAttribute()
    {
        return asset('storage/app/public/'.$this->filename);
    }
}
