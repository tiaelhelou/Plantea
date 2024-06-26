<?php

use App\Http\Controllers\admin\PlantInformationController;
use App\Http\Controllers\admin\PlantLibraryController;
use App\Http\Controllers\user\CameraController;
use App\Http\Controllers\user\DonateController;
use App\Http\Controllers\user\PlantCareController;
use App\Http\Controllers\user\ProfileController;
use App\Http\Controllers\user\RewardController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Path Of The Controllers
|--------------------------------------------------------------------------
*/

use App\Http\Controllers\authentication\AuthenticationController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

/* v1 Routes */
Route::group(['prefix' => 'v1'], function () {

    /* Authentication Routes */
    Route::group(['prefix' => 'authentication'], function () {

        Route::post('/register', [AuthenticationController::class, 'register']);
        Route::post('/login', [AuthenticationController::class, 'login']);
        Route::post('/logout', [AuthenticationController::class, 'logout']);
        Route::post('/resetPassword', [AuthenticationController::class,'resetPassword']);
        
    });

    /* Middleware for authentication */
    // Route::group(['middleware' => 'auth:api'], function () {

        /* Authorization Routes */
        Route::group(['prefix' => 'authorization'], function () {
            Route::group(['prefix' => 'user'], function () {

                Route::get('/fetch_image/{id?}', [CameraController::class, 'fetch_image']);
                Route::post('/insert_image/{id?}', [CameraController::class, 'insert_image']);

                Route::post('/donate/{id?}', [DonateController::class, 'donate']);

                Route::post('/addPlant/{id?}', [PlantCareController::class, 'addPlant']);
                Route::get('/viewPlants/{id?}', [PlantCareController::class, 'viewPlants']);
                Route::post('/addReminder/{id?}', [PlantCareController::class, 'addReminder']);
                Route::get('/deleteReminder/{id?}', [PlantCareController::class, 'deleteReminder']);

                Route::get('/viewProfileDetails/{id?}', [ProfileController::class, 'viewProfileDetails']);
                Route::post('/changePassword/{id?}', [ProfileController::class, 'changePassword']);
                Route::post('/editProfile/{id?}', [ProfileController::class, 'editProfile']);
                Route::post('/checkIn/{id?}', [ProfileController::class, 'checkIn']);

                Route::post('/redeemReward/{id?}/{name?}', [RewardController::class, 'redeemReward']);
                Route::get('/displayRewards', [RewardController::class, 'displayRewards']);
               
            });

            Route::group(['prefix' => 'admin'], function () {
                
                Route::get('/displayInformation/{id_plant?}/{id?}', [PlantInformationController::class, 'displayInformation']);
                Route::get('/displayPlants', [PlantLibraryController::class, 'displayPlants']);

            });
        });

    // });
    
});












    