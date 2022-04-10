extends Control


func _on_Button_pressed():
	$CenterContainer/VBoxContainer/ButtonSound.play()
	var result = get_tree().change_scene("res://Menu/titlescreen/TitleScreen.tscn")
	result = result
