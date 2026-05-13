<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AccommodationController;
use App\Http\Controllers\Api\RoomTypeController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\RoomTypeAccommodationController;
use App\Http\Controllers\Api\HotelController;
use App\Http\Controllers\Api\DashboardController;

Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::middleware('auth:sanctum')->group(function () {

    Route::get('/me', [AuthController::class, 'me']);

    Route::post('/logout', [AuthController::class, 'logout']);

    Route::get('dashboard-stats', [DashboardController::class, 'index']);

    Route::apiResource('hotels', HotelController::class); 

    Route::post('room-types/{id}/accommodations', [RoomTypeController::class, 'storeRelation']);
    Route::delete('room-types/{roomTypeId}/accommodations/{accommodationId}', [RoomTypeController::class, 'destroyRelation']);
    Route::apiResource('room-types', RoomTypeController::class)->only(['index', 'show']);
    Route::get('room-rules', [RoomTypeController::class, 'getAvailableRules']);
    Route::get('room-types/{id}/accommodations', [RoomTypeController::class, 'getAccommodations']);

    Route::apiResource('accommodations', AccommodationController::class)->only(['index', 'show']);
    Route::apiResource('hotel-rooms', RoomTypeAccommodationController::class);

    Route::get('states', [LocationController::class, 'getStates']);
    Route::get('states/{stateId}/cities', [LocationController::class, 'getCitiesByState']);  

});