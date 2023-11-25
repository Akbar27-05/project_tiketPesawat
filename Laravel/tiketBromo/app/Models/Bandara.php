<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bandara extends Model
{
    protected $fillable = ['Nama', 'KodeIATA', 'Kota', 'NegaraID', 'JumlahTerminal', 'Alamat'];
}
