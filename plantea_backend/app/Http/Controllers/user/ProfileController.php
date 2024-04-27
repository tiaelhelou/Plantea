<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\CheckIn;
use Illuminate\Http\Request;
use App\Models\UserPlant;
use App\Models\User;

use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{
    //change pass , edit profile , display profile

    //display profile (name , images , profile , points)

    public function viewProfileDetails() // research how to add image to db and get image
    {

        $user = User::get();
        $subset = $user->map(function ($user) {
            return collect($user->toArray())
                ->only(['user_name', 'profile', 'user_points'])
                ->all();
        });

        $user_plants = UserPlant::get(); // create it's own function

        if ($user->save() && $user_plants) {
            return response()->json([
                'result' => true,
                'message' => 'user displayed',
                'user_data' => $subset,
                'plant_list' => $user_plants
            ], 200);
        } else {
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 400);
        }
    }
    //change pass , should be in auth

    public function changePassword(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) { //Email isn't found in our database\
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 200);
        } else {
            /**
             * req new password
             * update db
             * verification email
             */

            //check if old pass word is valid
            $request->validate([
                'new_password' => 'required|string',
                'old_password' => 'required|string',
            ]);

            $new_password = $request->input('new_password'); //take input
            if (Hash::check($request->old_password, $user->user_password)) {


                $user->user_password = Hash::make($new_password);  //replace old with new
                if ($user->save()) {
                    return response()->json([
                        'result' => true,
                        'message' => 'Success: password is changed.',
                    ], 201);
                } else {
                    return response()->json([
                        'result' => false,
                        'message' => "Fail :incorrect old pass",

                    ], 201);
                }

            }
        }

    }
    //edit profile

    public function editProfile(Request $request)
    {
        //edit name email photo
        $request->validate([
            'user_name' => 'required',
            'user_email' => 'required',
            'user_profile' => 'required',


        ]);

        $user = User::all()->firstorFail();
        //test to make sure it is taking input once
        $new_username = $request->input('user_name'); //take input
        $new_email = $request->input('user_email');
        $new_profile_information = $request->input('user_profille');
        $user->user_name = $new_username;
        $user->user_email = $new_email;
        $user->user_profile = $new_profile_information;



        if ($user->save()) {

            return response()->json([
                'result' => true,
                'message' => 'general information has been edited',
            ], 201);
        } else {

            return response()->json([
                'result' => false,
                'message' => "error",

            ], 201);
        }
    }

    public function checkIn($id = null){

        if ($id == null ) {
            return response()->json(['message' => 'Checkin Failed'], 400);
        }
        else{
            $user = User::find($id);
            if ($user == null) {
                $checkins = CheckIn::where('user_id', $id)->get();
                $checkins->checkin_total = $checkins->checkin_total + 1;

                if($checkins->save()){
                    return response()->json(['message' => 'Checkin Successful'], 200);
                }
                else{
                    return response()->json(['message' => 'Checkin Failed'], 400);
                }
            }
        }
    }
}
