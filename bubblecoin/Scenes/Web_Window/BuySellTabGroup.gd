extends Control

var tabsArray : Array[Button] = []
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is Button:
			tab.toggled.connect(tabPressed.bind(tab))
			tabsArray.append(tab)

func tabPressed(toggled_on: bool, tab : Button):
	if not toggled_on:
		return
	PlayerVariables.SetActualWeb(tab.nameWeb)
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab:
			t.button_pressed = false

func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
