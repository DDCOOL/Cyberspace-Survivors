extends CharacterBody2D

var player_health = 100
var player_firewall = 100
var speed: int = 300
var movement_input: Vector2
var mouse_position: Vector2
var atack_on_cooldown: bool = false

var is_in_cyberspace: bool = false

@onready var gun_sprite_rs: Sprite2D = $GunRealspace/Sprite2D
@onready var gun_sprite_cs: Sprite2D = $GunCyberspace/Sprite2D
@onready var player_sprite_realspace: AnimatedSprite2D = $PlayerSpriteRealspace
@onready var player_sprite_cyberspace: AnimatedSprite2D = $PlayerSpriteCyberspace
@onready var cyber_space_layer: Sprite2D = $"../CyberSpaceLayer"



@export var bullet_scene: PackedScene

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	#look_at(mouse_position)
	#use this to turn the player in the direction of the mouse
	#set rotation of sprite to 90 when used
	PlayerData.player_location = global_position
	PlayerData.crosshair_location = mouse_position
	PlayerData.player_health = player_health
	PlayerData.player_firewall = player_firewall
	PlayerData.is_in_cyberspace = is_in_cyberspace
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		$GunSound.play()
	if Input.is_action_just_pressed("damage_player_debug"):
		player_health -= 20
	if Input.is_action_just_pressed("damage_player_firewall_debug"):
		player_firewall -= 20
	if Input.is_action_just_pressed("cybermask_toggle"):
		toggle_player_appearance()

func _physics_process(_delta: float) -> void:
	movement_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement_input * speed
	move_and_slide()

func shoot():
	var bullet = bullet_scene.instantiate()
	get_tree().get_root().add_child(bullet)
	bullet.global_position = PlayerData.gun_position
	bullet.aim((PlayerData.crosshair_location - global_position).normalized())

func toggle_player_appearance():
	if !is_in_cyberspace:
		cyber_space_layer.visible = true
		is_in_cyberspace = true
		player_sprite_realspace.visible = false
		player_sprite_cyberspace.visible = true
		gun_sprite_rs.visible = false
		gun_sprite_cs.visible = true
	else:
		is_in_cyberspace = false
		cyber_space_layer.visible = false
		player_sprite_realspace.visible = true
		player_sprite_cyberspace.visible = false
		gun_sprite_rs.visible = true
		gun_sprite_cs.visible = false
