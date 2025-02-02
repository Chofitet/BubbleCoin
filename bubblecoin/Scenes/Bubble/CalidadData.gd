extends Resource
class_name Calidad

@export var BurbujasCuerpo : Texture
@export var Barbas : Array[Texture] = []
@export var Lentes : Array[Texture] = []
@export var Gorros :Array[Texture] = []

@export_range(0,8) var Level : int

@export var minPrice : int
@export var maxPrice : int

@export var Modificadores : Array[Modificador] = []
@export var Nombres : NombreAleatorio

func generate_name() -> String:
	return Nombres.nombres.pick_random() + "\n" + Nombres.apellidos.pick_random() + "\n" + Nombres.titulos.pick_random()
	
func generate_price() -> int:
	return randi_range(minPrice,maxPrice)

func generate_modifier() -> Modificador:
	if Modificadores.is_empty():
		return Modificador.new()
	var modificador : Modificador = Modificadores.pick_random().duplicate()
	if modificador.ModifierType == "Multiplicador Idle":
		modificador.MultiplicadorIdle = randi_range(modificador.minimumValue, modificador.maximumValue + 1)
		modificador.ModifyDescription = "Idle x%d" % modificador.MultiplicadorIdle
	if modificador.ModifierType == "Adicionador Idle":
		modificador.AdicionadorIdle = randi_range(modificador.minimumValue, modificador.maximumValue + 1)
		modificador.ModifyDescription = "Idle +%d" % modificador.AdicionadorIdle
	if modificador.ModifierType == "Multiplicador Click":
		modificador.MultiplicadorClick = randi_range(modificador.minimumValue, modificador.maximumValue + 1)
		modificador.ModifyDescription = "Click x%d" % modificador.MultiplicadorClick
	if modificador.ModifierType == "Adicionador Click":
		modificador.AdicionadorClick = randi_range(modificador.minimumValue, modificador.maximumValue + 1)
		modificador.ModifyDescription = "Idle +%d" % modificador.AdicionadorClick
	return modificador

func generate_cuerpo() -> Texture:
	return BurbujasCuerpo

func generate_gorro() -> Texture:
	if not Gorros.is_empty():
		return Gorros.pick_random()
	return null

func generate_lente() -> Texture:
	if not Lentes.is_empty():
		return Lentes.pick_random()
	return null

func generate_barba() -> Texture:
	if not Barbas.is_empty():
		return Barbas.pick_random()
	return null
