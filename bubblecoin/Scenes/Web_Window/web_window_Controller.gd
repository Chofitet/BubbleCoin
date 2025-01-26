extends Control

signal ChangeWeb

func EmitSignalWeb(web):
	ChangeWeb.emit(web)
