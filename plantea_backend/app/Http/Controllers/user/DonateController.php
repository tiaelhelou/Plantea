<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Donate;

use Illuminate\Http\Request;

use Validator;

class DonateController extends Controller
{
    /*
    * User Donate.
    */
    public function donate($id = null, Request $request)
    {

        if ($id == null) {
            return response()->json(['message' => 'donation Failed'], 400);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'phone' => 'required|int',
            'credit_num' => 'required|int',
            'expire' => 'required|date',
            'ccv' => 'required|int',
            'amount' => 'required|int',
            'currency' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 202);
        }

        $user = User::find($id);
        if ($user != null) {

            $donation = new Donate;

            $donation->user_id = $id;
            $donation->donate_name = $request->name;
            $donation->donate_phone = $request->phone;
            $donation->donate_total = $request->amount;
            $donation->donate_creditnumber = $request->credit_num;
            $donation->donate_expire = $request->expire;
            $donation->donate_ccv = $request->ccv;
            $donation->donate_currency = $request->currency;

            $user->user_points = $user->user_points + $request->amount/2;

            if($donation->save() && $user->save()) {
                return response()->json(['message' => 'Checkin Successful'], 200);
            }
            else{
                return response()->json(['message' => 'Checkin Failed'], 400);
            }
        } 
        else {
            return response()->json(['message' => 'User not found'], 400);
        }

    }
}
