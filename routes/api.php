<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AccommodationController;
use App\Http\Controllers\Api\RoomTypeController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\RoomTypeAccommodationController;
use App\Http\Controllers\Api\HotelController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/login', [AuthController::class, 'login']);


Route::middleware('auth:sanctum')->group(function () {

Route::get('/me', [AuthController::class, 'me']);
 
Route::post('/logout', [AuthController::class, 'logout']);

Route::apiResource('accommodations', AccommodationController::class)->only(['index', 'show']);

Route::apiResource('room-types', RoomTypeController::class)->only(['index', 'show']);

Route::get('states', [LocationController::class, 'getStates']);

Route::get('states/{stateId}/cities', [LocationController::class, 'getCitiesByState']);

Route::apiResource('hotel-rooms', RoomTypeAccommodationController::class);

Route::get('room-rules', [RoomTypeAccommodationController::class, 'index']);

Route::get('room-types/{roomTypeId}/accommodations', [RoomTypeAccommodationController::class, 'getByRoomType']);

Route::apiResource('hotels', HotelController::class);

});

