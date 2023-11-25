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
        Schema::create('jadwal_penerbangans', function (Blueprint $table) {
            $table->id();
            $table->string('KodePenerbangan');
            $table->integer('BandaraKeberangkatanID');
            $table->integer('BandaraTujuanID');
            $table->integer('MaskapaiID');
            $table->string('TanggalWaktuKeberangkatan');
            $table->integer('DurasiPenerbangan');
            $table->integer('HargaPerTiket');
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
        Schema::dropIfExists('jadwal_penerbangans');
    }
};
