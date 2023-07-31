<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\TaskController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1', 'as' => 'api.', 'namespace' => 'Api'], function () {
    Route::post('registration', [AuthController::class, 'registration']);
    Route::post('login', [AuthController::class, 'login']);


    Route::group(['middleware' => 'auth:sanctum'], function () {
        Route::get('task/list', [TaskController::class, 'taskList']);
        Route::post('task/store', [TaskController::class, 'store']);
        Route::post('task/store/{task}', [TaskController::class, 'edit']);
        Route::post('task/assign/{task}', [TaskController::class, 'assignTask']);
        Route::get('get/users', [AuthController::class, 'users']);
        Route::post('logout', [AuthController::class, 'logout']);
    });
});
