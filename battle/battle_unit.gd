extends Node2D
class_name BattleUnit

var turnStack: TurnStack = ReferenceStash.turnStack
@export var stats: Resource

func deal_damage(target: BattleUnit) -> void:
  var target_defense = (1 - target.stats.defense * 0.05)
  var damage = ((stats.level * 3 + target_defense) / 2) * (stats.attack / 5)
  print('damage dealt ', damage)
  target.stats.health -= damage
  print('health remaining ', target.stats.health)

func melee_attack(target: BattleUnit) -> void:
  turnStack.add_node(self)
  # do stuff \\\\\
  print("Attack")
  deal_damage(target)
  target.take_hit(self)
  # do stuff \\\\\
  turnStack.remove_node(self)

func take_hit(attacker: BattleUnit) -> void:
  turnStack.add_node(self)
  # do stuff \\\\\
  print("Taking hit")
  if stats.health == 0:
    queue_free()
    return
  # do stuff \\\\\
  turnStack.remove_node(self)

func _exit_tree() ->void:
  turnStack.remove_node(self)
