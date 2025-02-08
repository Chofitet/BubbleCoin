@tool
extends VBoxContainer

var tabsArray : Array[EmailButton] =[]
signal OpenTab(tab : EmailButton)
func _ready() -> void:
	
	if Engine.is_editor_hint():
		for tab in get_children():
			if tab is EmailButton:
				tab.toggled.connect(tabPressed.bind(tab))
				tabsArray.append(tab)
		return
	
	var i = 0
	for tab in get_children():
		if tab is EmailButton:
			tab.toggled.connect(tabPressed.bind(tab))
			tabsArray.append(tab)
			if tab.day == PlayerVariables.dia and i not in PlayerVariables.unlocked_emails:
				PlayerVariables.unlocked_emails.append(i)
			tab.visible = false
			i += 1
	for unlocked_email in PlayerVariables.unlocked_emails:
		EnableTabs(unlocked_email)


func tabPressed(toggled_on : bool, tab : EmailButton):
	if not toggled_on:
		return
	OpenTab.emit(tab)
	for t in tabsArray:
		if t != tab:
			t.button_pressed = false

func EnableTabs(TabEnables):
	tabsArray[TabEnables].visible = true
