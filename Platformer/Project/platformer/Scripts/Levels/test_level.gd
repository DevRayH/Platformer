extends Node2D

# Preloads the mushroom NPC scene
var mushroom:PackedScene = preload("res://Scenes/mushroom.tscn")
var player_scene:PackedScene = preload("res://Scenes/player.tscn")

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ready_scene()

# Plays the wav file in the local AudioStreamPlayer and loads the NPC mushroom scene into the scene tree.
func ready_scene():
	audio.play()
	GameMaster.scene_change.npc_loading(mushroom, self, get_tree().get_nodes_in_group("SpawnPoints")[0].position)


# On Time out loads a new NPC mushroom into the scene tree
func _on_timer_timeout() -> void:
	GameMaster.scene_change.npc_loading(mushroom, self, get_tree().get_nodes_in_group("SpawnPoints")[0].position)
	
	if GameMaster.obj_ref.current_player == null:
		GameMaster.game_stats.player_lives(player_scene, self)
