extends Node2D

var turnManager: TurnManager = ReferenceStash.turnManager

@onready var player_battle_unit: BattleUnit = $Player/PlayerBattleUnit
@onready var enemy_battle_unit: BattleUnit = $Enemy/EnemyBattleUnit
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
  # yield is now await in gd4
  await animation_player.animation_finished
  # once animation is done it'll run .melee_attack()
  player_battle_unit.melee_attack()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
