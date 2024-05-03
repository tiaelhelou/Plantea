<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\CheckIn;
use Illuminate\Http\Request;
use App\Models\CameraImage;
use App\Models\User;

use Illuminate\Support\Facades\Hash;

class ProfileController extends Controller
{

    /*
     * Display profile (name , images , profile , points) of User.
     */
    public function viewProfileDetails($id = null)
    {
        if ($id == null) {
            return response()->json([
                'result' => false,
                'message' => 'User not found',
            ], 400);
        } else {
            $user = User::find($id);
            $user_plants = CameraImage::where('user_id', $id)->get();


            if ($user != null && $user_plants) {
                return response()->json([
                    'result' => true,
                    'message' => 'user displayed',
                    'user_data' => $user,
                    'images' => $user_plants
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
     * Change password of User.
     */
    public function changePassword(Request $request)
    {
         $request->validate([
            'email' => 'required|email',
            'new_password' => 'required|string',
            'old_password' => 'required|string',
        ]);

        $user = User::where('email', $request->email)->first();

        if (Hash::check($request->old_password, $user->user_password)) {
            $user->user_password = Hash::make($request->new_password); 

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
  
     /*
     * Edit User profile.
     */
    public function editProfile($id = null, Request $request)
    {
        if ($id == null) {
            return response()->json([
                'result' => false,
                'message' => 'User not found',
            ], 400);
        } else {
            $request->validate([
                'user_name' => 'required',
                'user_email' => 'required',
                'user_profile' => 'required',
            ]);

            $user = User::where('user_id', $id)->first();

            $user->user_name = $request->user_name;
            $user->user_email = $request->user_email;
            $user->user_profile = $request->user_profile;

            if ($user->save()) {
                return response()->json([
                    'result' => true,
                    'message' => "Information saved",
                ], 201);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => "Information not saved",

                ], 201);
            }
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
            if ($user != null) {
                $checkins = CheckIn::where('user_id', $id)->get();
                $checkins->checkin_total = $checkins->checkin_total + 1;

                $user->user_points = $user->user_points + 5;

                if($checkins->save() && $user->save()) {
                    return response()->json(['message' => 'Checkin Successful'], 200);
                }
                else{
                    return response()->json(['message' => 'Checkin Failed'], 400);
                }
            }
            else{
                return response()->json(['message' => 'User not found'], 400);
            }
        }
    }
}
