extends Node
""" Singleton """

# Enemy movement and state script
static var npc_object:NPC_Object = NPC_Object.new()

# References to active game objects
static var obj_ref:Object_References = Object_References.new()

# Scene changing script
static var scene_change:SceneChangeObject = SceneChangeObject.new()

# Game stats script
static  var game_stats:Game_Stats_Object = Game_Stats_Object.new()

# Player movements and state script
static var player_object:PlayerObject = PlayerObject.new()
