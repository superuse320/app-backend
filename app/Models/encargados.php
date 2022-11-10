<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class encargados extends Model
{
    use HasFactory;
    protected $fillable = ['name','email','phone'];
    
}
