extends TextureRect

@export var ads : Array[Texture2D] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_random_ad()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_random_ad():
	if not ads.is_empty():
		texture = ads[randi() % ads.size()]
	$Timer.start(3)


func _on_timer_timeout() -> void:
	set_random_ad()
