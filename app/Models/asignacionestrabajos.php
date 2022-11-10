<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class asignacionestrabajos extends Model
{
    use HasFactory;
    protected $fillable = ['trabajador_id','puestostrabajo_id'];
}
