extends TextureRect
@export var Web : PackedScene
@export var nameWeb : String
signal TabPress

func _ready() -> void:
	$button.pressed.connect(TabEnter)

func TabEnter():
	PlayerVariables.SetActualWeb(nameWeb)
	TabPress.emit(self)

func TabExit():
	self_modulate = Color.DARK_GRAY
