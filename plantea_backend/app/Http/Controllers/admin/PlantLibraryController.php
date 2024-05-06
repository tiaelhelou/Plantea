<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Plant;

use Illuminate\Http\Request;

class PlantLibraryController extends Controller
{
     /*
     * Display all for User.
     */
    public function displayPlants()
    {
        $plants = Plant::orderByDesc("plant_category")->get();

        if ($plants != null) {
            return response()->json([
                'message' => 'Image retrieved successfully',
                'data' => $plants
            ], 200);
        } else {
            return response()->json(['message' => 'Image retrieving Failed'], 400);
        }
    }

}
