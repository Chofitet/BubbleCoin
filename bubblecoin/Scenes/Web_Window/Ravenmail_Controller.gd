@tool
extends VBoxContainer

var tabsArray =[]
signal OpenTab
func _ready() -> void:
	var i = 0
	for tab in get_children():
		if tab is TextureRect:
			tab.TabPress.connect(tabPressed)
			tabsArray.append(tab)
			if (tab.day == PlayerVariables.dia):
				if i not in PlayerVariables.unlocked_emails:
					PlayerVariables.unlocked_emails.append(i)
			tab.visible = false
			i += 1
	# so we can use this as a tool
	if not Engine.is_editor_hint():
		for unlocked_email in PlayerVariables.unlocked_emails:
			EnableTabs(unlocked_email)



func tabPressed(tab):
	OpenTab.emit(tab)
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
