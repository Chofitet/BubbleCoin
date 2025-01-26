class_name FinalManager
extends Control

@onready var stop_mouse_rect: ColorRect = $ColorRect
@onready var transition: Transition = %Transition

@export_category("Final Burbuja")
@export var delay_burbuja := 1
@export var PLACEHOLDERduracion_escena_burbuja := 3.00

@export var delay_desplome := 10

func _process(delta: float) -> void:
	if not PlayerVariables.final_activo:
		if PlayerVariables.compro_burbuja_final:# or Input.is_action_just_pressed('ui_accept'):
			llamar_final_burbuja()
		if PlayerVariables.dia == 4: # or Input.is_action_just_pressed('ui_accept'):
			llamar_final_desplome()
#region Final Burbuja
func llamar_final_burbuja():
	print("Paren todo!! Compraste la burbuja final")
	%DormirManager.parar_tiempo()
	PlayerVariables.final_activo = true
	bloquear_pantalla()
	
	await get_tree().create_timer(delay_burbuja).timeout
	
	transition.enter.connect(activar_escena_burbuja)
	transition.entrar()

func activar_escena_burbuja():
	print("La escena de la burbuja se está reproduciendo")
	transition.enter.connect(activar_escena_burbuja)
	transition.salir()
	await get_tree().create_timer(PLACEHOLDERduracion_escena_burbuja).timeout
	llamar_a_escena_final()
#endregion

func llamar_final_desplome():
	%DormirManager.parar_tiempo()
	PlayerVariables.final_activo = true
	print("Oh no!! Perdiste todo!! ajajajajjaj")
	await get_tree().create_timer(delay_desplome).timeout
	print("Por caer en un ponzi xd")
	llamar_a_escena_final()
	pass 

func llamar_a_escena_final():
	print("FIN DEL JUEGO, GRACIAS POR JUGAR")
	transition.entrar()
	transition.enter.connect(activar_escena_final)
	
func activar_escena_final():
	%PantallaFinal.visible = true
	print("pini.")
	
func bloquear_pantalla(valor := true):
	if valor:
		stop_mouse_rect.color.a = 0.002
		stop_mouse_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		stop_mouse_rect.color.a = 0
		stop_mouse_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
