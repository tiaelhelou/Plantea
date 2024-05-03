<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Reminder
 * 
 * @property int $reminder_id
 * @property string|null $reminder_type
 * @property Carbon|null $reminder_time
 * @property int $user_has_plants_user_id
 * @property int $user_has_plants_plant_id
 * 
 * @property UserHasPlant $user_has_plant
 *
 * @package App\Models
 */
class Reminder extends Model
{
	protected $table = 'reminders';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'reminder_id' => 'int',
		'reminder_time' => 'datetime',
		'user_has_plants_user_id' => 'int',
		'user_has_plants_plant_id' => 'int'
	];

	protected $fillable = [
		'reminder_type',
		'reminder_time'
	];

	public function user_has_plant()
	{
		return $this->belongsTo(UserHasPlant::class, 'user_has_plants_user_id')
					->where('user_has_plants.user_id', '=', 'reminders.user_has_plants_user_id')
					->where('user_has_plants.plant_id', '=', 'reminders.user_has_plants_plant_id');
	}
}
