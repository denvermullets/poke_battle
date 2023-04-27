extends Control

var stats: ClassStats: set = set_stats
@onready var health_bar := $HealthBar
@onready var level_label := $LevelLabel

func set_stats(value: ClassStats) -> void:
  stats = value
  connect_stats()

func update_level_label() -> void:
  level_label.text = 'level: ' + str(stats.level)

func connect_stats() -> void:
  if stats is ClassStats:
    stats.health_changed.connect(_on_stats_health_changed)
    stats.level_changed.connect(_on_stats_level_changed)
    health_bar.set_bar_value(stats.health, stats.max_health)
    update_level_label()
  else:
    return

func _on_stats_health_changed() -> void:
  health_bar.animate_bar(stats.health, stats.max_health)

func _on_stats_level_changed() -> void:
  update_level_label()