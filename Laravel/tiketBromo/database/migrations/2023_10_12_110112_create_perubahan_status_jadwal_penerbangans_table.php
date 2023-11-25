<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('perubahan_status_jadwal_penerbangans', function (Blueprint $table) {
            $table->id();
            $table->integer('JadwalPenerbanganID');
            $table->integer('StatusPenerbanganID');
            $table->string('WaktuPerubahanTerjadi');
            $table->integer('PerkiraanWaktuDelay');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('perubahan_status_jadwal_penerbangans');
    }
};
