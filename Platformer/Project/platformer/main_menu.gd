extends Control

var first_level:PackedScene = preload("res://Levels/test_level.tscn")



func _on_start_b_pressed() -> void:
	var node:Node2D = first_level.instantiate()
	GameMaster.obj_ref.scene_base.add_child(node)
	GameMaster.obj_ref.menu_base.remove_child(self)
	self.queue_free()


func _on_instructions_b_pressed() -> void:
	pass # Replace with function body.


func _on_credits_b_pressed() -> void:
	pass # Replace with function body.
