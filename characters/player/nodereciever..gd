extends Node2D

signal text_moment(parent,pos)
@onready var inventory = $player/inventory/HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_text_moment(parent: Variant,pos: Variant) -> void:
	emit_signal("text_moment",parent,pos)
