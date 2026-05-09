<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\State;
use App\Models\City;
use Illuminate\Http\JsonResponse;

class LocationController extends Controller
{

    public function getStates(): JsonResponse
    {
        return response()->json(State::all(), 200);
    }

    public function indexCities(): JsonResponse
    {
        return response()->json(City::with('state')->get(), 200);
    }

    public function getCitiesByState($stateId): JsonResponse
    {
        $cities = City::where('state_id', $stateId)->get();
        
        if ($cities->isEmpty()) {
            return response()->json(['message' => 'No se encontraron ciudades para este departamento'], 404);
        }

        return response()->json($cities, 200);
    }

}
