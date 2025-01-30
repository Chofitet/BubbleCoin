extends Label


func _process(delta: float) -> void:
	var coins = PlayerVariables.BubbleCoins
	text = "%.2f" % coins
