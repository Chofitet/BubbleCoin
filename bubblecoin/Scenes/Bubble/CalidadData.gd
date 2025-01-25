extends Resource
class_name Calidad

var name
var barba 
var lente
var gorro

@export var Nombre : Array[String] = []
@export var Apellido : Array[String] = []
@export var Titulo :  Array[String] = []

@export var BurbujasCuerpo : Texture
@export var Barbas : Array[Texture] = []
@export var Lentes : Array[Texture] = []
@export var Gorros :Array[Texture] = []

@export_range(0,3) var sub_level : int

func PicRandomBubble():
	
	name = Nombre[randf_range(0,Nombre.size())] + " " + Apellido[randf_range(0,Nombre.size())] + " " + Titulo[randf_range(0,Nombre.size())]
	if Barbas.size() != 0: barba = Barbas[randf_range(0,Barbas.size())]
	if Lentes.size() != 0: lente = Lentes[randf_range(0,Lentes.size())]
	if Gorros.size() != 0: gorro = Gorros[randf_range(0,gorro.size())]

func get_Name() -> String: return name

func get_barba() -> Texture: return barba

func get_lente() -> Texture: return lente

func get_gorro() -> Texture: return gorro
	
