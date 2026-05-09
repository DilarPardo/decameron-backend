<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreHotelRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array {
        return [
            'name' => 'required|string|max:150|unique:hotels,name',
            'address' => 'required|string|max:255',
            'city_id' => 'required|exists:cities,id',
            'nit' => 'required|string|max:20|unique:hotels,nit',
            'max_rooms' => 'required|integer|min:1',
        ];
    }

}
