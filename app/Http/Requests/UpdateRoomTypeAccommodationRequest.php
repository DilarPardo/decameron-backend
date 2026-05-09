<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateRoomTypeAccommodationRequest extends StoreRoomTypeAccommodationRequest
{
    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $hotel = \App\Models\Hotel::find($this->hotel_id);
            if (!$hotel) return;

            $totalAsignadas = \App\Models\HotelRoom::where('hotel_id', $this->hotel_id)
                ->when($this->route('asignacione'), function($q) {

                    $q->where('id', '!=', $this->route('asignacione'));
                })
                ->sum('quantity');

            if (($totalAsignadas + $this->quantity) > $hotel->max_rooms) {
                $validator->errors()->add('quantity', "Al actualizar, la cantidad total superaría el máximo de {$hotel->max_rooms} del hotel.");
            }
        });
    }
}
