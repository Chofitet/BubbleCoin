extends ResponsiveButton

@onready var label = $Label
var cost = 10
@export var web : PackedScene
signal webResearch

var incremento = 1.5
func _ready() -> void:
	super._ready()
	pressed.connect(Refresh)
	label.text = "%.2f" % cost

func Refresh():
	PlayerVariables.addSubCoins(-cost)
	cost *= incremento
	label.text = "%.2f" % cost
	webResearch.emit(web)

func _process(delta: float) -> void:
	if PlayerVariables.BubbleCoins >= cost:
		disabled = false
	else:
		disabled = true
