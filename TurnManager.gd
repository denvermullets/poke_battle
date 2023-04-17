extends Resource
class_name TurnManager

enum { ALLY_TURN, ENEMY_TURN }

# setters and getters can handle preconfiguring value before being set
# or tweaking stuff so that it's right
var turn: int = ALLY_TURN:
  get:
    return turn
  set(value):
    turn = value
    match turn:
      ALLY_TURN:
        ally_turn_started.emit()
      ENEMY_TURN:
        enemy_turn_started.emit()


signal ally_turn_started()
signal ally_turn_ended()
signal enemy_turn_started()

func start() -> void:
  self.turn = ALLY_TURN

func advance_turn() -> void:
  # if value is 0, set to 1. if value is 1, set to 0 - binary operation
  self.turn = int(self.turn + 1) & 1
