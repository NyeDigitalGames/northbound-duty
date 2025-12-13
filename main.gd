extends Control

@onready var background: TextureRect = $Background
@onready var speaker_label: Label = $Dialog/VBoxContainer/MarginContainer/PanelContainer/Label
@onready var north_button: Button = $Dialog/VBoxContainer/Spacer/NorthButton
@onready var dialog_container: PanelContainer = $Dialog/VBoxContainer/MarginContainer/DialogContainer
@onready var next_button: Button = $Dialog/VBoxContainer/MarginContainer/NextButton
@onready var v_box_choices: VBoxContainer = $Dialog/VBoxContainer/Choices/VBoxChoices
@onready var choice_1: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice1
@onready var choice_2: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice2
@onready var choice_3: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice3

@export var encounters : Array[Node]

#Animating Snow Wind
var current_wind: float = 0.0
var target_wind: float = 0.0
var wind_offset: float = 0.0
var current_snow_speed: float = 0.5
@export var wind_response: float = 3.0  # higher = reacts faster
@export var wind_scale: float = 0.5     # matches your old "* 0.5"
@export var snow_speed: float = 0.5     # should match the shader 'speed' uniform if you change it

func _ready() -> void:
	# Play menu music
	if AudioManager:
		AudioManager.play_music()
	speaker_label.text = ''
	north_button.visible=false
	dialog_container.visible=false
	v_box_choices.visible=false
	GameManager.reset_values()
	start_game()
	
func start_game() -> void:
	for i in encounters.size():
		encounters[i].run()
		await encounters[i].dialog_done
	
func change_snow(wind_speed: float = 0.5) -> void:
	target_wind = wind_speed


func _process(delta: float) -> void:
	# Smoothly approach target wind (exponential smoothing)
	current_wind = lerp(current_wind, target_wind, 1.0 - exp(-wind_response * delta))

	# Integrate wind into a persistent offset (this is the key)
	wind_offset += (-current_wind) * snow_speed * wind_scale * delta

	background.material.set_shader_parameter("wind", current_wind)           # optional
	background.material.set_shader_parameter("wind_offset", wind_offset)    # required

func change_snow_layers(layers : int = 40) -> void:
	var tween = create_tween()
	tween.tween_property(background.material,"shader_parameter/num_of_layers",layers,10)
	#background.material.set_shader_parameter("num_of_layers", layers)
	pass

func change_snow_speed(speed : float = 0.5) -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_method(change_shader_speed,current_snow_speed,speed,10)
	await tween.finished
	current_snow_speed = speed
	#background.material.set_shader_parameter("num_of_layers", layers)
	pass

func change_shader_speed(speed : float = 0.5) -> void:
	background.material.set_shader_parameter("speed", speed)
	pass
