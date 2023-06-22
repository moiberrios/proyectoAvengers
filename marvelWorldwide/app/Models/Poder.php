<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Poder extends Model
{
    use HasFactory;
    protected $table='poder';

    protected $primaryKey="poderID";

    public $timestamps=false;

    protected $fillable =[
        'poderNombre',
        'poderDescripcion'
    ];
    protected $guarded = [
    ];
}

