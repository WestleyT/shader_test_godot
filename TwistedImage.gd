extends Node2D


var power = 5.0
var modifier = 0.5
onready var spriteMaterial = $Sprite.material

export var width = 350
var height

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	height = width * 1.5
	spriteMaterial.set_shader_param('effectPower', power)
	sizeSprite()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (power > 0 && paused == false):
		var powerDiff = 1 * delta
		power -= powerDiff * modifier
		if (power < 0):
			power = 0
			
		spriteMaterial.set_shader_param('effectPower', power)



func _on_playpause_toggled(button_pressed):
	paused = button_pressed
	
	if (button_pressed):
		$GUI/VBoxContainer/HBoxContainer/playpause.text = 'Play'
	else: 
		$GUI/VBoxContainer/HBoxContainer/playpause.text = 'Pause'


func _on_reveal_pressed():
	power = 0
	spriteMaterial.set_shader_param('effectPower', power)

func sizeSprite():
	var sizeTo = Vector2(width, height)
	var size = $Sprite.texture.get_size()
	var scaleFactor = sizeTo / size
	$Sprite.set_scale(scaleFactor)
	
func _on_button_pressed(imageCode):
	var imageName
	match imageCode:
		'1':
			imageName = 'jason_vorhees'
		'2':
			imageName = 'dracula-1931'
		'3':
			imageName = 'THE-EXORCIST-1973'
		'4':
			imageName = 'The-Babadook'
		'5':
			imageName = 'Freddy_Kruger'
		'6':
			imageName = 'frankenstein-1931'
		'7':
			imageName = 'ghostface'
		'8':
			imageName = 'Leatherface'
		'9':
			imageName = 'jigsaw'
		'10':
			imageName = 'alien-film'
		'11':
			imageName = 'chucky-doll'
		'12':
			imageName = 'phantom_of_the_opera'
		'13':
			imageName = 'silence-lambs-mgm'
		'14':
			imageName = 'mike_meyers'
		'15':
			imageName = 'creature_from_the_black_lagoon'
		'16':
			imageName = 'pennywise'
		'17':
			imageName = 'norman_bates'
		'18':
			imageName = 'pinhead'
			
	var path = load('res://Images/' + imageName + '.jpg')
	$Sprite.set_texture(path)



func _on_Sprite_texture_changed():
	sizeSprite()
	power = 5.0
	spriteMaterial.set_shader_param('effectPower', power)
