<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Donate
 * 
 * @property int $donate_id
 * @property int|null $donate_total
 * @property string|null $donate_currency
 * @property int $user_id
 * 
 * @property User $user
 *
 * @package App\Models
 */
class Donate extends Model
{
	protected $table = 'donates';
	public $timestamps = false;

	protected $casts = [
		'donate_total' => 'int',
		'user_id' => 'int'
	];

	protected $fillable = [
		'donate_total',
		'donate_currency'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
