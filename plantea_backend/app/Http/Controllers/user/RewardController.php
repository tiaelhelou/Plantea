<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Gift;
use App\Models\UserRedeemsGift;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Http\Response;

class RewardController extends Controller
{
    /*
    * Display rewards for User.
    */
   public function displayRewards()
{
    $rewards = Gift::where('gift_count', '>=', 1)->get();

    if ($rewards->isEmpty()) {
        return response()->json(['message' => 'No gifts available'], Response::HTTP_NOT_FOUND);
    }

    return response()->json([
        'message' => 'Gifts retrieved successfully',
        'data' => $rewards
    ], 200);
}
    /*
    * User redeem a Reward.
    */
    public function redeemReward($id = null, $name = null)
    {

        if ($id == null || $name == null) {
            return response()->json(['message' => 'Redeemed Failed'], 400);
        }

        $reward = Gift::where('gift_name', $name)->first();

        if ($reward == null) {
            return response()->json(['message' => 'Redeemed Failed'], 400);
        }

        $user = User::find($id);
        if ($user != null) {
            if ($user->user_points > $reward->gift_points) {
                $redeemed = new UserRedeemsGift;
                $redeemed->user_id = $user->user_id;
                $redeemed->gift_id = $reward->gift_id;

                $reward->gift_count = $reward->gift_count - 1;

                if ($redeemed->save() && $reward->save()) {
                    return response()->json(['message' => 'Redeemed Successful'], 200);
                } else {
                    return response()->json(['message' => 'Redeemed Failed'], 400);
                }
            }
            else{
                return response()->json(['message' => 'Not enough points'], 400);
            }
        }
        else{
            return response()->json(['message' => 'User not found'], 400);
        }
    }
}
