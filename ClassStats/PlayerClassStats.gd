extends ClassStats
class_name PlayerClassStats

const MAX_EXPERIENCE := 100

# var stats: ClassStats: set = set_stats
var experience := 0: set = set_experience

func set_experience(value: int) -> void:
  experience = value
  while experience >= MAX_EXPERIENCE:
    experience = experience - MAX_EXPERIENCE
    level += 1