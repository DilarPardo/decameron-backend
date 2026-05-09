<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\State;
use App\Models\City;
use App\Models\RoomType;
use App\Models\Accommodation;
use App\Models\RoomTypeAccommodation;
use Illuminate\Support\Facades\DB;

class DecameronSeeder extends Seeder
{

    public function run(): void
    {

        DB::statement('TRUNCATE states RESTART IDENTITY CASCADE');
        DB::statement('TRUNCATE room_types RESTART IDENTITY CASCADE');
        DB::statement('TRUNCATE accommodations RESTART IDENTITY CASCADE');

        // CARGA GEOGRÁFICA (Departamentos y Ciudades de Colombia)
        $locations = [
            'Bolívar' => ['Cartagena', 'Magangué', 'Turbaco'],
            'Magdalena' => ['Santa Marta', 'Ciénaga', 'Fundación'],
            'Archipiélago de San Andrés' => ['San Andrés', 'Providencia'],
            'Amazonas' => ['Leticia'],
            'Antioquia' => ['Medellín', 'Rionegro', 'Envigado'],
            'Cundinamarca' => ['Bogotá', 'Girardot', 'Villeta'],
            'Quindío' => ['Armenia', 'Montenegro', 'Salento'],
            'Valle del Cauca' => ['Cali', 'Buenaventura'],
            'Atlántico' => ['Barranquilla', 'Puerto Colombia']
        ];

        foreach ($locations as $stateName => $cities) {
            $state = State::create(['name' => $stateName]);
            foreach ($cities as $cityName) {
                City::create([
                    'name' => $cityName,
                    'state_id' => $state->id
                ]);
            }
        }

        // CONFIGURACIÓN DINÁMICA DE REGLAS DE NEGOCIO
        $rules = [
            'Standard' => ['Single', 'Double'],
            'Junior' => ['Triple', 'Quadruple'],
            'Suite' => ['Single', 'Double', 'Triple']
        ];

        foreach ($rules as $typeName => $accommodationNames) {
            $roomType = RoomType::create(['name' => $typeName]);

            foreach ($accommodationNames as $accName) {
                $accommodation = Accommodation::firstOrCreate(['name' => $accName]);

                RoomTypeAccommodation::create([
                    'room_type_id' => $roomType->id,
                    'accommodation_id' => $accommodation->id
                ]);
            }
        }
    }

}
