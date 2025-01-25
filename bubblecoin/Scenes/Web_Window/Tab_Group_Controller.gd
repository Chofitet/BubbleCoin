extends HBoxContainer

var tabsArray =[]
var TabEnables = 0
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is TextureRect:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)
			tab.visible = false
	
	AppearTab()

func tabPressed(tab):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()

func AppearTab():
	tabsArray[TabEnables].visible = true
	TabEnables += 1
