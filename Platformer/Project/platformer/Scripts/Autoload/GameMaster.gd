extends Node
""" Singleton """

var npc_object:NPC_Object = NPC_Object.new()

func _enter_tree() -> void:
	npc_object.tree = get_tree()
