<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoomType;
use Illuminate\Http\JsonResponse;

class RoomTypeController extends Controller
{

    public function index(): JsonResponse
    {
        return response()->json(RoomType::with('accommodations')->get());
    }

    public function storeRelation(Request $request, $id): JsonResponse
    {
        $roomType = RoomType::findOrFail($id);
        $accommodationId = $request->accommodation_id;

        // Reglas de negocio Decameron
        $isValid = false;
        if ($id == 1 && in_array($accommodationId, [1, 2])) $isValid = true; // Estándar
        if ($id == 2 && in_array($accommodationId, [3, 4])) $isValid = true; // Junior
        if ($id == 3 && in_array($accommodationId, [1, 2, 3])) $isValid = true; // Suite

        if (!$isValid) {
            return response()->json(['message' => 'Combinación no permitida por reglas de Decameron.'], 422);
        }

        $roomType->accommodations()->syncWithoutDetaching([$accommodationId]);

        return response()->json([
            'message' => 'Acomodación vinculada con éxito',
            'data' => $roomType->load('accommodations')
        ], 201);
    }

    public function destroyRelation($roomTypeId, $accommodationId): JsonResponse
    {
        try {
            $roomType = RoomType::findOrFail($roomTypeId);
            
            // detach quita la fila de la tabla intermedia sin borrar el Tipo ni la Acomodación
            $roomType->accommodations()->detach($accommodationId);

            return response()->json(['message' => 'Vínculo eliminado con éxito'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Error al eliminar', 'error' => $e->getMessage()], 500);
        }
    }

    public function getAvailableRules(): \Illuminate\Http\JsonResponse
    {
        $rules = \App\Models\RoomTypeAccommodation::with(['roomType', 'accommodation'])->get();
        return response()->json($rules);
    }

    public function getAccommodations($id): JsonResponse
    {
        $roomType = RoomType::with('accommodations')->find($id);

        if (!$roomType) {
            return response()->json(['message' => 'Tipo de habitación no encontrado'], 404);
        }

        return response()->json($roomType->accommodations);
    }

}