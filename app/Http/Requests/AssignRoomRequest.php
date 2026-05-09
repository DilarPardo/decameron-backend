<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class AssignRoomRequest extends FormRequest
{
    
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array {
        return [
            'room_type_accommodation_id' => 'required|exists:room_type_accommodations,id',
            'quantity' => 'required|integer|min:1',
        ];
    }

}
