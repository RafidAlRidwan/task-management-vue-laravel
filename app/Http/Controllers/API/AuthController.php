<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\UserCollection;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
  public function registration(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'name' => 'required',
      'email' => 'required|email',
      'password' => 'required',
    ]);
    if ($validator->fails()) {
      return response(
        [
          'message' => 'Validation errors',
          'errors' =>  $validator->errors(),
          'status' => false
        ],
        422
      );
    }

    $input['password'] = Hash::make($request->password);

    $user = User::create($request->all());

    if ($user) {
      $payload = [
        'code'         => 200,
        'user_message' => 'Registration Successful.',
      ];
      return response()->json($payload, 200);
    } else {
      $payload = [
        'code'         => 500,
        'user_message' => 'Registration unsuccessful.',
      ];
      return response()->json($payload, 500);
    }
  }
  public function login(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'password' => 'required',
      "email" => "required"
    ]);
    if ($validator->fails()) {
      return response(
        [
          'message' => 'Validation errors',
          'errors' =>  $validator->errors(),
          'status' => false
        ],
        422
      );
    }
    if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
      $user = Auth::user();

      $token =  $user->createToken('tms')->plainTextToken;
      $user['access_token'] = $token;

      $payload = [
        'code'         => 200,
        'user_message' => 'login Successful.',
        'access_token' => $token,
        'data'         => $user
      ];
      return response()->json($payload, 200);
    } else {
      $payload = [
        'code'         => 200,
        'user_message' => 'Credentials Mismatch',
      ];
      return response()->json($payload, 200);
    }
  }

  public function users()
  {
    $user  = User::all();
    if ($user) {
      $payload = [
        'code'         => 200,
        'user_message' => 'successfully',
        'data' => $user,
      ];
      return response()->json($payload, 200);
    } else {
      $payload = [
        'code'         => 500,
        'user_message' => 'unsuccessfully',
        'data' => [],
      ];
      return response()->json($payload, 500);
    }
  }

  public function logout(Request $request)
  {
    $request->user()->currentAccessToken()->delete();
    $payload = [
      'code'         => 200,
      'user_message' => 'You have been successfully logged out!'
    ];
    return response()->json($payload, 200);
  }
}
