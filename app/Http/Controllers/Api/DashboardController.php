<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HotelRoom;
use App\Models\RoomTypeAccommodation;
use App\Models\Hotel;
use App\Models\RoomType;
use App\Models\Accommodation;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        return response()->json([
            'total_hotels' => Hotel::count(),
            'total_room_types' => RoomType::count(),
            'total_accommodations' => Accommodation::count(),
            'total_assignments' => (int) HotelRoom::sum('quantity'),
            'chart_data' => Hotel::withSum('hotelRooms as asignadas', 'quantity')
                ->get(['id', 'name'])
                ->map(fn($h) => [
                    'name' => $h->name,
                    'asignadas' => $h->asignadas ?? 0
                ])
        ]);
    }
}
