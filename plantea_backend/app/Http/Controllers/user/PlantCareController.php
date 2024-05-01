<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Plant;
use App\Models\Reminder;
use App\Models\UserPlant;
class PlantCareController extends Controller
{
    //add plant , list plant ,reminder per plant

    public function addPlant(Request $request)
    {
        // add plant

        //add plant
        $request->validate([
            'plant_nickname' => 'required',
            'plant_name' => 'required'
        ]);

        $plantid = Plant::where('plant_name', $request->plant_name)->first()->plant_id;
        $plant = new UserPlant;

        $plant->user_id = $id;
        $plant->plant_id = $plantid;
        $plant->plant_nickname = $request->plant_nickname;

        if ($plant->save()) {
            return response()->json([
                'result' => true,
                'message' => 'Plant added',
            ], 200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'Plant not added',
            ], 400);
        }

    }

    /*
     * Display User plant.
     */
    public function viewPlants($id = null)
    {
        if ($id == null) {
            return response()->json([
                'result' => false,
                'message' => 'User not found',
            ], 400);
        } else {
            $user_plants = UserPlant::where('user_id', $id)->get();

            foreach ($user_plants->plant_id as $plant_id) {
                $plants_details = Plant::where('plant_id', $plant_id)->get();
            }

            return response()->json([
                'message' => 'Image retrieved successfully',
                'data1' => $user_plants,
                'data2' => $plants_details
            ], 200);
        }
    }

    

    //list plant name and return id of selected with id of logged in user
    public function viewPlantNames() //for myplants
    {
    
        $plants = Plant::get();
        $subset = $plants->map(function ($plants) {
            return collect($plants->toArray())
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


    //takes oplantname return plantid


    //reminder per plant
    //add reminder
    public function addReminder(Request $request)
    {
        // add reminder
        $request->validate([
            'user_id' => 'required',
            'plant_id'=>'required',
            'reminder_id' => 'required',
            'reminder_type' => 'required', //given from hardcoded dropdown list  in front end(sql injections)
            'reminder_time' => 'required'
           
        ]);
        $reminder = new Reminder;
        $reminder->user_id = $request->user_id;
        $reminder->reminder_id = $request->reminder_id; //taken from id of logged in user
        $reminder->reminder_type = $request->reminder_type;
        $reminder->reminder_time = $request->reminder_time; //save as time in db How?  
        
        if($reminder->save()) {
            return response()->json([
                'result' => true,
                'message' => 'reminder added',
                //'data' => $reminder
            ],200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 400);
        }
    }

    //delete reminder
    public function deleteReminder(Request $request, $id = null)
    {
        //delete reminder from db
        $reminder = Reminder::find($id); //given id or search for it in front end?


        if (!$reminder) { //reminder isn't found in our database\
            return response()->json([
                'result' => false,
                'message' => 'error ,reminder does not exist',
            ], 400);
        } else {

            if ($reminder->delete()) {
                return response()->json([
                    'result' => true,
                    'message' => 'reminder is deleted',
                ], 201);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => 'error',
                ], 400);

            }

        }

    }

}
