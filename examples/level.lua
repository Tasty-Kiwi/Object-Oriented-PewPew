require("/dynamic/oop.lua")

local level_size = oop.Vector2(750fx, 600fx)
oop.set_size(level_size)

local bg = oop.CustomizableEntity(oop.Vector2(level_size.x / 2fx, level_size.y / 2fx))
bg:set_mesh("/dynamic/graphics.lua", 0)

local ship = oop.Ship(oop.Vector2(level_size.x / 2fx, level_size.y / 2fx), 0)
ship:configure({ shield = 5 })

local weapon_config = oop.Weapon(pewpew.CannonFrequency.FREQ_30, pewpew.CannonType.TRIPLE)
ship:configure_weapon(weapon_config)

local time = 0
pewpew.add_update_callback(function()
  if ship:get_config().has_lost then
    pewpew.stop_game()
  else
    time = time + 1
    if time % 5 == 0 then
      oop.Crowder(oop.Vector2(fmath.random_fixedpoint(0fx, level_size.x), fmath.random_fixedpoint(0fx, level_size.y)))
    end
  end
end)

pewpew.print_debug_info()