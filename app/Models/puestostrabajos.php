<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class puestostrabajos extends Model
{
    use HasFactory;
    protected $fillable = ['workplace','description','trabajo_id'];
}
