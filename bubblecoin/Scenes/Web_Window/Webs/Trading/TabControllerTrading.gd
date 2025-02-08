extends ResponsiveButton
@export var Web : PackedScene
@export var nameWeb : String

func _ready() -> void:
	super._ready()
	modulate_disabled = modulate_pressed

func _toggled(toggled_on: bool) -> void:
	disabled = toggled_on
