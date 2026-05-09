<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Accommodation extends Model
{

    protected $fillable = ['name'];

    public function roomTypes()
    {
        return $this->belongsToMany(RoomType::class, 'room_type_accommodations');
    }
    
}
