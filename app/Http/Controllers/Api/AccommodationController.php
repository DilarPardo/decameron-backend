<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Accommodation;
use Illuminate\Http\JsonResponse;
use App\Http\Requests\StoreAccommodationRequest;
use App\Http\Requests\UpdateAccommodationRequest;

class AccommodationController extends Controller
{
    
    public function index(): JsonResponse
    {
        return response()->json(Accommodation::all(), 200);
    }

    public function store(StoreAccommodationRequest $request): JsonResponse
    {
        $accommodation = Accommodation::create($request->validated());

        return response()->json([
            'message' => 'Creado con éxito',
            'data' => $accommodation
        ], 201);
    }

    public function show(Accommodation $accommodation): JsonResponse
    {
        return response()->json($accommodation, 200);
    }

    public function update(UpdateAccommodationRequest $request, Accommodation $accommodation): JsonResponse
    {
        $accommodation->update($request->validated());

        return response()->json([
            'message' => 'Actualizado con éxito',
            'data' => $accommodation
        ], 200);
    }

    public function destroy(Accommodation $accommodation): JsonResponse
    {
        $accommodation->delete();
        return response()->json(['message' => 'Eliminado'], 200);
    }

}
