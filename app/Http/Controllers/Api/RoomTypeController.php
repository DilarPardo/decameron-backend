<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoomType;
use App\Http\Requests\StoreRoomTypeRequest;
use App\Http\Requests\UpdateRoomTypeRequest;
use Illuminate\Http\JsonResponse;

class RoomTypeController extends Controller
{

    public function index(): JsonResponse
    {
        return response()->json(RoomType::all(), 200);
    }

    public function store(StoreRoomTypeRequest $request): JsonResponse
    {
        $roomType = RoomType::create($request->validated());

        return response()->json([
            'message' => 'Tipo de habitación creado con éxito',
            'data' => $roomType
        ], 201);
    }

    public function show(RoomType $roomType): JsonResponse
    {
        return response()->json($roomType, 200);
    }

    public function update(UpdateRoomTypeRequest $request, RoomType $roomType): JsonResponse
    {
        $roomType->update($request->validated());

        return response()->json([
            'message' => 'Tipo de habitación actualizado',
            'data' => $roomType
        ], 200);
    }

    public function destroy(RoomType $roomType): JsonResponse
    {
        $roomType->delete();
        return response()->json(['message' => 'Tipo de habitación eliminado'], 200);
    }

}
