extends Control


func _enter_tree() -> void:
	pass_references()


func pass_references():
	GameMaster.obj_ref.player_lives_label = $BoxContainer/GridContainer/LivesLabel
	GameMaster.obj_ref.score_lable = $BoxContainer/GridContainer/ScoreLabel
	GameMaster.obj_ref.info_menu = self
