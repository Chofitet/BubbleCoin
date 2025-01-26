extends TextureRect
@export var Web : PackedScene
signal TabPress

func _ready() -> void:
	$button.pressed.connect(TabEnter)

func TabEnter():
	TabPress.emit(self)

func TabExit():
	self_modulate = Color.DARK_GRAY
