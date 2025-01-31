extends HBoxContainer

var tabsArray =[]
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
		
	tabsArray[article_to_open].TabEnter()

func tabPressed(tab):
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()


func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
