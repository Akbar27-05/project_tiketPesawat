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
        Schema::create('transaksi_headers', function (Blueprint $table) {
            $table->id();
            $table->integer('AkunID');
            $table->date('TanggalTransaksi');
            $table->integer('JadwalPenerbanganID');
            $table->integer('JumlahPenumpang');
            $table->float('TotalHarga');
            $table->integer('KodePromoID');
            $table->string('MetodePembayaran');
            $table->integer('TerimaPembayaran');
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
        Schema::dropIfExists('transaksi_headers');
    }
};
