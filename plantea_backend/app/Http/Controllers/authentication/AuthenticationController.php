<?php

namespace App\Http\Controllers\authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

use Validator;

class AuthenticationController extends Controller
{
    /*
     * Register a User.
     */
    public function register(Request $request){

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 202);
        }

        $user = new User;

        $user->user_name = $request->name;
        $user->user_email = $request->email;
        $user->user_password = bcrypt($request->password);
    
        if($user->save()){
            return response()->json([
                'success' => true,
                'message' => 'User created successfully',
                'data' => $user
            ], 201);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'User could not be created',
            ], 200);
        }

    }
}
