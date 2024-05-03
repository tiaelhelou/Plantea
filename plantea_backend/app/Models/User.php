<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $user_id
 * @property string|null $user_name
 * @property string|null $user_email
 * @property string|null $user_password
 * @property string|null $user_profile
 * @property int|null $user_points
 * 
 * @property Collection|Cameraimage[] $cameraimages
 * @property Collection|Checkin[] $checkins
 * @property Collection|Donate[] $donates
 * @property Collection|Plant[] $plants
 * @property Collection|Gift[] $gifts
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';
	protected $primaryKey = 'user_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'user_id' => 'int',
		'user_points' => 'int'
	];

	protected $hidden = [
		'user_password'
	];

	protected $fillable = [
		'user_name',
		'user_email',
		'user_password',
		'user_profile',
		'user_points'
	];

	public function cameraimages()
	{
		return $this->hasMany(Cameraimage::class);
	}

	public function checkins()
	{
		return $this->hasMany(Checkin::class);
	}

	public function donates()
	{
		return $this->hasMany(Donate::class);
	}

	public function plants()
	{
		return $this->belongsToMany(Plant::class, 'user_has_plants')
					->withPivot('plant_nickname', 'plant_health');
	}

	public function gifts()
	{
		return $this->belongsToMany(Gift::class, 'user_redeems_gifts');
	}
}
