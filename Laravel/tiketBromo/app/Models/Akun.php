<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Akun extends Model
{
    
    protected $fillable = ['Username', 'Password', 'Nama', 'TanggalLahir', 'NomorTelepon', 'MerupakanAdmin'];
}
