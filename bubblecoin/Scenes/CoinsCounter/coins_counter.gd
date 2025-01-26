extends Control

func _process(delta: float) -> void:
	var coins = PlayerVariables.BubbleCoins
	$HBoxContainer/Label.text = "%.2f" % coins
	
