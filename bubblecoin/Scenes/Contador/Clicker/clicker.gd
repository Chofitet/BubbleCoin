extends Button

signal click

func on_click():
	print("CLICK")
	click.emit()

func _on_click() -> void:
	print("CLICK")
	on_click()
