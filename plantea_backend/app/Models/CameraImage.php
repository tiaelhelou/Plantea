<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Cameraimage
 * 
 * @property int $camera_image_id
 * @property string|null $camera_image_image
 * @property int $user_id
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Cameraimage extends Model
{
	protected $table = 'cameraimages';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'camera_image_id' => 'int',
		'user_id' => 'int'
	];

	protected $fillable = [
		'camera_image_image'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
