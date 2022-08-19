require "/dynamic/oop.lua"
import Vector2, Mesh, Weapon from oop

fx = (num) ->
  fmath.to_fixedpoint(num)

class Vector2fx extends oop.Vector2
  new: (x, y) =>
    super fx(x), fx(y)

level_size = Vector2fx(750, 600) 
oop.set_size(level_size)

bg = oop.CustomizableEntity(Vector2(level_size.x / fx(2), level_size.y / fx(2)))
bg\set_mesh("/dynamic/graphics.lua", 0)

ship = oop.Ship(Vector2(level_size.x / fx(2), level_size.y / fx(2)), 0)

ship\configure { shield: 3 }

weapon_config = Weapon(pewpew.CannonFrequency.FREQ_10, pewpew.CannonType.DOUBLE)
ship\configure_weapon weapon_config

pewpew.add_update_callback ->
  if ship\get_config().is_lost
    pewpew.stop_game()
  else
    time += 1
    if time % 5 == 0
      oop.Crowder(Vector2(fmath.random_fixedpoint(fx(0), level_size.x), fmath.random_fixedpoint(fx(0), level_size.y)))

pewpew.print_debug_info!
