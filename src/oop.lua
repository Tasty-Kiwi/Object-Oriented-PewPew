-- Compiled version of oop.moon
pewpew.print("Powered by Object Oriented PewPew, v0.1")
oop = { }
oop.set_size = function(size)
  return pewpew.set_level_size(size.x, size.y)
end
do
  local _class_0
  local _base_0 = { }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x = x
      self.y = y
    end,
    __base = _base_0,
    __name = "Vector2"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  oop.Vector2 = _class_0
end
do
  local _class_0
  local _parent_0 = oop.Vector2
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, x, y, z)
      _class_0.__parent.__init(self, x, y)
      self.z = z
    end,
    __base = _base_0,
    __name = "Vector3",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Vector3 = _class_0
end
do
  local _class_0
  local _base_0 = { }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, frequency, cannon, duration)
      self.frequency = frequency
      self.cannon = cannon
      self.duration = duration
    end,
    __base = _base_0,
    __name = "Weapon"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  oop.Weapon = _class_0
end
local Entity
do
  local _class_0
  local _base_0 = {
    get_pos = function(self)
      local x, y = pewpew.entity_get_position(self.entity_id)
      return Vector2(x, y)
    end,
    set_pos = function(self, vector)
      return pewpew.entity_set_position(self.entity_id, vector.x, vector.y)
    end,
    is_alive = function(self)
      return pewpew.entity_get_is_alive(self.entity_id)
    end,
    is_started_to_be_destroyed = function(self)
      return pewpew.entity_get_is_started_to_be_destroyed(self.entity_id)
    end,
    set_radius = function(self, radius)
      return pewpew.entity_set_radius(self.entity_id, radius)
    end,
    set_callback = function(self, callback)
      return pewpew.entity_set_update_callback(self.entity_id, callback)
    end,
    destroy = function(self)
      return pewpew.entity_destroy(self.entity_id)
    end,
    react_to_weapon = function(self, weapon)
      return pewpew.entity_react_to_weapon(self.entity_id, weapon)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.entity_id = nil
      self.type = nil
    end,
    __base = _base_0,
    __name = "Entity"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Entity = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = {
    configure = function(self, config)
      return pewpew.configure_player(self.player_index, config)
    end,
    configure_hud = function(self, config)
      return pewpew.configure_player_hud(self.player_index, config)
    end,
    get_config = function(self)
      return pewpew.get_player_configuration(self.player_index)
    end,
    configure_weapon = function(self, weapon)
      return pewpew.configure_player_ship_weapon(self.entity_id, {
        frequency = weapon.frequency,
        cannon = weapon.cannon,
        duration = weapon.duration
      })
    end,
    add_damage = function(self, damage)
      return pewpew.add_damage_to_player_ship(self.entity_id, damage)
    end,
    make_transparent = function(self, duration)
      return pewpew.make_player_ship_transparent(self.entity_id, duration)
    end,
    set_speed = function(self, factor, offset, duration)
      return pewpew.set_player_ship_speed(self.entity_id, factor, offset, duration)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, player_int)
      _class_0.__parent.__init(self)
      self.player_index = player_int
      self.entity_id = pewpew.new_player_ship(pos.x, pos.y, self.player_index)
      self.type = pewpew.EntityType.SHIP
    end,
    __base = _base_0,
    __name = "Ship",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Ship = _class_0
end
do
  local _class_0
  local _base_0 = {
    remove = function(self)
      return pewpew.remove_arrow_from_player_ship(self.ship_id, self.arrow_id)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, ship_object, target_object, color)
      self.ship_id = ship_object.entity_id
      self.arrow_id = pewpew.add_arrow_to_player_ship(self.ship_id, target_object.entity_id, color)
    end,
    __base = _base_0,
    __name = "ShipArrow"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  oop.ShipArrow = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_crowder(pos.x, pos.y)
      self.type = pewpew.EntityType.CROWDER
    end,
    __base = _base_0,
    __name = "Crowder",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Crowder = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_wary(pos.x, pos.y)
      self.type = pewpew.EntityType.WARY
    end,
    __base = _base_0,
    __name = "Wary",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Wary = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_asteroid(pos.x, pos.y)
      self.type = pewpew.EntityType.ASTEROID
    end,
    __base = _base_0,
    __name = "Asteroid",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Asteroid = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = {
    enable_collisions = function(self, is_collide_with_walls)
      return pewpew.ufo_set_enable_collisions_with_walls(self.entity_id, is_collide_with_walls)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, dx)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_ufo(pos.x, pos.y, dx)
      self.type = pewpew.EntityType.UFO
    end,
    __base = _base_0,
    __name = "Ufo",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Ufo = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = {
    enable_collisions = function(self, is_collide_with_walls)
      return pewpew.rolling_cube_set_enable_collisions_with_walls(self.entity_id, is_collide_with_walls)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_rolling_cube(pos.x, pos.y)
      self.type = pewpew.EntityType.UFO
    end,
    __base = _base_0,
    __name = "RollingCube",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.RollingCube = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, angle, ship_object)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_player_bullet(pos.x, pos.y, angle, ship_object.player_index)
    end,
    __base = _base_0,
    __name = "PlayerBullet",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.PlayerBullet = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, bomb_type)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_bomb(pos.x, pos.y, bomb_type)
      self.type = pewpew.EntityType.BOMB
    end,
    __base = _base_0,
    __name = "Bomb",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Bomb = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, acceleration, angle)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_inertiac(pos.x, pos.y, acceleration, angle)
      self.type = pewpew.EntityType.INERTIAC
    end,
    __base = _base_0,
    __name = "Inertiac",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Inertiac = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, mothership_type, angle)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_mothership(pos.x, pos.y, mothership_type, angle)
      self.type = pewpew.EntityType.MOTHERSHIP
      self.mothership_type = mothership_type
    end,
    __base = _base_0,
    __name = "Mothership",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Mothership = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, angle, speed, lifetime)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_baf(pos.x, pos.y, angle, speed, lifetime)
      self.type = pewpew.EntityType.BAF
    end,
    __base = _base_0,
    __name = "Baf",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.Baf = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, angle, speed, lifetime)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_baf_blue(pos.x, pos.y, angle, speed, lifetime)
      self.type = pewpew.EntityType.BAF_BLUE
    end,
    __base = _base_0,
    __name = "BafBlue",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.BafBlue = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos, angle, speed, lifetime)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_baf_red(pos.x, pos.y, angle, speed, lifetime)
      self.type = pewpew.EntityType.BAF_RED
    end,
    __base = _base_0,
    __name = "BafRed",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.BafRed = _class_0
