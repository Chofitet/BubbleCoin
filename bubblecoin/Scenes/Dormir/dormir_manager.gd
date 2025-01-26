extends Control

@onready var transition : Transition = %Transition

@onready var delay_advertencia: Timer = $DelayAdvertencia
@onready var delay_dormir: Timer = $DelayDormir
@onready var duracion_sue_o: Timer = $'DuracionSueño'

signal actualizar_dia

#region Ciclo de sueño
func comenzar_sueño():
	print("El jugador tendrá sueño pronto")
	delay_advertencia.start()

func _on_delay_advertencia_timeout() -> void:
	# Comienza el delay antes de que el jugador se duerma
	print("El jugador esta por dormirse")
	delay_dormir.start()

func _on_delay_dormir_timeout() -> void:
	# El jugador entra en sueño y configura su dormir
	print("El jugador se durmió")
	transition.entrar()
	transition.enter.connect(dormido)

func dormido():
	# REINICIO DE TODO
	siguiente_dia()
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
	print("sueño_completado")
#endregion

func siguiente_dia():
	actualizar_dia.emit()
