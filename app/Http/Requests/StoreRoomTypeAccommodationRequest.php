<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use App\Models\Hotel;
use App\Models\HotelRoom;

class StoreRoomTypeAccommodationRequest extends FormRequest
{
    
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'hotel_id' => 'required|exists:hotels,id',
            'room_type_accommodation_id' => 'required|exists:room_type_accommodations,id',
            'quantity' => 'required|integer|min:1',
        ];
    }

    public function withValidator($validator)
    {
        $validator->after(function ($validator) {
            $hotel = Hotel::find($this->hotel_id);
            if (!$hotel) return;

            $totalAsignadas = HotelRoom::where('hotel_id', $this->hotel_id)->sum('quantity');

            if (($totalAsignadas + $this->quantity) > $hotel->max_rooms) {
                $validator->errors()->add('quantity', "Error: La capacidad máxima del hotel es de {$hotel->max_rooms} habitaciones. Actualmente tiene {$totalAsignadas} asignadas.");
            }

            $existe = HotelRoom::where('hotel_id', $this->hotel_id)
                ->where('room_type_accommodation_id', $this->room_type_accommodation_id)
                ->exists();

            if ($existe) {
                $validator->errors()->add('room_type_accommodation_id', "Este hotel ya tiene configurada esta combinación de tipo de habitación y acomodación.");
            }
        });
    }
    
}
