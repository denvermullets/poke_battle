extends TextureRect

@onready var actual_value = $ActualValue

signal animation_finished

var bar_value: float = 0.0

func _ready():
  await animate_bar(95, 100)
  await animate_bar(75, 100)
  await animate_bar(25, 100)
  await animate_bar(75, 100)
  await animate_bar(15, 100)
  await animate_bar(50, 100)


func set_bar_value(value: float, max_value: float) -> void:
  bar_value = (value / max_value) * 100.0

func set_value(value: float, max_value: float) -> void:
  set_bar_value(value, max_value)
  actual_value.value = bar_value

func animate_bar(value: float, max_value: float, duration: float = 1.0) -> void:
  var previous_value = bar_value
  set_bar_value(value, max_value)
  var tween := create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
  tween.tween_property(actual_value, 'value', bar_value, duration).from_current()
  await tween.finished
  animation_finished.emit()
