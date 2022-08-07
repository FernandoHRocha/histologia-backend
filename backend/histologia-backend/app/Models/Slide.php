<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slide extends Model
{
    use HasFactory;

    protected $table = 'slide';

    protected $primaryKey = 'idslide';

    protected $fillable = [
        'sheet_idsheet',
        'level',
        'row',
        'col',
        'content'
    ];

    public static $createRules = [
        'sheet_idsheet' => 'required|digit',
        'level'         => 'required|digit',
        'row'           => 'required|digit',
        'col'           => 'required|digit',
        'content'       => 'required|'
    ];

    public function sheet() {
        return $this->belongsTo(Sheet::class, 'idsheet', 'sheet_idsheet');
    }
}
