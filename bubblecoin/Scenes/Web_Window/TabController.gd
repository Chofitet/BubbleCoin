extends TextureRect
@export var Web : PackedScene
signal TabPress

func _ready() -> void:
	self_modulate = Color.DARK_GRAY
	$button.pressed.connect(TabEnter)

func TabEnter():
	self_modulate = Color.WHITE
	TabPress.emit(self)

func TabExit():
	self_modulate = Color.DARK_GRAY
