extends Button

@onready var label = $Label
var cost = 10
@export var web : PackedScene
signal webResearch

var exponencial = 2
var incremento = 1
func _ready() -> void:
	pressed.connect(Refresh)
	label.text = str(cost)

func Refresh():
	incremento = incremento * exponencial
	exponencial += 1
	cost = incremento
	label.text = str(cost)
	webResearch.emit(web)
	PlayerVariables.addSubCoins(-cost)

func _process(delta: float) -> void:
	if PlayerVariables.BubbleCoins >= cost:
		disabled = false
	else:
		disabled = true
