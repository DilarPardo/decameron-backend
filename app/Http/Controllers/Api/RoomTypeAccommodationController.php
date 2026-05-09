<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RoomTypeAccommodation;
use App\Models\RoomType;
use App\Models\HotelRoom;
use Illuminate\Http\JsonResponse;
use App\Http\Requests\UpdateRoomTypeAccommodationRequest;
use App\Http\Requests\StoreRoomTypeAccommodationRequest;

class RoomTypeAccommodationController extends Controller
{

    public function index(): JsonResponse
    { 
        $asignaciones = HotelRoom::with([
            'hotel', 
            'roomTypeAccommodation.roomType', 
            'roomTypeAccommodation.accommodation'
        ])->get();

        return response()->json($asignaciones);
    }

    public function store(StoreRoomTypeAccommodationRequest $request): JsonResponse
    {
        $nuevaAsignacion = HotelRoom::create($request->validated());

        return response()->json([
            'message' => 'Habitaciones asignadas con éxito',
            'data' => $nuevaAsignacion->load(['hotel', 'roomTypeAccommodation.roomType', 'roomTypeAccommodation.accommodation'])
        ], 201);
    }   

    public function show($id): JsonResponse
    {
        $asignacion = HotelRoom::with([
            'hotel', 
            'roomTypeAccommodation.roomType', 
            'roomTypeAccommodation.accommodation'
        ])->findOrFail($id);

        return response()->json($asignacion);
    }

    public function update(UpdateRoomTypeAccommodationRequest $request, $id): JsonResponse
    {
        $asignacion = HotelRoom::findOrFail($id);
   
        $asignacion->update($request->validated());

        return response()->json([
            'message' => 'Asignación actualizada con éxito',
            'data' => $asignacion->load(['hotel', 'roomTypeAccommodation.roomType', 'roomTypeAccommodation.accommodation'])
        ]);
    }

    public function destroy($id): JsonResponse
    {
        $room = HotelRoom::findOrFail($id);
        $room->delete();
        return response()->json(['message' => 'Eliminado correctamente']);
    }

    public function getByRoomType($roomTypeId): JsonResponse
    {
        $options = RoomTypeAccommodation::where('room_type_id', $roomTypeId)
            ->with('accommodation') 
            ->get();
        return response()->json($options);
    }

}
