<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UserHasPlant
 * 
 * @property int $user_id
 * @property int $plant_id
 * @property string|null $plant_nickname
 * @property string|null $plant_health
 * 
 * @property Plant $plant
 * @property User $user
 * @property Collection|Reminder[] $reminders
 *
 * @package App\Models
 */
class UserHasPlant extends Model
{
	protected $table = 'user_has_plants';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'user_id' => 'int',
		'plant_id' => 'int'
	];

	protected $fillable = [
		'plant_nickname',
		'plant_health'
	];

	public function plant()
	{
		return $this->belongsTo(Plant::class);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function reminders()
	{
		return $this->hasMany(Reminder::class, 'user_has_plants_user_id');
	}
}
