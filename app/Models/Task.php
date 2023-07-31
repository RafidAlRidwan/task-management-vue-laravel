<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'description',
        'deadline',
        'assigned_user_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'assigned_user_id', 'id');
    }
}
