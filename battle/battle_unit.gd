extends Node2D
class_name BattleUnit

var turnStack: TurnStack = ReferenceStash.turnStack

func melee_attack(target: BattleUnit) -> void:
  turnStack.add_node(self)
  print("Attack")
  target.take_hit(self)
  turnStack.remove_node(self)

func take_hit(attacker: BattleUnit) -> void:
  # if we had a knockback animation it would trigger here, possibly
  turnStack.add_node(self)
  print("Taking hit")
  turnStack.remove_node(self)
