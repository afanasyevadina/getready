<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Symbol extends Model
{
    public $timestamps = false;

    protected $hidden = ['filename'];
    protected $appends = ['path'];
    public function getPathAttribute()
    {
        return asset('public/storage/'.$this->filename);
    }
}
