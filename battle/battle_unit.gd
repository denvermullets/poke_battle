extends Node2D
class_name BattleUnit

var turnStack: TurnStack = ReferenceStash.turnStack
@export var stats: Resource

func deal_damage(target: BattleUnit) -> void:
  var target_defense = (1 - target.stats.defense * 0.05)
  var damage = ((stats.level * 3 + target_defense) / 2) * (stats.attack / 5)
  target.stats.health -= damage

func melee_attack(target: BattleUnit) -> void:
  turnStack.add_node(self)
  deal_damage(target)
  target.take_hit(self)
  turnStack.remove_node(self)

func take_hit(_attacker: BattleUnit) -> void:
  turnStack.add_node(self)

  if stats.health == 0:
    turnStack.remove_node(self)
    queue_free()
    return

  turnStack.remove_node(self)
