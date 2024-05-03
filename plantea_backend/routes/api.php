<?php

use App\Http\Controllers\user\CameraController;
use App\Http\Controllers\user\DonateController;
use App\Http\Controllers\user\PlantCareController;
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
    Route::group(['middleware' => 'auth:api'], function () {

        /* Authorization Routes */
        Route::group(['prefix' => 'authorization'], function () {
            Route::group(['prefix' => 'user'], function () {
                Route::post('/fetch_image', [CameraController::class, 'fetch_image']);
                Route::get('/insert_image/{id?}', [CameraController::class, 'insert_image']);

                Route::get('/donate/{id?}', [DonateController::class, 'donate']);

                Route::get('/addPlant/{id?}', [PlantCareController::class, 'addPlant']);
                Route::post('/viewPlants', [PlantCareController::class, 'viewPlants']);
                Route::get('/addReminder/{id?}', [PlantCareController::class, 'addReminder']);
                Route::get('/deleteReminder/{id?}', [PlantCareController::class, 'deleteReminder']);
               
            });

            Route::group(['prefix' => 'admin'], function () {
                // api for admin functions
            });
        });

    });
    
});












    