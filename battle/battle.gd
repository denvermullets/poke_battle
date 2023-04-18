extends Node2D

var turnManager: TurnManager = ReferenceStash.turnManager
var turnStack: TurnStack = ReferenceStash.turnStack

@onready var player_battle_unit: BattleUnit = $Player/PlayerBattleUnit
@onready var enemy_battle_unit: BattleUnit = $Enemy/EnemyBattleUnit
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
  # gd4 way of connecting signals vs gd3 - also had to be above the await call which makes
  # sense because the signal would need to be there before the async action is called
  turnManager.ally_turn_started.connect(_on_ally_turn_started)
  turnManager.enemy_turn_started.connect(_on_enemy_turn_started)

  # yield is now await in gd4
  await animation_player.animation_finished
  # once animation is done it'll start the turnManager
  turnManager.start()
  turnStack.turn_over.connect(_on_turn_stack_clear)

func _on_ally_turn_started() -> void:
  print('Ally turn started')
  player_battle_unit.melee_attack(player_battle_unit)
  timeout_and_advance()

func _on_enemy_turn_started() -> void:
  print("Enemy turn started")
  enemy_battle_unit.melee_attack(enemy_battle_unit)
  timeout_and_advance()

func timeout_and_advance() -> void:
  # just here to simulate the action of something happening
  timer.start(1.0)
  await timer.timeout

func _on_turn_stack_clear() -> void:
  turnManager.advance_turn()
