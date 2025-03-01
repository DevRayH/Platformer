extends Control

var first_level:PackedScene = preload("res://Levels/test_level.tscn")



func _on_start_b_pressed() -> void:
	GameMaster.scene_change.load_scene(first_level, GameMaster.obj_ref.scene_base)
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)


func _on_instructions_b_pressed() -> void:
	pass # Replace with function body.


func _on_credits_b_pressed() -> void:
	pass # Replace with function body.
