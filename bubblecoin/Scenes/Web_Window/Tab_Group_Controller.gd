extends HBoxContainer

var tabsArray =[]
@export var TabEnables = 0
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is TextureRect:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)
			tab.visible = false
	for i in range(0,TabEnables):
		EnableTabs(i)
	

func tabPressed(tab):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()

func AppearTab():
	EnableTabs(TabEnables)
	TabEnables += 1

func EnableTabs(TabEnables):
	tabsArray[TabEnables].visible = true
