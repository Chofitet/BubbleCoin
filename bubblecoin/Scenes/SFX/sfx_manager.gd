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
	
const sfx_announcement = preload("res://AudioAssets/sfx_announcement.ogg")
func announcement():
	sfx(sfx_announcement)

const sfx_buy = preload("res://AudioAssets/sfx_buy.ogg")
func buy():
	sfx(sfx_buy)

const sfx_click = preload("res://AudioAssets/sfx_click.ogg")
func click():
	sfx(sfx_click)

const sfx_endday = preload("res://AudioAssets/sfx_endday.ogg")
func endday():
	sfx(sfx_endday)

const sfx_newbubble = preload("res://AudioAssets/sfx_newbubble.ogg")
func newbubble():
	sfx(sfx_newbubble)

const sfx_newday = preload("res://AudioAssets/sfx_newday.ogg")
func newday():
	sfx(sfx_newday)

func sfx(stream : AudioStream):
	var ins := AudioStreamPlayer.new()
	ins.stream = stream
	ins.bus = &"Effects"
	ins.finished.connect(remove.bind(ins))
	add_child(ins)
	ins.play()

func remove(instancia : AudioStreamPlayer):
	instancia.queue_free()


@onready var music_stream : AudioStreamInteractive = preload("res://Scenes/SFX/interactive_music.tres")
@onready var music_player := AudioStreamPlayer.new()
var stream_playback : AudioStreamPlaybackInteractive
var current_stream : StringName

const web_to_stream := {
	"menu": &"MainMenu",
	"trade": &"Trade",
	"compra": &"Trade",
	"venta": &"Trade",
	"mail": &"Mail",
	"settings": &"Articles",
	"bubble": &"Articles"
}

func _ready() -> void:
	music_player.stream = music_stream
	music_player.bus = &"Music"
	add_child(music_player)
	music_player.play()
	stream_playback = music_player.get_stream_playback()
	current_stream = music_stream.get_clip_name(music_stream.initial_clip)
	
	PlayerVariables.ChangedWeb.connect(change_stream)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			click()
			#play()



func change_stream(web: String) -> void:
	if current_stream != web_to_stream[web]:
		current_stream = web_to_stream[web]
		stream_playback.switch_to_clip_by_name(current_stream)
