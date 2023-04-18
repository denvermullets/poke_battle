# this class is basically 'The Stack in MTG'. each turn contains all the actions
# and we process them however we need to, could be first in last out, etc
extends Resource
class_name TurnStack

var active_nodes: Array[BattleUnit] = []

signal turn_over

func add_node(node: Node) -> void:
  active_nodes.append(node)

func remove_node(node: Node) -> void:
  active_nodes.erase(node)
  if active_nodes.is_empty(): turn_over.emit()
