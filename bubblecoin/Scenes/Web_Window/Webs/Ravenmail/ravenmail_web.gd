@tool
extends Panel

signal ArticleSet(article_to_set: int)

var article_to_open = -1

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	%Email.visible = false
	%EmailLink.visible = false
	%IdleLogo.visible = true
	%IdleLabel.visible = true
	%EmailLink.pressed.connect(set_article)

func SetEmail(emailButton : EmailButton):
	%Email.text = emailButton.email
	%Email.visible = true
	if (emailButton.article >= 0):
		%EmailLink.visible = true
	else:
		%EmailLink.visible = false
	%IdleLogo.visible = false
	%IdleLabel.visible = false
	article_to_open = emailButton.article


func set_article():
	ArticleSet.emit(article_to_open)
