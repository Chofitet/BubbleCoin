extends Button
@export var Web : PackedScene
@export var nameWeb : String
signal TabPress

func _ready() -> void:
	pressed.connect(TabEnter)

func TabEnter():
	PlayerVariables.SetActualWeb(nameWeb)
	TabPress.emit(self)

func TabExit():
	button_pressed = false
