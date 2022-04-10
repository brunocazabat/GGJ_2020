extends Node2D

var display_value = 60
var isTime = true
var obj = 0
var objectif = 50

onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
		timer.set_wait_time(1)
		timer.start()

func Timer_TimeOut():
	display_value -= 1
	$VBoxContainer/Label.set_text(str(display_value))
	if display_value == 0 or objectif <= obj:
		timer.stop()
		isTime = false

func _on_increase_pressed():
	$VBoxContainer/obj.set_text(str(obj))
	if isTime == true:
		obj += 1
