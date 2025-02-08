extends Button
class_name ResponsiveButton


var modulate_normal := Color.LIGHT_GRAY
var modulate_pressed := Color.WHITE
var modulate_hover_pressed := Color.WHITE
var modulate_hover := Color.ALICE_BLUE
var modulate_disabled := Color.DARK_GRAY

func _ready() -> void:
	begin_bulk_theme_override()
	for button_mode in ["disabled", "hover", "pressed"]:
		if not has_theme_stylebox_override(button_mode):
			add_theme_stylebox_override(button_mode, get_theme_stylebox("normal"))
	end_bulk_theme_override()

func _draw() -> void:
	if get_draw_mode() == DRAW_NORMAL:
		modulate = modulate_normal
	elif get_draw_mode() == DRAW_PRESSED:
		modulate = modulate_pressed
	elif get_draw_mode() == DRAW_HOVER_PRESSED:
		modulate = modulate_hover_pressed
	elif get_draw_mode() == DRAW_HOVER:
		modulate = modulate_hover
	elif get_draw_mode() == DRAW_DISABLED:
		modulate = modulate_disabled
