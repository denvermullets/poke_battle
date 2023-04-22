extends Node2D

var turnManager: TurnManager = ReferenceStash.turnManager
var turnStack: TurnStack = ReferenceStash.turnStack

@onready var player_battle_unit: BattleUnit = $Player/PlayerBattleUnit
@onready var enemy_battle_unit: BattleUnit = $Enemy/EnemyBattleUnit
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

func _ready():
  await animation_player.animation_finished
  turnManager.ally_turn_started.connect(_on_ally_turn_started)
  #  turnManager.ally_turn_ended.connect(_on_ally_turn_ended)
  turnManager.enemy_turn_started.connect(_on_enemy_turn_started)
  turnStack.turn_over.connect(_on_turn_over)

  turnManager.start()

func _on_ally_turn_started() -> void:
  print('Ally turn started')
  timer.start(1.0)
  await timer.timeout
  player_battle_unit.melee_attack(player_battle_unit)

func _on_enemy_turn_started() -> void:
  print("Enemy turn started")
  timer.start(1.0)
  await timer.timeout
  enemy_battle_unit.melee_attack(enemy_battle_unit)

func _on_turn_over() -> void:
  print('turn over')
  turnManager.advance_turn()

