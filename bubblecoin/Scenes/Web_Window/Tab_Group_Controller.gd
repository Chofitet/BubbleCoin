extends HBoxContainer

var tabsArray : Array[WebTab] =[]
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is WebTab:
			tab.toggled.connect(tabPressed.bind(tab))
			tabsArray.append(tab)
			tab.visible = false
	for i in PlayerVariables.unlocked_tabs:
		EnableTabs(i)
	

func open_article(article_to_open : int):
	if article_to_open not in PlayerVariables.unlocked_tabs:
		PlayerVariables.unlocked_tabs.append(article_to_open)
		EnableTabs(article_to_open)
	
	tabsArray[article_to_open].button_pressed = true

func tabPressed(toggled_on : bool, tab : WebTab):
	if not toggled_on:
		return
	PlayerVariables.SetActualWeb(tab.nameWeb)
	OpenTab.emit(tab.Web)
	for t in tabsArray:
		if t != tab:
			t.button_pressed = false


func EnableTabs(tabToEnable : int):
	tabsArray[tabToEnable].visible = true
