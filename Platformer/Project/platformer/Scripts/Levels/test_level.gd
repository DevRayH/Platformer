extends Node2D

var mushroom:PackedScene = preload("res://Scenes/mushroom.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ready_scene()


func ready_scene():
	GameMaster.scene_change.npc_loading(mushroom, self, get_tree().get_nodes_in_group("SpawnPoints")[0].position)


func _on_timer_timeout() -> void:
	GameMaster.scene_change.npc_loading(mushroom, self, get_tree().get_nodes_in_group("SpawnPoints")[0].position)
