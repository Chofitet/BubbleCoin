extends Area2D

var mouse_in := false
signal click

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tap") and mouse_in:
		on_click()

func on_click():
	print("CLICK")
	click.emit()

func _on_mouse_entered() -> void:
	mouse_in = true

func _on_mouse_exited() -> void:
	mouse_in = false
