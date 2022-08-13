<?php

namespace App\Http\Controllers;

use App\Models\Sheet;
use Illuminate\Http\Request;

class SheetController extends Controller
{
    public function __construct() {
    }

    public function get(int $idsheet) {
        $response = Sheet::select(['name', 'description'])
            ->where('idsheet', $idsheet)
            ->first();
        return (json_encode($response));
    }

    public function countSlide(int $idsheet) {
        $sheet = Sheet::where('idsheet', $idsheet)->first();
        $response = count($sheet->slide);
        return (json_encode([ 'slides' => $response]));
    }

    public function store(Request $request) {
        try{
            $sheet = $this->validate($request, Sheet::$createRules);
            $sheet = Sheet::insertGetId($sheet);
            return response(json_encode(['idsheet', $sheet]), 201);
        } catch(\Exception $e) {
            $name = $request->get('name', '');
            if(!$name) {
                throw $e;
            }
            $sheet = Sheet::select('idsheet')->firstWhere('name', $name);
            return response(json_encode(['idsheet', $sheet->idsheet]), 200);
        }
    }
}
