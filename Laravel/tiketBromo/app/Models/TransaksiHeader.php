<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiHeader extends Model
{
    protected $fillable = ['AkunID', 'TanggalTransaksi', 'JadwalPenerbanganID', 'JumlahPenumpang', 'TotalHarga', 'KodePromoID', 'MetodePembayaran', 'TerimaPembayaran'];
}
