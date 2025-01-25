extends Panel

var WebsPanel =[]

func SetWebWindow(web : PackedScene):
	
	if WebsPanel.size() != 0:
		var oldPanel = WebsPanel[0]
		WebsPanel.clear()
		oldPanel.queue_free()
	

	
	var instance_web = web.instantiate()
	add_child(instance_web)
	WebsPanel.append(instance_web)
