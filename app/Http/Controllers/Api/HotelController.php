<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\HotelRoom;
use App\Http\Requests\StoreHotelRequest;
use App\Http\Requests\UpdateHotelRequest;
use App\Http\Requests\AssignRoomRequest;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class HotelController extends Controller
{

    public function index(): JsonResponse
    {
        $hotels = Hotel::with(['city.state', 'hotelRooms.roomTypeAccommodation.roomType', 
        'hotelRooms.roomTypeAccommodation.accommodation'])->get();
        return response()->json($hotels, 200);
    }

    public function store(StoreHotelRequest $request): JsonResponse
    {
        $hotel = Hotel::create($request->validated());
        return response()->json(['message' => 'Hotel creado con éxito', 'data' => $hotel], 201);
    }

    public function show(Hotel $hotel): JsonResponse
    {
        return response()->json($hotel->load(['city.state', 'hotelRooms.roomTypeAccommodation']), 200);
    }

    public function update(UpdateHotelRequest $request, Hotel $hotel): JsonResponse
    {
        $hotel->update($request->validated());

        return response()->json([
            'message' => 'Hotel actualizado con éxito',
            'data' => $hotel
        ], 200);
    }

    public function destroy(Hotel $hotel): JsonResponse
    {
        $hotel->delete();
        return response()->json(['message' => 'Hotel eliminado correctamente'], 200);
    }

}
