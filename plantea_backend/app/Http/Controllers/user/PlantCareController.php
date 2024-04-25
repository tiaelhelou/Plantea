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
        if($user_id!= NULL)
        {
            $plants = UserPlant::get();
        }else{
            //get all plants
            $plants = Plant::get();
        }
        if($plants->save()) {
            return response()->json([
                'result' => true,
                'message' => 'plants displayed',
                'data' => $plants
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
    
        $plants = Plant::get();
        $subset = $plants->map(function ($plant) {
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
