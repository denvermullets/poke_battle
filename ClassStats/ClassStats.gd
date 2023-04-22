extends Resource
class_name ClassStats

@export var name: String
@export var attack: int
@export var defense: int
@export var speed: int
@export var max_health: int: set = set_max_health

# currently not being used
@export var battle_animations: PackedScene

signal health_changed
signal max_health_changed
signal no_health

var level := 1
var health := 1:
  get:
    return health
  set(value):
    # kinda dumb you can't type the value in a setter func
    health = clamp(value, 0, max_health)
    emit_signal('health_changed')
    if health == 0: emit_signal('no_health')

func _init() -> void:
  self.health = max_health

func set_max_health(value: int) -> void:
  max_health = value
  health = max_health
  emit_signal('max_health_changed')