end
do
  local _class_0
  local _parent_0 = Entity
  local _base_0 = {
    set_mesh = function(self, mesh_path, mesh_index)
      return pewpew.customizable_entity_set_mesh(self.entity_id, mesh_path, mesh_index)
    end,
    set_pos_interpolation = function(self, is_enabled)
      return pewpew.customizable_entity_set_position_interpolation(self.entity_id, is_enabled)
    end,
    set_flipping_meshes = function(self, mesh_path, index_0, index_1)
      return pewpew.customizable_entity_set_flipping_meshes(self.entity_id, mesh_path, index_0, index_1)
    end,
    set_mesh_color = function(self, color)
      return pewpew.customizable_entity_set_mesh_color(self.entity_id, color)
    end,
    set_string = function(self, text)
      return pewpew.customizable_entity_set_mesh_color(self.entity_id, text)
    end,
    set_mesh_pos = function(self, pos)
      return pewpew.customizable_entity_set_mesh_xyz(self.entity_id, pos.x, pos.y, pos.z)
    end,
    set_mesh_z = function(self, z)
      return pewpew.customizable_entity_set_mesh_z(self.entity_id, z)
    end,
    set_mesh_scale = function(self, scale)
      return pewpew.customizable_entity_set_mesh_scale(self.entity_id, scale)
    end,
    set_mesh_xyz_scale = function(self, scale)
      return pewpew.customizable_entity_set_mesh_xyz_scale(self.entity_id, scale.x, scale.y, scale.z)
    end,
    set_mesh_angle = function(self, angle, axis)
      return pewpew.customizable_entity_set_mesh_angle(self.entity_id, angle, axis.x, axis.y, axis.z)
    end,
    skip_mesh_attributes_interpolation = function(self)
      return pewpew.customizable_entity_skip_mesh_attributes_interpolation(self.entity_id)
    end,
    configure_music_response = function(self, config)
      return pewpew.customizable_entity_configure_music_response(self.entity_id, config)
    end,
    add_rotation_to_mesh = function(self, angle, axis)
      return pewpew.customizable_entity_add_rotation_to_mesh(self.entity_id, angle, axis.x, axis.y, axis.z)
    end,
    set_visibility_radius = function(self, radius)
      return pewpew.customizable_entity_set_visibility_radius(self.entity_id, radius)
    end,
    configure_wall_collision = function(self, is_collide_with_walls, callback)
      return pewpew.customizable_entity_configure_wall_collision(self.entity_id, is_collide_with_walls, callback)
    end,
    set_player_collision_callback = function(self, callback)
      return pewpew.customizable_entity_set_player_collision_callback(self.entity_id, callback)
    end,
    set_weapon_collision_callback = function(self, callback)
      return pewpew.customizable_entity_set_weapon_collision_callback(self.entity_id, callback)
    end,
    start_spawning = function(self, duration)
      return pewpew.customizable_entity_start_spawning(self.entity_id, duration)
    end,
    start_exploding = function(self, duration)
      return pewpew.customizable_entity_start_exploding(self.entity_id, duration)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, pos)
      _class_0.__parent.__init(self)
      self.entity_id = pewpew.new_customizable_entity(pos.x, pos.y)
      self.type = pewpew.EntityType.CUSTOMIZABLE_ENTITY
    end,
    __base = _base_0,
    __name = "CustomizableEntity",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  oop.CustomizableEntity = _class_0
  return _class_0
end
