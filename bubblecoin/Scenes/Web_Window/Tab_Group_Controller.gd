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
	for i in PlayerVariables.unlocked_tabs:
		EnableTabs(i)
	

func open_article(article_to_open):
	if article_to_open not in PlayerVariables.unlocked_tabs:
		PlayerVariables.unlocked_tabs.append(article_to_open)
		EnableTabs(article_to_open)
		
	OpenTab.emit(tabsArray[article_to_open].Web)

func tabPressed(tab):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()

func AppearTab():
	EnableTabs(TabEnables)
	TabEnables += 1

func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
