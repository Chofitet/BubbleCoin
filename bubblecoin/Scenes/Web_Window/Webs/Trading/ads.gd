extends TextureRect

@export var ads : Array[Texture2D] = []

func _ready() -> void:
	randomize_ad()

func randomize_ad() -> void:
	if ads.is_empty():
		return
	
	if ads.size() == 1:
		texture = ads[0]
		return
		
	var next_ad = ads.pick_random()
	while (texture == next_ad):
		next_ad = ads.pick_random()
	texture = next_ad
