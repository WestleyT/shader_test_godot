extends Node2D


#lower number = more pixelated
var pixelatedBase : int = 10
var pixelatedMax : int = 2000
export var pixelatedLevel : int = 10
var pixChngAmnt : int = 30

var picIndex : int = 0

onready var levelLabel = $GUI/VBoxContainer/LabelHbox/Label
onready var diffLabel = $GUI/VBoxContainer/LabelHbox/Label2

onready var imgMat = $Image.material

var picArray = [
	'Mario64.jpg',
	'halo1.png',
	'crashbandicoot.jpg',
	'bioshock.jpg',
	'marioparty.jpg',
	'halflife2.jpg',
	'mrspacman.jpg',
	'tetris.png',
	'sonic2.jpg',
	'fallout3.jpg',
	'pokemon.jpg',
	'ocarina.jpg',
	'streetfighter2.jpg',
	'angrybirds.png',
	'wow.png',
	'flappybird.jpg',
	'minecraft.png',
	'portal.jpg',
	'smashmelee.jpg',
	'mariokart.jpg',
	'doom.jpg',
	'cod.jpg',
	'supermetroid.jpg',
	'AC2.jpg',
	'sims3.jpg'
]

# Called when the node enters the scene tree for the first time.
func _ready():
	imgMat.set_shader_param('amount', pixelatedLevel)
	updateLabels()


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
func changeImage():
	var path = load('res://Images/GameImages/' + picArray[picIndex])
	$Image.set_texture(path)
	pixelatedLevel = pixelatedBase
	imgMat.set_shader_param('amount', pixelatedLevel)
	
func updateLabels():
	levelLabel.text = 'Level ' +  str(picIndex + 1) + ' - ' + str(picArray.size())
	


func _on_Next_pressed():
	if picIndex + 1 < picArray.size():
		picIndex += 1
		updateLabels()
		changeImage()


func _on_Prev_pressed():
	if picIndex - 1 >= 0:
		picIndex -= 1
		updateLabels()
		changeImage()


func _on_Down_pressed():
	if pixelatedLevel / 2 >= pixelatedBase:
		pixelatedLevel /= 2
		imgMat.set_shader_param('amount', pixelatedLevel)


func _on_Up_pressed():
	if pixelatedLevel * 2 <= pixelatedMax:
		pixelatedLevel *= 2
		imgMat.set_shader_param('amount', pixelatedLevel)
