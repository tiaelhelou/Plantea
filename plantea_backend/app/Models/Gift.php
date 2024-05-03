<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Gift
 * 
 * @property int $gift_id
 * @property string|null $gift_name
 * @property int|null $gift_points
 * @property int|null $gift_count
 * 
 * @property Collection|User[] $users
 *
 * @package App\Models
 */
class Gift extends Model
{
	protected $table = 'gifts';
	protected $primaryKey = 'gift_id';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'gift_id' => 'int',
		'gift_points' => 'int',
		'gift_count' => 'int'
	];

	protected $fillable = [
		'gift_name',
		'gift_points',
		'gift_count'
	];

	public function users()
	{
		return $this->belongsToMany(User::class, 'user_redeems_gifts');
	}
}
