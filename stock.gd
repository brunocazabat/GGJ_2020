extends Node2D

class_name Stock

var _stock_max:int
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

func _init(stock_max):
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
	_stock_max = stock_max

func set_stock(ore, argent, quartz, platine, violet, emeraude, fer, magma, boule, marron):
	_or += ore
	_argent += argent
	_quartz += quartz
	_platine += platine
	_violet += violet
	_emeraude += emeraude
	_fer += fer
	_magma += magma
	_boule += boule
	_marron += marron

func what_is_in_stock()->int:
	return _or + _argent + _quartz + _platine + _violet + _emeraude + _fer + _magma + _boule + _marron

func check_stock()->bool:
	if what_is_in_stock() == 10:
		return false
	else:
		return true

func get_or()->int:
	return _or

func get_argent()->int:
	return _argent

func get_quartz()->int:
	return _quartz

func get_platine()->int:
	return _platine

func get_violet()->int:
	return _violet

func get_emeraude()->int:
	return _emeraude

func get_fer()->int:
	return _fer

func get_magma()->int:
	return _magma

func get_boule()->int:
	return _boule

func get_marron()->int:
	return _marron
