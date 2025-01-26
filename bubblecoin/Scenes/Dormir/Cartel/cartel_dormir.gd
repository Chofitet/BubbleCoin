extends Control

@onready var count: Label = $Label
@onready var anim: AnimationPlayer = $AnimationPlayer

func aparecer():
	anim.play("aparecer")

func desaparecer():
	anim.play("ocultar")
