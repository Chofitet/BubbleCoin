extends MarginContainer

var article_to_open = -1

signal ArticleSet(article_to_set: int)

func _ready() -> void:
	$VBoxContainer/Button.pressed.connect(set_article)

func SetEmail(emailButton):
	$VBoxContainer/RichTextLabel.visible = true
	$VBoxContainer/RichTextLabel.text = emailButton.email
	if (emailButton.article >= 0):
		$VBoxContainer/Button.visible = true
	else:
		$VBoxContainer/Button.visible = false
	article_to_open = emailButton.article


func set_article():
	ArticleSet.emit(article_to_open)
	# :/ sry
	#get_parent().get_parent().get_parent().get_parent().get_node("Tab_Bar/Tab_Controller").open_article(article_to_open)
