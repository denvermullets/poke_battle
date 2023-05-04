extends HBoxContainer

enum { FIRE, LIGHT, DRAIN }

@onready var fireball_button = $"%FireballButton"
@onready var lighting_button = $"%LightningButton"
@onready var drain_button = $"%DrainButton"

signal menu_option_selected(option)

func grab_fireball_focus() -> void:
  fireball_button.grab_focus()

func _on_fireball_button_button_down():
  emit_signal('menu_option_selected', FIRE)
  print('fireball')

func _on_drain_button_button_down():
  emit_signal('menu_option_selected', DRAIN)
  print('drain')

func _on_lightning_button_button_down():
  emit_signal('menu_option_selected', LIGHT)
  print('lightning')
