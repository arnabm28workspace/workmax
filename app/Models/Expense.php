<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    //
    protected $table = 'expense';
    protected $primaryKey = 'id';
    protected $fillable = ['name'];
}