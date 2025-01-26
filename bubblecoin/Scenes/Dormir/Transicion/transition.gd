class_name Transition
extends ColorRect

@onready var anim: AnimationPlayer = $AnimationPlayer
signal  out
signal  enter

func entrar():
	anim.play("fade_in")

func salir():
	anim.play("fade_out")

func is_out():
	print("OUT!")
	out.emit()

func is_in():
	print("IN!")
	enter.emit()
