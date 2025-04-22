extends Node

var explosion_sound: AudioStreamPlayer

func _ready():
	enable_raytracing()
	explosion_sound = AudioStreamPlayer.new()
	explosion_sound.stream = load('res://assets/ultrahdgraphics/realistic_explosion.mp3')
	add_child(explosion_sound)

func enable_raytracing():
	var canvas_layer := CanvasLayer.new()
	add_child(canvas_layer)
	var realistic_lighting := TextureRect.new()
	realistic_lighting.texture = load('res://assets/ultrahdgraphics/realistic_lighting.png')
	canvas_layer.add_child(realistic_lighting)
	
func simulate_explosion(of: Node2D, size: Vector2 = Vector2(1, 1), simulation_accuracy: int = 1):
	for i in range(simulation_accuracy*100):
		var realistic_explosion := AnimatedSprite2D.new()
		realistic_explosion.sprite_frames = load('res://assets/ultrahdgraphics/realistic_explosion.tres')
		realistic_explosion.scale = size
		realistic_explosion.connect('animation_finished', realistic_explosion.queue_free)
		of.get_parent().add_child(realistic_explosion)
		realistic_explosion.global_position = of.global_position
		realistic_explosion.play('default')
		explosion_sound.play()
