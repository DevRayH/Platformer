extends Node
""" Singleton """

# Enemy movement and state script
var npc_object:NPC_Object = NPC_Object.new()

# References to active game objects
var obj_ref:Object_References = Object_References.new()

# Scene changing script
var scene_change:SceneChangeObject = SceneChangeObject.new()
