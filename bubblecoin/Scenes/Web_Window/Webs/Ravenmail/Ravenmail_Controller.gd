@tool
extends VBoxContainer

var tabsArray =[]
signal OpenTab(tab : EmailButton)
func _ready() -> void:
	
	if Engine.is_editor_hint():
		for tab in get_children():
			if tab is EmailButton:
				tab.pressed.connect(tabPressed.bind(tab))
				tabsArray.append(tab)
		return
	
	var i = 0
	for tab in get_children():
		if tab is EmailButton:
			tab.pressed.connect(tabPressed.bind(tab))
			tabsArray.append(tab)
			if tab.day == PlayerVariables.dia and i not in PlayerVariables.unlocked_emails:
				PlayerVariables.unlocked_emails.append(i)
			tab.visible = false
			i += 1
	for unlocked_email in PlayerVariables.unlocked_emails:
		EnableTabs(unlocked_email)


func tabPressed(tab : EmailButton):
	OpenTab.emit(tab)
	print(tab.text)
	for t in tabsArray:
		if t != tab:
			t.TabExit()

func EnableTabs(TabEnables):
	tabsArray[TabEnables].visible = true
