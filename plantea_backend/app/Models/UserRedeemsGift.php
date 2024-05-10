<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class UserRedeemsGift
 * 
 * @property int $user_id
 * @property int $gift_id
 * 
 * @property Gift $gift
 * @property User $user
 *
 * @package App\Models
 */
class UserRedeemsGift extends Model
{
	protected $table = 'user_redeems_gifts';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'user_id' => 'int',
		'gift_id' => 'int'
	];

	public function gift()
	{
		return $this->belongsTo(Gift::class);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
