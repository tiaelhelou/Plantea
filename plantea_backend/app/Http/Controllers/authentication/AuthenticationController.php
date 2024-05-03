<?php

namespace App\Http\Controllers\authentication;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

use Validator;
use Auth;

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

    /*
     * Login the User. Get a JWT via given credentials.
     */
    public function login(Request $request) {

        $validator = Validator::make($request->all(), [
            'user_email' => 'required|email',
            'user_password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 202);
        }
        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 200);
        }
        return $this->respondWithToken($token);
    }

     /*
     * Reset password of User.
     */
    public function resetPassword(Request $request) {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'new_password' => 'required|string',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 202);
        }

        $user = User::where('user_email', $request->email)->first();
    
        if (!$user) { //Email isn't found in our database
            return response()->json([
                'result' => false,
                'message' => 'error',
            ], 200);
        } else {
            if ($user->user_password != $request->new_password) { // old = new password
                $user->user_password = bcrypt($request->new_password); // get new password

                if($user->save()){ // save new password
                    return response()->json([
                        'success' => true,
                        'message' => 'Password changed successfully',
                        'data' => $user
                    ], 201);
                }else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Password could not be changed',
                    ], 200);
                }
            }
            else {
                return response()->json([
                    'success' => false,
                    'message' => 'New password cannot be the old password',
                ], 200);
            }
        }

    }

    /*
     * Logout the User.
     */
    public function logout() {
        Auth::guard('api')->logout();
    
        return response()->json([
            'status' => 'success',
            'message' => 'logout'
        ], 200);
    }    

    /*
     * Get the token array structure.
     */
    protected function respondWithToken($token) {
        return response()->json([
            'access_token' => $token,
            'user' => Auth::user(),
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60
        ]);
    }
}
