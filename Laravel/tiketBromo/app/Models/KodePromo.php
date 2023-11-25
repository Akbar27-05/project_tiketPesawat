<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KodePromo extends Model
{
    protected $fillable = ['Kode', 'PresentaseDiskon', 'MaksimumDiskon', 'BerlakuSampai', 'Deskripsi'];
}
