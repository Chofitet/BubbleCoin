extends Control

@onready var multiplicadorClick = $VBoxContainer/VBoxContainer/HBoxContainer/LabelModificadorClick
@onready var multiplicadorSegundo = $VBoxContainer/VBoxContainer2/HBoxContainer/LabelModificadorSegundo

func _process(delta: float) -> void:
	var addSegundo = PlayerVariables.AdicionIdle
	var multiSegundo = PlayerVariables.MultiplicadorIdle
	var addClick = PlayerVariables.AdicionClicker
	var multiClick = PlayerVariables.MultiplicadorClicker
	
	multiplicadorClick.text = str((1 * multiClick) + addClick)
	multiplicadorSegundo.text = str((1 * multiSegundo) + addSegundo)
