
extends Node2D

var player_health = 100
var enemy_health = 100
var damage = 10
var is_blocking = false

var player_label
var enemy_label
var message_label

func _ready():
    create_arena()
    update_health()

func create_arena():
    var floor = ColorRect.new()
    floor.color = Color("#29202b")
    floor.position = Vector2(0, 560)
    floor.size = Vector2(1280, 160)
    floor.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(floor)

    create_fighter("LEO", Color("#2878d0"), Vector2(280, 300))
    create_fighter("ENEMY", Color("#d83232"), Vector2(850, 300))

    player_label = create_label("PLAYER HP: 100", Vector2(50, 40), 28)
    enemy_label = create_label("ENEMY HP: 100", Vector2(900, 40), 28)
    message_label = create_label("FIGHT!", Vector2(500, 120), 42)

    create_button("PUNCH", Vector2(900, 590), player_attack)
    create_button("BLOCK", Vector2(1050, 590), block)
    create_button("RELEASE", Vector2(1050, 650), stop_block)
    create_button("ENEMY ATTACK", Vector2(700, 590), enemy_attack)

func create_fighter(fighter_name, fighter_color, pos):
    var body = ColorRect.new()
    body.color = fighter_color
    body.position = pos
    body.size = Vector2(110, 220)
    add_child(body)

    var label = create_label(fighter_name, pos + Vector2(-20, 230), 24)

func create_label(text_value, pos, font_size):
    var label = Label.new()
    label.text = text_value
    label.position = pos
    label.add_theme_font_size_override("font_size", font_size)
    label.add_theme_color_override("font_color", Color.WHITE)
    add_child(label)
    return label

func create_button(text_value, pos, action):
    var btn = Button.new()
    btn.text = text_value
    btn.position = pos
    btn.size = Vector2(140, 50)
    btn.pressed.connect(action)
    add_child(btn)

func update_health():
    if player_label:
        player_label.text = "PLAYER HP: " + str(player_health)
    if enemy_label:
        enemy_label.text = "ENEMY HP: " + str(enemy_health)

func player_attack():
    if enemy_health <= 0 or player_health <= 0:
        return

    enemy_health = max(enemy_health - damage, 0)
    update_health()

    if enemy_health <= 0:
        message_label.text = "PLAYER WINS!"

func enemy_attack():
    if enemy_health <= 0 or player_health <= 0:
        return

    var actual_damage = 5 if is_blocking else damage
    player_health = max(player_health - actual_damage, 0)
    update_health()

    if player_health <= 0:
        message_label.text = "ENEMY WINS!"

func block():
    is_blocking = true
    message_label.text = "BLOCK!"

func stop_block():
    is_blocking = false
    message_label.text = "FIGHT!"
