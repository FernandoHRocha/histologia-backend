<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sheet extends Model
{
    use HasFactory;
    
        protected $table = 'sheet';
    
        protected $primaryKey = 'idsheet';

    protected $fillable = [
        'name',
        'description',
        'thumbnail'
    ];

    public static $createRules = [
        'name' => 'string|required|unique:mysql.sheet,name|min:3',
        'description' => 'string|required|min:3',
        'thumbnail' => 'required'
    ];

    public function slide() {
        return $this->hasMany(Slide::class, 'sheet_idsheet');
    }
}
