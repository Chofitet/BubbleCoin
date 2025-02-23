@tool
extends ResponsiveButton
class_name EmailButton

@export var email_subject : String :
	set(value):
		email_subject = value
		$Label.text = value

@export var article : int = -1

@export_multiline var email : String :
	set(value):
		email = value
		pressed.emit()

@export var day : int

func _ready() -> void:
	if not Engine.is_editor_hint():
		super()
		$Label.text = email_subject
		modulate_disabled = modulate_pressed
	
func _toggled(toggled_on: bool) -> void:
	disabled = toggled_on
