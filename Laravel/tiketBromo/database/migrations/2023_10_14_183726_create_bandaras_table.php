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
        Schema::create('bandaras', function (Blueprint $table) {
            $table->id();
            $table->string('Nama');
            $table->string('KodeIATA');
            $table->string('Kota');
            $table->integer('NegaraID');
            $table->integer('JumlahTerminal');
            $table->string('Alamat');
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
        Schema::dropIfExists('bandaras');
    }
};
