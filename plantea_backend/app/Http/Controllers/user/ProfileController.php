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

    /*
     * Display profile (name , images , profile , points) of User.
     */
    public function viewProfileDetails() // research how to add image to db and get image
    {
        $user = User::get();
        $subset = $user->map(function ($user) {
            return collect($user->toArray())
                ->only(['user_name', 'profile', 'user_points'])
                ->all();
        });

        $user_plants = UserPlant::get(); 

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
    
     /*
     * Change password of User.
     */
    public function changePassword(Request $request)
    {
        $user = User::where('email', $request->email)->first();

        if (!$user) { //Email is not found in our database
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 200);            
        } else {
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
  
     /*
     * Edit User profile.
     */
    public function editProfile(Request $request)
    {
        $request->validate([
            'user_name' => 'required',
            'user_email' => 'required',
            'user_profile' => 'required',
        ]);

        $user = User::all()->firstorFail();

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

    /*
    * Checkin of User.
    */
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
