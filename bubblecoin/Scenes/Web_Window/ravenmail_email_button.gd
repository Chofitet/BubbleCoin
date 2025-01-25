@tool
extends TextureRect

@export var email_subject : String :
	set(value):
		email_subject = value
		$button.text = value
@export var article : int = -1
signal TabPress
@export_multiline var email : String :
	set(value):
		email = value
		TabPress.emit(self)

func _ready() -> void:
	if not Engine.is_editor_hint():
		self_modulate = Color.DARK_GRAY
		$button.text = email_subject
		$button.pressed.connect(TabEnter)

func TabEnter():
	self_modulate = Color.WHITE
	TabPress.emit(self)

func TabExit():
	self_modulate = Color.DARK_GRAY
