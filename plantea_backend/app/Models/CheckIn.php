<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Checkin
 * 
 * @property int $checkin_id
 * @property int|null $checkin_total
 * @property int|null $checkin_streak
 * @property int $user_id
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Checkin extends Model
{
	protected $table = 'checkins';
	public $timestamps = false;

	protected $casts = [
		'checkin_total' => 'int',
		'checkin_streak' => 'int',
		'user_id' => 'int'
	];

	protected $fillable = [
		'checkin_total',
		'checkin_streak'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
