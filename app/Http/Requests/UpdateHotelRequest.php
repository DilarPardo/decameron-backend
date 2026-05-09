<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateHotelRequest extends FormRequest
{
    
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $hotel = $this->route('hotel');
        $hotelId = is_object($hotel) ? $hotel->id : $hotel;

        return [
            'name'      => 'required|string|max:255',
            'address'   => 'required|string|max:255',
            'city_id'   => 'required|exists:cities,id',
            'max_rooms' => 'required|integer|min:1',
            'nit'       => 'required|string|unique:hotels,nit,' . $hotelId,
        ];
    }

}
