<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class areas extends Model
{
    use HasFactory;
    protected $fillable = ['name','description','number_jobs','entry_time','exit_time','price'];
}
