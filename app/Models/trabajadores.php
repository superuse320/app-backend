<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class trabajadores extends Model
{
    use HasFactory;
    protected $fillable = ['name_last_name','email','phone','address','student_card'];
}
