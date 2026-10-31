extends Node2D

var player_health = 100
var enemy_health = 100
var damage = 10

func _ready():
    print("SHELL KOMBAT READY!")
    print("PLAYER HP: ", player_health)
    print("ENEMY HP: ", enemy_health)

func player_attack():
    enemy_health -= damage
    enemy_health = max(enemy_health, 0)
    print("ENEMY HP: ", enemy_health)

    if enemy_health <= 0:
        print("PLAYER WINS!")

func enemy_attack():
    player_health -= damage
    player_health = max(player_health, 0)
    print("PLAYER HP: ", player_health)

    if player_health <= 0:
        print("ENEMY WINS!")

func block():
    damage = 5
    print("BLOCK!")

func stop_block():
    damage = 10
