<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PlantCareController extends Controller
{
    //add plant , list plant ,reminder per plant



    public function addPlant(Request $request)
    {
        // add plant
        $request->validate([
            'user_id' => 'required',
            'plant_id' => 'required',
            'plant_nickname' => 'required',
            'plant_health' => 'required'
           
        ]);
        $plant = new Plant;
        $plant->user_id = $request->user_id;
        $plant->plant_id = $request->plant_id; //taken from a drop down list in app
        $plant->plant_nickname = $request->plant_nickname;
        $plant->plant_health = $request->plant_health;
        //display plant info in this section (like plant library)
        
        
        
        if($plant->save()) {
            return response()->json([
                'result' => true,
                'message' => 'plant added',
                //'data' => $plant
            ],200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 400);
        }
    }


}
