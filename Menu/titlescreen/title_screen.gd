extends Control

var scene_path_to_load

# Called when the node enters the scene tree for the first time.
func _ready():
	$MainMusic.play()
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "on_Button_pressed", [button.scene_to_load])

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func on_Button_pressed(scene_to_load):
	$Menu/CenterRow/ButtonSound.play()
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	var result = get_tree().change_scene(scene_path_to_load)
	result = result


func _on_ContinueButton_pressed():
	get_tree().quit()
