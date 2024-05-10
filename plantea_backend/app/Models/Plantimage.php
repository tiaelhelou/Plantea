<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Plantimage
 * 
 * @property int $plant_image_id
 * @property string|null $plant_image
 * @property int $plants_plant_id
 * 
 * @property Plant $plant
 *
 * @package App\Models
 */
class Plantimage extends Model
{
	protected $table = 'plantimages';
	public $timestamps = false;

	protected $casts = [
		'plants_plant_id' => 'int'
	];

	protected $fillable = [
		'plant_image'
	];

	public function plant()
	{
		return $this->belongsTo(Plant::class, 'plants_plant_id');
	}
}
