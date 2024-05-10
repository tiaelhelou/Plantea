<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\UserHasPlant;
use App\Models\Plant;

use Illuminate\Http\Request;

class PlantInformationController extends Controller
{
    /*
    * Display plant informaion for User.
    */
    public function displayInformation($id_plant = null, $id = null)
    {
        if ($id_plant == null) {
            return response()->json(['message' => 'Display Information Failed'], 400);
        }

        $plant_info = Plant::where('plant_id', $id_plant)->get();

        if ($plant_info == null) {
            return response()->json(['message' => 'Display Information Failed'], 400);
        }
        
        if ($id != null) {

            $plant_add_info = UserHasplant::where("plant_id", $id_plant)
                              ->where("user_id", $id)
                              ->first();

            if($plant_add_info != null) {
                return response()->json([
                    'message' => 'Plant Information retrieved successfully',
                    'data' => $plant_info,
                    'aditional_info' => $plant_add_info
                ], 200);
            }
            return response()->json(['message' => 'Display Information Failed'], 400);
        }
        return response()->json([
            'message' => 'Plant Information retrieved successfully',
            'data' => $plant_info,
        ], 200);    
    }
}
