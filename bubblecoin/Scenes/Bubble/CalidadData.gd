extends Resource
class_name Calidad

var name
var barba 
var lente
var gorro
var price

@export var Nombre : Array[String] = []
@export var Apellido : Array[String] = []
@export var Titulo :  Array[String] = []

@export var BurbujasCuerpo : Texture
@export var Barbas : Array[Texture] = []
@export var Lentes : Array[Texture] = []
@export var Gorros :Array[Texture] = []

@export_range(0,8) var Level : int

@export var minPrice : int
@export var maxPrice : int

@export var modificador : Array[Modificador]

func PicRandomBubble():
	
	name = Nombre[randf_range(0,Nombre.size())] + " " + Apellido[randf_range(0,Nombre.size())] + " " + Titulo[randf_range(0,Nombre.size())]
	price = randi_range(minPrice,maxPrice)
	if Barbas.size() != 0: barba = Barbas[randf_range(0,Barbas.size())]
	if Lentes.size() != 0: lente = Lentes[randf_range(0,Lentes.size())]
	if Gorros.size() != 0: gorro = Gorros[randf_range(0,gorro.size())]
	
