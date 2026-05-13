function key_to_string(key)
{
	switch (key)
	{
		case vk_up: return "UP";
		case vk_down: return "DOWN";
		case vk_left: return "LEFT";
		case vk_right: return "RIGHT";
		case vk_enter: return "ENTER";
		case vk_escape: return "ESC";
		case vk_space: return "SPACE";
		case vk_control: return "CTRL";
	}
	var _char = chr(key);
	if (_char != "") return _char;
	
	return "KEY "+ string(key);
}