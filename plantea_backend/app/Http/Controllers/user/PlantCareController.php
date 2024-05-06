<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Cameraimage;
use Illuminate\Http\Request;
use App\Models\Plant;
use App\Models\Reminder;
use App\Models\UserHasPlant;
class PlantCareController extends Controller
{
    /*
     * User Add plant.
     */
    public function addPlant($id = null, Request $request)
    {
        $request->validate([
            'nickname' => 'required',
            'name' => 'required',
            'image' => 'required'
        ]);

        $plantid = Plant::where('plant_name', $request->name)->first()->plant_id;
        $plant = new UserHasPlant;

        $plant->user_id = $id;
        $plant->plant_id = $plantid;
        $plant->plant_nickname = $request->nickname;


        $image = new CameraImage;

        $image->camera_image_image = $request->image;
        $image->user_id = $id;

        if ($plant->save() && $image->save()) {
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
            $user_plants = UserHasPlant::where('user_id', $id)->get();
            $plants_details = [];
            foreach ($user_plants as $user_plant) {
                $plant_id = $user_plant->plant_id;
                $plant_details = Plant::where('plant_id', $plant_id)->first();
                if ($plant_details) {
                $plants_details[] = $plant_details; // Store details in the array
            }
            }

            return response()->json([
                'message' => 'Plants retrieved successfully',
                'data1' => $user_plants,
                'data2' => $plants_details
            ], 200);
        }
    }

    /*
     * Add reminder for User plant.
     */
    public function addReminder($id = null, Request $request)
    {
        if ($id == null) {
            return response()->json([
                'result' => false,
                'message' => 'User not found',
            ], 400);
        } else {
            $request->validate([
                'plant_id' => 'required',
                'reminder_type' => 'required',
                'reminder_time' => 'required'
            ]);

            $reminder = new Reminder;
            $reminder->user_has_plants_user_id = $id;
            $reminder->reminder_type = $request->reminder_type;
            $reminder->reminder_time = $request->reminder_time;
            $reminder->user_has_plants_plant_id = $request->plant_id;

            if ($reminder->save()) {
                return response()->json([
                    'result' => true,
                    'message' => 'reminder added',
                ], 200);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => 'error',
                ], 400);
            }
        }
    }

    /*
     * Delete reminder for User plant.
     */
    public function deleteReminder($id = null, Request $request)
    {
        if ($id == null) {
            return response()->json([
                'result' => false,
                'message' => 'User not found',
            ], 400);
        } else {
            $reminder = Reminder::find($id);

            if ($reminder == null) {
                return response()->json([
                    'result' => false,
                    'message' => 'reminder does not exist',
                ], 400);
            } 
            else {
                if ($reminder->delete()) {
                    return response()->json([
                        'result' => true,
                        'message' => 'reminder is deleted',
                    ], 201);
                } else {
                    return response()->json([
                        'result' => false,
                        'message' => 'reminder not deleted',
                    ], 400);
                }
            }
        }
    }
}
