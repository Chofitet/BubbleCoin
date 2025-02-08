extends Label


func _process(_delta: float) -> void:
	var coins = PlayerVariables.BubbleCoins
	text = "%.2f" % coins
