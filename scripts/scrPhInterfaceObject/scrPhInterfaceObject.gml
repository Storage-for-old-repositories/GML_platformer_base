

#region работа с флагами

function ph_flags_set(_bits, _id=self) {
	
	_id.ph_colls_obj_flags = _bits;
}

function ph_flags_add(_bits, _id=self) {
	
	_id.ph_colls_obj_flags |= _bits;
}
				
function ph_flags_del(_bits, _id=self) {
	
	_id.ph_colls_obj_flags &= ~_bits;
}

function ph_flags_get(_id=self) {
	
	return _id.ph_colls_obj_flags;
}

#endregion

#region включение/выключение столкновений

function ph_collision_enable(_enable, _id=self) {
	
	_id.ph_colls_enable = _enable;
}

function ph_collision_get_enable(_id=self) {
	
	return _id.ph_colls_enable;
}

#endregion

#region работа со скоростью

function ph_set_speed_x(_speed, _id=self) {
	
	_id.ph_speed_x = _speed;
}

function ph_set_speed_y(_speed, _id=self) {
	
	_id.ph_speed_y = _speed;
}

function ph_add_speed_x(_speed, _id=self) {
	
	_id.ph_speed_x += _speed;
}

function ph_add_speed_y(_speed, _id=self) {
	
	_id.ph_speed_y += _speed;
}

function ph_get_speed_x(_id=self) {
	
	return _id.ph_speed_x;
}

function ph_get_speed_y(_id=self) {
	
	return _id.ph_speed_y;
}

function ph_set_speed_direction(_speed, _direction, _id=self) {
	
	ph_set_speed_x(lengthdir_x(_speed, _direction), _id);
	ph_set_speed_y(lengthdir_y(_speed, _direction), _id);
}

function ph_set_speed_y_jump(_pixel, _id=self) {
	
	_id.ph_speed_y = ph_math_speed_y_jump(_pixel, _id.ph_colls_gravity_acl);
}

function ph_math_speed_y_jump(_pixel, _acl) {
	
	debug {
		
		if (_pixel < 0) {
			
			show_error("ph_math_speed_y_jump.pixel не может быть отрицательным", true);
		}
	}
	
	var _k = _acl / 2;
	var _y = (_k + sqrt(power(_k, 2) + (4 * _k * _pixel))) / (2 * _k);
	
	return (_y * -_acl);
}

#endregion





/*


//
self.ph_colls_obj_flags = (1 << self.image_index);

//
debug {
	
	self.visible = true;
	if (self.object_index != objCollsObj) {
		
		show_error("Не наследуемое событие: objCollsObj.create (" 
			+ object_get_name(self.object_index) + ")", true);
	}
	
	if (self.image_index >= sprite_get_number(self.sprite_index)
		|| self.image_index < 0) {
		
		show_error("Не корректный image_index (" 
			+ object_get_name(self.object_index) + ")", true);
	}
}




// */