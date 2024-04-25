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
    //delete plant
    public function deletePlant(Request $request, $id = null)
    {
        //delete plant from db
        $plant = Plant::find($id); //given id or search for it in front end?
        

        if (!$plant) { //plant isn't found in our database\
            return response()->json([
                'result' => false,
                'message' => 'error ,plant does not exist',
            ], 400);
        } else {

            if ($plant->delete()) {
                return response()->json([
                    'result' => true,
                    'message' => 'plant is deleted',
                ], 201);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => 'error',
                ], 400);

            }

        }

    }

    //list myplants
    //list plant libraries
    public function viewPlants($user_id =NULL) //function to return the user id (id of logged in user)
    {
        if(user_id!= NULL)
        {
            $plants = MyPlants::get();
        }else{
            //get all plants
            $plants = Plant::get();
        }
        if($plants->save()) {
            return response()->json([
                'result' => true,
                'message' => 'plants displayed',
                'data' => $plant
            ],200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 400);
        }
    }

    //list plant name and return id of selected with id of logged in user
    public function viewPlantNames() //for myplants
    {
    
        $plant = Plant::get();
        $subset = $plant->map(function ($plant) {
            return collect($plant->toArray())
                ->only(['plant_name','plant_id'])
                ->all();
        });
        
        if($plants->save()) {
            return response()->json([
                'result' => true,
                'message' => 'plants displayed',
                'data' => $subset
            ],200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 400);
        }
    }   

    //function to return the user id (id of logged in user) given a plant name



    //reminder per plant


}
