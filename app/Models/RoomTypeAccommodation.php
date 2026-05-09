<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoomTypeAccommodation extends Model
{
    protected $fillable = ['room_type_id', 'accommodation_id'];

    public function roomType() 
    {
        return $this->belongsTo(RoomType::class);
    }

    public function accommodation() 
    {
        return $this->belongsTo(Accommodation::class);
    }

}
