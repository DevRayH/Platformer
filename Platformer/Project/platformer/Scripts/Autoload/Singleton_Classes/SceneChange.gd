extends Node

class_name SceneChangeObject

# Instaciates the passed scene and adds it to the passed parent node
func load_scene(passedScene:PackedScene, passedParent:Node):
	var node = passedScene.instantiate()
	passedParent.add_child(node)


# Removes the passed scene from the passed parent node and ques it for deletion
func remove_scene(passedScene:Node, passedParent:Node):
	passedParent.remove_child(passedScene)
	passedScene.queue_free()
	
# Instanciates the passed NPC scene, adds it to the current active scene tree
# and moves it to the passed target
func npc_loading(passedScene:PackedScene, passedParent:Node, passedPosition:Vector2):
	var node:CharacterBody2D = passedScene.instantiate()
	passedParent.add_child(node)
	node.position = passedPosition
