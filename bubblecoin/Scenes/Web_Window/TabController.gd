extends TextureRect

func _ready() -> void:
	$button.pressed.connect(TabEnter)

func TabEnter():
	self_modulate = Color.WHITE
	pass

func TabExit():
	self_modulate = Color.DARK_GRAY
	pass
