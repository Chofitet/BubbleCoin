extends Resource
class_name Calidad

var name
var barba 
var lente
var gorro
var price
var modificador : Modificador

@export var BurbujasCuerpo : Texture
@export var Barbas : Array[Texture] = []
@export var Lentes : Array[Texture] = []
@export var Gorros :Array[Texture] = []

@export_range(0,8) var Level : int

@export var minPrice : int
@export var maxPrice : int

@export var Modificadores : Array[Modificador] = []
@export var Nombres : NombreAleatorio

func PicRandomBubble():
	
	name = Nombres.nombres[randf_range(0,Nombres.nombres.size())] + " " + Nombres.apellidos[randf_range(0,Nombres.apellidos.size())] + " " + Nombres.titulos[randf_range(0,Nombres.titulos.size())]
	price = randi_range(minPrice,maxPrice)
	if Modificadores.size() != 0 :
		modificador = Modificadores[randf_range(0,Modificadores.size())].duplicate()
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
	if Barbas.size() != 0: barba = Barbas[randf_range(0,Barbas.size())]
	if Lentes.size() != 0: lente = Lentes[randf_range(0,Lentes.size())]
	if Gorros.size() != 0: gorro = Gorros[randf_range(0,Gorros.size())]
	
