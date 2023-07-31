<?php

namespace App\Http\Controllers\API;

use App\Models\Task;
use App\Mail\TaskAssignMail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class TaskController extends Controller
{
  public function store(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'title' => 'required',
      'description' => 'required',
      'deadline' => 'required',
      'status' => 'required',
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

    $task = Task::create($request->all());

    if ($task) {
      $payload = [
        'code'         => 200,
        'user_message' => 'Task created Successfully.',
      ];
      return response()->json($payload, 200);
    } else {
      $payload = [
        'code'         => 500,
        'user_message' => 'Failed',
      ];
      return response()->json($payload, 500);
    }
  }

  public function edit(Request $request, Task $task)
  {
    $validator = Validator::make($request->all(), [
      'title' => 'required',
      'description' => 'required',
      'deadline' => 'required',
      'status' => 'required',
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
    $task = $task->update($request->all());
    if ($task) {
      $payload = [
        'code'         => 200,
        'user_message' => 'Task updated Successfully.',
      ];
      return response()->json($payload, 200);
    } else {
      $payload = [
        'code'         => 500,
        'user_message' => 'Failed',
      ];
      return response()->json($payload, 500);
    }
  }

  public function taskList(Request $request)
  {
    $currentPage = $request->page;
    $perPage = 5;
    $skip = 0;
    if ($currentPage > 1) {
      $skip =  ($perPage * ($currentPage - 1));
    }

    $task = Task::where('deadline', '>=', date('Y-m-d'))->with('user');
    
    if (!empty($request->search)) {
      $task = $task->where('title', 'LIKE', "%{$request->search}%");
    }

    $taskTotal = $task->count();
    $taskResponse = $task->skip($skip)->take($perPage)->get();

    if ($task) {
      $payload = [
        'code'         => 200,
        'user_message' => 'Task list',
        'total' =>  $taskTotal,
        'currentPage' => $currentPage,
        'perPage' => $perPage,
        'data' => $taskResponse
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

  public function assignTask(Request $request, Task $task)
  {
    $task->assigned_user_id = $request->assigned_user_id;
    $task->save();

    if ($task) {
      $details = [
        'title' => 'Task Assigned',
        'body' => 'You have been assigned a task',
      ];
      if (!empty($task->user->email)) {
        Mail::to($task->user->email)->send(new TaskAssignMail($details));
      }

      $payload = [
        'code'         => 200,
        'user_message' => 'Task Assign Successfully & Mail Sent',
        'data' => [],
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
}
