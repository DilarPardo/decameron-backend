<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('hotel_rooms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('hotel_id')->constrained()->onDelete('cascade');
            $table->foreignId('room_type_accommodation_id', 'rta_fk')
                  ->constrained('room_type_accommodations')
                  ->onDelete('restrict');
            $table->integer('quantity')->unsigned();
            $table->string('status')->default('Activo');
            $table->timestamps();

            $table->unique(['hotel_id', 'room_type_accommodation_id'], 'hotel_room_unique');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hotel_rooms');
    }
};
