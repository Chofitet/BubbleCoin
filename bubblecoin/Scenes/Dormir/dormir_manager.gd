class_name DormirManager
extends Control

@onready var transition : Transition = %Transition

@onready var delay_advertencia: Timer = $DelayAdvertencia
@onready var delay_dormir: Timer = $DelayDormir
@onready var duracion_sue_o: Timer = $'DuracionSueño'

@export var auto := true
@export var time_counter : Label

func _ready() -> void:
	if auto:
		comenzar_sueño()

func _process(delta: float) -> void:
	if PlayerVariables.final_activo:
		queue_free()
	if time_counter:
		time_counter.text = str(ceili(delay_dormir.time_left))
	else:
		time_counter = %CartelDormir.count

#region Ciclo de sueño
func comenzar_sueño():
	print("El dia acaba de iniciar")
	delay_advertencia.start()

func _on_delay_advertencia_timeout() -> void:
	# Comienza el delay antes de que el jugador se duerma
	print("El jugador esta por dormirse")
	%CartelDormir.aparecer()
	delay_dormir.start()

func _on_delay_dormir_timeout() -> void:
	# El jugador entra en sueño y configura su dormir
	print("El jugador se durmió")
	transition.entrar()
	transition.enter.connect(dormido)

func dormido():
	# REINICIO DE TODO
	PlayerVariables.siguiente_dia()
	%CartelDormir.desaparecer()
	print("Pasó un nuevo día")
	transition.enter.disconnect(dormido)
	duracion_sue_o.start()

func _on_duracion_sueño_timeout() -> void:
	# Iniciar despertarse
	print("El jugador comenzó a despertarse")
	transition.salir()
	transition.out.connect(sueño_completado)

func sueño_completado():
	print("El jugador ya comenzó su día")
	transition.out.disconnect(sueño_completado)
	if (auto):
		comenzar_sueño()
	else:
		print("sueño_completado")
#endregion

func parar_tiempo():
	delay_advertencia.paused = true
	delay_dormir.paused = true
	duracion_sue_o.paused = true

func reanudar_tiempo():
	delay_advertencia.paused = false
	delay_dormir.paused = false
	duracion_sue_o.paused = false
