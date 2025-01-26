extends HBoxContainer

var tabsArray =[]
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is TextureRect:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)

func tabPressed(tab):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()

func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
