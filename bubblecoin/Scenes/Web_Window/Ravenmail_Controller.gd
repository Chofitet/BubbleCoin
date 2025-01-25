extends VBoxContainer

var tabsArray =[]
signal OpenTab
func _ready() -> void:
	for tab in get_children():
		if tab is TextureRect:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)
			tab.visible = false
	for unlocked_email in PlayerVariables.unlocked_emails:
		EnableTabs(unlocked_email)



func tabPressed(tab):
	OpenTab.emit(tab.email)
	print(tab.get_node("button").text)
	for t in tabsArray:
		if t != tab: 
			print(t.name)
			t.TabExit()

#func AppearTab():
#	EnableTabs(TabEnables)
#	TabEnables += 1

func EnableTabs(TabEnables):
	tabsArray[TabEnables].visible = true
