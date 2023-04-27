extends Node2D

var turnManager: TurnManager = ReferenceStash.turnManager
var turnStack: TurnStack = ReferenceStash.turnStack

@onready var player_battle_unit: BattleUnit = $Player/PlayerBattleUnit
@onready var enemy_battle_unit: BattleUnit = $Enemy/EnemyBattleUnit
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer
@onready var player_battle_unit_info = $BattleUI/PlayerBattleUnitInfo
@onready var enemy_battle_unit_info = $BattleUI/EnemyBattleUnitInfo

func _ready():
  player_battle_unit_info.stats = player_battle_unit.stats
  enemy_battle_unit_info.stats = enemy_battle_unit.stats
  await animation_player.animation_finished
  turnManager.ally_turn_started.connect(_on_ally_turn_started)
  #  turnManager.ally_turn_ended.connect(_on_ally_turn_ended)
  turnManager.enemy_turn_started.connect(_on_enemy_turn_started)
  turnStack.turn_over.connect(_on_turn_over)

  turnManager.start()

func battle_won() -> void:
  timer.start(0.5)
  await timer.timeout
  var previous_level: int = player_battle_unit.stats.level
  player_battle_unit.stats.experience += 205
  if player_battle_unit.stats.level > previous_level:
    print('level up')
  timer.start(0.5)
  await timer.timeout


func _on_ally_turn_started() -> void:
  if is_instance_valid(player_battle_unit) == false or player_battle_unit.is_queued_for_deletion():
    return

  print('Ally turn started')
  timer.start(1.0)
  await timer.timeout
  player_battle_unit.melee_attack(player_battle_unit)

func _on_enemy_turn_started() -> void:
  if is_instance_valid(enemy_battle_unit) == false or enemy_battle_unit.is_queued_for_deletion():
    await battle_won()
    timer.start(1.0)
    await timer.timeout
    queue_free()
    return

  print("Enemy turn started")
  timer.start(1.0)
  await timer.timeout
  enemy_battle_unit.melee_attack(enemy_battle_unit)

func _on_turn_over() -> void:
  turnManager.advance_turn()

