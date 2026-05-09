<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hotel extends Model
{
    use SoftDeletes;
    
    protected $fillable = ['name', 'address', 'city_id', 'nit', 'max_rooms'];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function hotelRooms()
    {
        return $this->hasMany(HotelRoom::class);
    }

}
