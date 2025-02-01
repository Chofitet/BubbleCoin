extends Node

const SETTINGS_FILENAME = "user://settings.cfg"

var master_volume : float = 100.0 :
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), log (value/100)*20)
	get():
		return exp(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))/20)*100


var music_volume : float = 100.0 :
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), log (value/100)*20)
	get():
		return exp(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))/20)*100


var effects_volume : float = 100.0 :
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Effects"), log (value/100)*20)
	get():
		return exp(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Effects"))/20)*100


func load_settings():
	var config = ConfigFile.new()

	# Load data from a file.
	var err = config.load(SETTINGS_FILENAME)

	# If the file didn't load, ignore it.
	if err != OK:
		return
	
	master_volume = config.get_value("Volume", "Master", 100.0)
	music_volume = config.get_value("Volume", "Music", 100.0)
	effects_volume = config.get_value("Volume", "Effects", 100.0)
	print("master_volume", master_volume)
	print("music_volume", music_volume)
	print("effects_volume", effects_volume)
	
	
func _init() -> void:
	load_settings()



func save_settings():
	# Create new ConfigFile object.
	print("saving...")
	var config = ConfigFile.new()

	# Store some values.
	config.set_value("Volume", "Master", master_volume)
	config.set_value("Volume", "Music", music_volume)
	config.set_value("Volume", "Effects", effects_volume)

	# Save it to a file (overwrite if already exists).
	config.save(SETTINGS_FILENAME)
	print("saved")


func sfx(stream : AudioStream):
	var ins = AudioStreamPlayer.new()
	ins.stream = stream
	ins.bus = 1
	ins.finished.connect(remove.bind(ins))
	add_child(ins)
	ins.play()

func remove(instancia : AudioStreamPlayer):
	instancia.queue_free()
