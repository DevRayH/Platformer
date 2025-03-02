extends Control

# Preloads the first scene
var first_level:PackedScene = preload("res://Levels/test_level.tscn")
# Preloads the credit scene
var credits_menu:PackedScene = preload("res://Scenes/credits_menu.tscn")

@onready var audio:AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	# Plays the wav file in the local AudioStreamPlayer
	audio.play()



# Start button loads the first scene into the scene tree and removes the main menu from the scene tree
func _on_start_b_pressed() -> void:
	GameMaster.scene_change.load_scene(first_level, GameMaster.obj_ref.scene_base)
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)


################### Add Instructions Menu ##################
func _on_instructions_b_pressed() -> void:
	pass # Replace with function body.


# Credits button loads credits menu into the scene tree and removes the main menu from the scene tree
func _on_credits_b_pressed() -> void:
	GameMaster.scene_change.load_scene(credits_menu, GameMaster.obj_ref.menu_base)
	GameMaster.scene_change.remove_scene(self, GameMaster.obj_ref.menu_base)
