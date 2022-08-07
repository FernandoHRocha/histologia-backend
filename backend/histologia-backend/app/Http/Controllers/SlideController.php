<?php

namespace App\Http\Controllers;

use App\Models\Slide;

class SlideController extends Controller
{
    public function __construct() {
    }

    public function get(int $idslide) {
        $response = Slide::select(['name', 'description'])
            ->where('idsheet', $idslide)
            ->first();
        return (json_encode($response));
    }
}
