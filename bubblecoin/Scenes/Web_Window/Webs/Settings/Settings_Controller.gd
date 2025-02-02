extends Panel


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	%VolumeSlider.value = SfxManager.master_volume
	%MusicSlider.value = SfxManager.music_volume
	%EffectsSlider.value = SfxManager.effects_volume
	
func set_master_volume(value):
	SfxManager.master_volume = value
	
func set_music_volume(value):
	SfxManager.music_volume = value
	
func set_effects_volume(value):
	SfxManager.effects_volume = value

func _exit_tree() -> void:
	SfxManager.save_settings()

func exit_game() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
