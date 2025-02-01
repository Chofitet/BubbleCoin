extends ResponsiveButton
class_name WebTab

@export var Web : PackedScene
@export var nameWeb : String
signal TabPress

func _ready() -> void:
	super._ready()
	
func _toggled(toggled_on: bool) -> void:
	if toggled_on:
		PlayerVariables.SetActualWeb(nameWeb)
		TabPress.emit(self)
