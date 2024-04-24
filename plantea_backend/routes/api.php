<?php

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

        Route::post('/login', [AuthenticationController::class, 'register']);

    });

    /* Middleware for authentication */
    Route::group(['middleware' => 'auth:api'], function () {

        /* Authorization Routes */
        Route::group(['prefix' => 'authorization'], function () {
            Route::group(['prefix' => 'user'], function () {
                //api for user function
            });

            Route::group(['prefix' => 'admin'], function () {
                // api for admin functions
            });
        });

    });
    
});












    