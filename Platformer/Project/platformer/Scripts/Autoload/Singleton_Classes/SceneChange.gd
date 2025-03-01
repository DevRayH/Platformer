extends Node

class_name SceneChangeObject

func load_scene(passedScene:PackedScene, passedParent:Node):
	var node = passedScene.instantiate()
	passedParent.add_child(node)


func remove_scene(passedScene:Node, passedParent:Node):
	passedParent.remove_child(passedScene)
	passedScene.queue_free()
	
func npc_loading(passedScene:PackedScene, passedParent:Node, passedPosition:Vector2):
	var node:CharacterBody2D = passedScene.instantiate()
	passedParent.add_child(node)
	node.position = passedPosition
