function sound_handler(sound, loops = false, bitcrush = true, reverb = true, priority = 1, gain = global.gain, pitch = random_range(0.75, 1.25), await = false)
{
	var _emitter1 = audio_emitter_create();
	var _emitter1_bus = audio_bus_create();
	audio_emitter_bus(_emitter1, _emitter1_bus);
	
	if bitcrush
	{
		_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Bitcrusher,	
		{
			gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
		});
	}
	
	if reverb
	{
		_emitter1_bus.effects[0] = audio_effect_create(AudioEffectType.Reverb1,	
		{
			gain: 0.8, factor: 5, resolution: 16, mix: 0.3 
		});
	}
	
	audio_play_sound_on(_emitter1, sound, loops, priority, gain, 0, pitch)
}