extends Control

@onready var button: Button = $Button

func iniciar_juego():
	print("Juego Iniciado")
	%Transition.salir()
	queue_free()

func _on_button_button_down() -> void:
	button.disabled = true
	iniciar_juego()
