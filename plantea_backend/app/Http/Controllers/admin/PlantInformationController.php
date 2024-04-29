<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\UserPlant;
use App\Models\Plant;

use Illuminate\Http\Request;

class PlantInformationController extends Controller
{
    /*
    * Display plant informaion for User.
    */
    public function displayInformation($id = null, $name = null)
    {
        if ($name == null) {
            return response()->json(['message' => 'Display Information Failed'], 400);
        }

        $plant_info = Plant::where('name', $name)->get();

        if ($plant_info == null) {
            return response()->json(['message' => 'Display Information Failed'], 400);
        }
        
        if ($id != null) {

            $plant_add_info = Userplant::where("plant_id", $plant_info->plant_id)->get();

            if($id == $plant_add_info->user_id) {
                return response()->json([
                    'message' => 'Plant Information retrieved successfully',
                    'data' => $plant_info,
                    'aditional_info' => $plant_add_info
                ], 200);
            }
            return response()->json(['message' => 'Display Information Failed'], 400);
        }
        return response()->json(['message' => 'Display Information Failed'], 400);     
    }
}
