<?php

namespace App\Http\Controllers;

use App\Models\Slide;
use Illuminate\Http\Request;

class SlideController extends Controller
{
    public function __construct() {
    }

    public function get(int $idslide) {
        $response = Slide::select(['sheet_idsheet', 'level'])
            ->where('sheet_idsheet', $idslide)
            ->first();
        return (json_encode($response));
    }

    public function store(Request $request) {
        $slide = $this->validate($request, Slide::$createRules);
        $slide = Slide::insertGetId($slide);
        return response(json_encode(['idslide', $slide]), 201);
    }
}
