<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\CameraImage;

use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;

use Validator;

class CameraController extends Controller
{

  /*
  * User take picture from Camera (save image).
  */
  public function insert_image($id = null, Request $request)
  {

    $validator = Validator::make($request->all(), [
      'image_name' => 'required|string',
    ]);

    if ($validator->fails()) {
      return response()->json($validator->errors(), 202);
    }

    if ($id != null) {

      $image = new CameraImage;
      $image->camera_image_image = $request->image_name;
      $image->user_id = $id;

      if ($image->save()) {
        return response()->json(['message' => 'Image saved Successful'], 200);
      } 
      else {
        return response()->json(['message' => 'Image saving Failed'], 400);
      }
    } 
    else {
      return response()->json(['message' => 'User not found'], 400);
    }
  }
   /*
  * Fetch image for User.
  */
  public function fetch_image($id = null){

    if ($id != null) {

      $images = CameraImage::where('user_id', $id)->get();

      if ($images != null) {
        return response()->json([
          'message' => 'Image retrieved successfully',
          'data' => $images
      ], 200);
      } 
      else {
        return response()->json(['message' => 'Image retrieving Failed'], 400);
      }
    } 
    else {
      return response()->json(['message' => 'User not found'], 400);
    }
  }

}
