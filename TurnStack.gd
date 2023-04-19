# this class is basically 'The Stack in MTG'. each turn contains all the actions
# and we process them however we need to, could be first in last out, etc
extends Resource
class_name TurnStack

signal turn_over

var active_nodes: Array[BattleUnit] = []

func add_node(node: BattleUnit) -> void:
  print('add node')
  active_nodes.append(node)

func remove_node(node: BattleUnit) -> void:
  if active_nodes.is_empty(): return

  print('removing node')
  active_nodes.erase(node)

  if active_nodes.is_empty():
    print('removed node and turn is over')
#    turn_over.emit('turn_over')
    emit_signal('turn_over')

