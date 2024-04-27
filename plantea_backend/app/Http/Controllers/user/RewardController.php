<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Gift;
use Illuminate\Http\Request;

class RewardController extends Controller
{
    public function displayRewards(){
        $rewards = Gift::has('gift_count', '>=', 1)->get();

        if($rewards == null ) {
            return response()->json(['message' => 'Checkin Failed'], 400);
        }
        return response()->json([
            'message' => 'Gifts retrieved successfully',
            'data' => $rewards
        ], 200);
    }
}
