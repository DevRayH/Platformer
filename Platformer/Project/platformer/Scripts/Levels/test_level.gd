extends Node2D

var mushroom:PackedScene = preload("res://Scenes/mushroom.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ready_scene()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func ready_scene():
	var node = mushroom.instantiate()
	self.add_child(node)
	node.position = get_tree().get_nodes_in_group("SpawnPoints")[0].position
