extends Panel


signal ArticleSet(article_to_set: int)


func set_article(article_to_set : int):
	ArticleSet.emit(article_to_set)
	print("ravenmail emit")
