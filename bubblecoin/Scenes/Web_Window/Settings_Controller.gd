extends Panel


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	$Tabs/VBoxContainer/VolumeSlider.value = AudioServer.get_bus_volume_db(0) * 100
	
func set_volume(value):
	print(value)
	AudioServer.set_bus_volume_db(0, value / 100.0)
	

func pause_game():
	get_tree().paused = true
	$PauseMenu.visible = true

func resume_game():
	print("resume")
	get_tree().paused = false
	$PauseMenu.visible = false

func exit_game() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
