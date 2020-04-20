extends Control

var player_words = []
var current_story = {
		"prompts" : ["a name", "a noun", "an expletive"],
		"story": "%s is the biggest %s I've ever seen. %s!"
		}

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ConfirmButtonText = $VBoxContainer/HBoxContainer/ButtonLabel

func _ready():	
	check_player_words_length()
	PlayerText.grab_focus()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()
	
func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = current_story["story"] % player_words
	
func prompt_player():
	DisplayText.text = "May I have " + current_story.prompts[player_words.size()] + " please?"

func change_confirm_label():
	ConfirmButtonText.text = "Woo!"

func end_game():
	PlayerText.queue_free()
	change_confirm_label()
	tell_story()
