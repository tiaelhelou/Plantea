<?php

namespace App\Http\Controllers\user;
use Illuminate\Support\Facades\Validator;
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
public function changePassword(Request $request, $id=null)
{
    $validator = Validator::make($request->all(), [
        'new_password' => 'required|string',
        'old_password' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 400); // Change the status code to 400 for validation errors
    }

    $user = User::find($id); // Use find() instead of where()->first()

    if (!$user) {
        return response()->json([
            'result' => false,
            'message' => 'User not found',
        ], 404); // Return 404 if user is not found
    }

    if (Hash::check($request->old_password, $user->user_password)) {
        $user->user_password = Hash::make($request->new_password);

        if ($user->save()) {
            return response()->json([
                'result' => true,
                'message' => 'Success: password is changed.',
            ], 200); // Return 200 for successful operation
        } else {
            return response()->json([
                'result' => false,
                'message' => 'Failed to save the new password.',
            ], 500); // Return 500 for server-side errors
        }
    } else {
        return response()->json([
            'result' => false,
            'message' => 'Incorrect old password',
        ], 401); // Return 400 for incorrect old password
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
                'name' => 'required',
                'email' => 'required',
                'profile' => 'required',
            ]);

            $user = User::where('user_id', $id)->first();

            $user->user_name = $request->name;
            $user->user_email = $request->email;
            $user->user_profile = $request->profile;

            if ($user->save()) {
                return response()->json([
                    'result' => true,
                    'message' => "Information saved",
                ], 201);
            } else {
                return response()->json([
                    'result' => false,
                    'message' => "Information not saved",
                ], 200);
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
    else {
        $user = User::find($id);
        if ($user != null) {
            $checkins = CheckIn::where('user_id', $id)->get();

            // Iterate over each checkin and update the checkin_total
            foreach ($checkins as $checkin) {
                $checkin->checkin_total += 1;
                $checkin->save();
            }

            // Update user points
            $user->user_points += 5;
            $user->save();

            return response()->json(['message' => 'Checkin Successful'], 200);
        }
        else{
            return response()->json(['message' => 'User not found'], 400);
        }
    }
}

}
