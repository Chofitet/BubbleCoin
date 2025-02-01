extends Panel

var WebsPanel =[]

func SetWebWindow(web : PackedScene):
	
	if WebsPanel.size() != 0:
		var oldPanel = WebsPanel[0]
		WebsPanel.clear()
		oldPanel.queue_free()
	

	
	var instance_web = web.instantiate()
	if instance_web.has_signal("ArticleSet"):
		instance_web.ArticleSet.connect(open_article)
	add_child(instance_web)
	WebsPanel.append(instance_web)


signal ArticleSet(article_to_open: int)

func open_article(article_to_open : int):
	ArticleSet.emit(article_to_open)
