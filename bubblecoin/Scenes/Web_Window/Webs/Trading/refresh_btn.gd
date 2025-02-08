extends ResponsiveButton

@onready var label = $Label
@export var web : PackedScene
signal webResearch

var incremento = 1.5
func _ready() -> void:
	super._ready()
	PlayerVariables.ChangedWeb.connect(updateVisibility)
	updateVisibility(PlayerVariables.ActualWeb)
	pressed.connect(Refresh)
	label.text = "%.2f" % PlayerVariables.RefreshCost

func updateVisibility(newWeb: String):
	visible = newWeb == "compra"

func Refresh():
	SfxManager.newbubble()
	PlayerVariables.addSubCoins(-PlayerVariables.RefreshCost)
	PlayerVariables.RefreshCost *= incremento
	label.text = "%.2f" % PlayerVariables.RefreshCost
	webResearch.emit(web)

func _process(_delta: float) -> void:
	if PlayerVariables.BubbleCoins >= PlayerVariables.RefreshCost:
		disabled = false
	else:
		disabled = true
