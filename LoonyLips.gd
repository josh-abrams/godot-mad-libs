extends Control

func _ready():
	var prompts = ["This", "Monkey", "Yum"]
	var story = "%s is the biggest %s I've ever seen. %s"



	
	

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func _on_TextureButton_pressed():
	var new_text = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(new_text)


func update_DisplayText(new_text):
	$VBoxContainer/DisplayText.text = new_text
	$VBoxContainer/HBoxContainer/PlayerText.clear()

