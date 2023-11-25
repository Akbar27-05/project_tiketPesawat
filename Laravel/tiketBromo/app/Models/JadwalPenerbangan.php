<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JadwalPenerbangan extends Model
{
    protected $fillable = ['KodePenerbangan', 'BandaraKeberangkatanID', 'BandaraTujuanID', 'MaskapaiID', 'TanggalWaktuKeberangkatan', 'DurasiPenerbangan', 'HargaPerTiket'];
}
