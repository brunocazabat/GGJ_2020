extends Node2D

class_name Ressources

var _or:int
var _argent:int
var _quartz:int
var _platine:int
var _violet:int
var _emeraude:int
var _fer:int
var _magma:int
var _boule:int
var _marron:int

func _init():
	_or = 0
	_argent = 0
	_quartz = 0
	_platine = 0
	_violet = 0
	_emeraude = 0
	_fer = 0
	_magma = 0
	_boule = 0
	_marron = 0

func get_or()->int:
	return _or

func set_or(value):
	_or = value

func get_argent()->int:
	return _argent

func set_argent(value):
	_argent = value

func get_quartz()->int:
	return _quartz

func set_quartz(value):
	_quartz = value

func get_platine()->int:
	return _platine

func set_platine(value):
	_platine = value

func get_violet()->int:
	return _violet

func set_violet(value):
	_violet = value

func get_emeraude()->int:
	return _emeraude

func set_emeraude(value):
	_emeraude = value

func get_fer()->int:
	return _fer

func set_fer(value):
	_fer = value

func get_magma()->int:
	return _magma

func set_magma(value):
	_magma = value

func get_boule()->int:
	return _boule

func set_boule(value):
	_boule = value

func get_marron()->int:
	return _marron

func set_marron(value):
	_marron = value

func clear_stock():
	_or = 0
	_argent = 0
	_quartz = 0
	_platine = 0
	_violet = 0
	_emeraude = 0
	_fer = 0
	_magma = 0
	_boule = 0
	_marron = 0

func what_is_in_pocket()->int:
	return _or + _argent + _quartz + _platine + _violet + _emeraude + _fer + _magma + _boule + _marron

func check_pocket()->bool:
	if what_is_in_pocket() == 10:
		return false
	else:
		return true

func all_empty()->bool:
	if (_or == 0 and _argent == 0 and _quartz == 0 and _platine == 0 and _violet == 0 and _emeraude == 0
	and _fer == 0 and _magma == 0 and _boule == 0  and _marron == 0):
		return true
	else:
		return false
