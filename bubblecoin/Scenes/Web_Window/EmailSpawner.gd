extends Panel

var article_to_open = -1

func _ready() -> void:
	$Button.pressed.connect(set_article)

func SetEmail(emailButton):
	$RichTextLabel.visible = true
	$RichTextLabel.text = emailButton.email
	if (emailButton.article >= 0):
		$Button.visible = true
	else:
		$Button.visible = false
	article_to_open = emailButton.article


func set_article():
	# :/ sry
	get_parent().get_parent().get_parent().get_node("Tab_Bar/Tab_Controller").open_article(article_to_open)
