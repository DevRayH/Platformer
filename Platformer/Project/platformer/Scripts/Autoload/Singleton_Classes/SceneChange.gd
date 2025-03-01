extends Node

class_name SceneChangeObject

func load_scene(passedScene:PackedScene, passedParent:Node):
	var node = passedScene.instantiate()
	passedParent.add_child(node)


func remove_scene(passedScene, passedParent:Node):
	passedParent.remove_child(passedScene)
	passedScene.queue_free()
