extends Node2D

@export var activo := true
signal generar_burbujas

@onready var timer: Timer = $Timer

func _ready() -> void:
	if activo:
		timer.start()

func iniciar_timer():
	if not activo:
		activo = true
		timer.start()

func parar_timer():
	if  activo:
		activo = false
		timer.stop()

func _on_timer_timeout() -> void:
	on_generar_burbujas()

func on_generar_burbujas():
	print("Bubble Coins generadas.")
	generar_burbujas.emit()
