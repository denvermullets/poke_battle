extends Node2D
class_name BattleUnit

var turnStack: TurnStack = ReferenceStash.turnStack
@export var stats: Resource

func melee_attack(target: BattleUnit) -> void:
  turnStack.add_node(self)
  # do stuff \\\\\
  print("Attack")
  target.take_hit(self)
  # do stuff \\\\\
  turnStack.remove_node(self)

func take_hit(attacker: BattleUnit) -> void:
  turnStack.add_node(self)
  # do stuff \\\\\
  print("Taking hit")
  # do stuff \\\\\
  turnStack.remove_node(self)
