extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var ressources : Ressources
var stock : Stock

# Called when the node enters the scene tree for the first time.
func _ready():
	ressources = Ressources.new()
	stock = Stock.new(10)
	get_node("./music").play()
	$Player/Camera2D/Control/Quest/TextureProgress.set_value(0)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Player/Camera2D/Control/Quest2/TextureProgress.get_value() == 50:
		get_tree().quit()
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_Player_coli(coli):
	if coli.collider is TileMap:
		var tile_pos = coli.collider.world_to_map($Player.position)
		tile_pos -= coli.normal
		var tile = coli.collider.get_cellv(tile_pos)
		if tile == 3 and ressources.all_empty() == false: #kart
			stock.set_stock(ressources.get_or(), ressources.get_argent(), ressources.get_quartz(), ressources.get_platine(), ressources.get_violet(), ressources.get_emeraude(), ressources.get_fer(), ressources.get_magma(), ressources.get_boule(), ressources.get_marron())
			$Player/Camera2D/Control/Quest2/TextureProgress.set_value(stock.what_is_in_stock())
			ressources.clear_stock()
		if tile == 12 and ressources.check_pocket() == true: #quartz
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_quartz(ressources.get_quartz() + 1)
			$Player/Camera2D/Control/Counters/quartz/Label.set_text(str(ressources.get_quartz()))
		if tile == 16 and ressources.check_pocket() == true: #platine
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_platine(ressources.get_platine() + 1)
			$Player/Camera2D/Control/Counters/platine/Label.set_text(str(ressources.get_platine()))
		if tile == 8 and ressources.check_pocket() == true: #or
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_or(ressources.get_or() + 1)
			$Player/Camera2D/Control/Counters/gold/Label.set_text(str(ressources.get_or()))
		if tile == 9 and ressources.check_pocket() == true: #argent
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_argent(ressources.get_argent() + 1)
			$Player/Camera2D/Control/Counters/sivler/Label.set_text(str(ressources.get_argent()))
		if tile == 10 and ressources.check_pocket() == true: #violet
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_violet(ressources.get_violet() + 1)
			$Player/Camera2D/Control/Counters/amethyst/Label.set_text(str(ressources.get_violet()))
		if tile == 13 and ressources.check_pocket() == true: #emeraude
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_emeraude(ressources.get_emeraude() + 1)
			$Player/Camera2D/Control/Counters/plant/Label.set_text(str(ressources.get_emeraude()))
		if tile == 14 and ressources.check_pocket() == true: #fer
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_fer(ressources.get_fer() + 1)
			$Player/Camera2D/Control/Counters/iron/Label.set_text(str(ressources.get_fer()))
		if tile == 15 and ressources.check_pocket() == true: #magma
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_magma(ressources.get_magma() + 1)
			$Player/Camera2D/Control/Counters/lava/Label.set_text(str(ressources.get_magma()))
		if tile == 11 and ressources.check_pocket() == true: #boule
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_boule(ressources.get_boule() + 1)
			$Player/Camera2D/Control/Counters/orange/Label.set_text(str(ressources.get_boule()))
		if tile == 17 and ressources.check_pocket() == true: #marron
			$Minerais.set_cellv(tile_pos, -1)
			ressources.set_marron(ressources.get_marron() + 1)
		$Player/Camera2D/Control/Quest/TextureProgress.set_value(ressources.what_is_in_pocket())
