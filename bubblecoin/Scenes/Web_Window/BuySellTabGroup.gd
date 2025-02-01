extends Control

var tabsArray : Array[Button] =[]
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is Button:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)

func tabPressed(tab : Button):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab:
			t.button_pressed = false

func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
