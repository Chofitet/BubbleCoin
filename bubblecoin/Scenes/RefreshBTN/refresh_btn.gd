extends Button

@onready var label = $Label
var cost = 10
@export var web : PackedScene
signal webResearch

var exponencial = 0

func _ready() -> void:
	pressed.connect(Refresh)

func Refresh():
	var incremento =  pow(cost,exponencial + 1)
	cost = incremento
	label.text = str(cost)
	webResearch.emit(web)
	exponencial +=1
