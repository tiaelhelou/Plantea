<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Plant
 * 
 * @property int $plant_id
 * @property string|null $plant_images
 * @property string|null $plant_description
 * @property string|null $plant_details
 * @property string|null $plant_characteristics
 * @property string|null $plant_category
 * 
 * @property Collection|Plantimage[] $plantimages
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Plant extends Model
{
	protected $table = 'plants';
	protected $primaryKey = 'plant_id';
	public $timestamps = false;

	protected $fillable = [
		'plant_images',
		'plant_description',
		'plant_details',
		'plant_characteristics',
		'plant_category'
	];

	public function plantimages()
	{
		return $this->hasMany(Plantimage::class, 'plants_plant_id');
	}

	public function users()
	{
		return $this->belongsToMany(User::class, 'user_has_plants')
					->withPivot('plant_nickname', 'plant_health');
	}
}
