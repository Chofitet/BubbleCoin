extends Resource
class_name Modificador

@export var ModifyDescription : String

@export_enum("Multiplicador Idle", "Adicionador Idle", "Multiplicador Click", "Adicionador Click") var ModifierType : String = "Multiplicador Idle"

@export var minimumValue : int = 0
@export var maximumValue : int = 0

var MultiplicadorIdle  : int = 0
var AdicionadorIdle : int = 0

var MultiplicadorClick : int = 0
var AdicionadorClick : int = 0
