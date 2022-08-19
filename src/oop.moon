pewpew.print "Powered by Object Oriented PewPew, v0.1"
export oop = {}

oop.set_size = (size) ->
  pewpew.set_level_size size.x, size.y

class oop.Vector2
  new: (x, y) =>
    @x = x
    @y = y

class oop.Vector3 extends oop.Vector2
  new: (x, y, z) =>
    super x, y
    @z = z

class oop.Weapon
  new: (frequency, cannon, duration) =>
    @frequency = frequency
    @cannon = cannon
    @duration = duration

-- Private class
class Entity
  new: =>
    @entity_id = nil
    @type = nil
  get_pos: =>
    x, y = pewpew.entity_get_position @entity_id
    return Vector2 x, y
  set_pos: (vector) =>
    pewpew.entity_set_position @entity_id, vector.x, vector.y
  is_alive: =>
    return pewpew.entity_get_is_alive @entity_id
  is_started_to_be_destroyed: =>
    pewpew.entity_get_is_started_to_be_destroyed @entity_id
  set_radius: (radius) =>
    pewpew.entity_set_radius @entity_id, radius
  set_callback: (callback) =>
    pewpew.entity_set_update_callback @entity_id, callback
  destroy: =>
    pewpew.entity_destroy @entity_id
  react_to_weapon: (weapon) =>
    return pewpew.entity_react_to_weapon @entity_id, weapon


class oop.Ship extends Entity
  new: (pos, player_int) =>
    super!
    @player_index = player_int
    @entity_id = pewpew.new_player_ship pos.x, pos.y, @player_index
    @type = pewpew.EntityType.SHIP
  configure: (config) =>
    pewpew.configure_player @player_index, config
  configure_hud: (config) =>
    pewpew.configure_player_hud @player_index, config
  get_config: =>
    return pewpew.get_player_configuration @player_index
  configure_weapon: (weapon) =>
    pewpew.configure_player_ship_weapon @entity_id, { frequency: weapon.frequency, cannon: weapon.cannon, duration: weapon.duration }
  add_damage: (damage) =>
    pewpew.add_damage_to_player_ship @entity_id, damage
  make_transparent: (duration) =>
    pewpew.make_player_ship_transparent @entity_id, duration
  set_speed: (factor, offset, duration) =>
    return pewpew.set_player_ship_speed @entity_id, factor, offset, duration

class oop.ShipArrow
  new: (ship_object, target_object, color) =>
    @ship_id = ship_object.entity_id
    @arrow_id = pewpew.add_arrow_to_player_ship @ship_id, target_object.entity_id, color
  remove: =>
    pewpew.remove_arrow_from_player_ship @ship_id, @arrow_id

class oop.Crowder extends Entity
  new: (pos) =>
    super!
    @entity_id = pewpew.new_crowder pos.x, pos.y
    @type = pewpew.EntityType.CROWDER

class oop.Wary extends Entity
  new: (pos) =>
    super!
    @entity_id = pewpew.new_wary pos.x, pos.y
    @type = pewpew.EntityType.WARY

class oop.Asteroid extends Entity
  new: (pos) =>
    super!
    @entity_id = pewpew.new_asteroid pos.x, pos.y
    @type = pewpew.EntityType.ASTEROID

class oop.Ufo extends Entity
  new: (pos, dx) =>
    super!
    @entity_id = pewpew.new_ufo pos.x, pos.y, dx
    @type = pewpew.EntityType.UFO
  enable_collisions: (is_collide_with_walls) =>
    pewpew.ufo_set_enable_collisions_with_walls @entity_id, is_collide_with_walls

class oop.RollingCube extends Entity
  new: (pos) =>
    super!
    @entity_id = pewpew.new_rolling_cube pos.x, pos.y
    @type = pewpew.EntityType.UFO
  enable_collisions: (is_collide_with_walls) =>
    pewpew.rolling_cube_set_enable_collisions_with_walls @entity_id, is_collide_with_walls

class oop.PlayerBullet extends Entity
  new: (pos, angle, ship_object) =>
    super!
    @entity_id = pewpew.new_player_bullet pos.x, pos.y, angle, ship_object.player_index

class oop.Bomb extends Entity
  new: (pos, bomb_type) =>
    super!
    @entity_id = pewpew.new_bomb pos.x, pos.y, bomb_type
    @type = pewpew.EntityType.BOMB

class oop.Inertiac extends Entity
  new: (pos, acceleration, angle) =>
    super!
    @entity_id = pewpew.new_inertiac pos.x, pos.y, acceleration, angle
    @type = pewpew.EntityType.INERTIAC

class oop.Mothership extends Entity
  new: (pos, mothership_type, angle) =>
    super!
    @entity_id = pewpew.new_mothership pos.x, pos.y, mothership_type, angle
    @type = pewpew.EntityType.MOTHERSHIP
    @mothership_type = mothership_type

class oop.Baf extends Entity
  new: (pos, angle, speed, lifetime) =>
    super!
    @entity_id = pewpew.new_baf pos.x, pos.y, angle, speed, lifetime
    @type = pewpew.EntityType.BAF

class oop.BafBlue extends Entity
  new: (pos, angle, speed, lifetime) =>
    super!
    @entity_id = pewpew.new_baf_blue pos.x, pos.y, angle, speed, lifetime
    @type = pewpew.EntityType.BAF_BLUE

class oop.BafRed extends Entity
  new: (pos, angle, speed, lifetime) =>
    super!
    @entity_id = pewpew.new_baf_red pos.x, pos.y, angle, speed, lifetime
    @type = pewpew.EntityType.BAF_RED

class oop.CustomizableEntity extends Entity
  new: (pos) =>
    super!
    @entity_id = pewpew.new_customizable_entity pos.x, pos.y
    @type = pewpew.EntityType.CUSTOMIZABLE_ENTITY
  set_mesh: (mesh_path, mesh_index) =>
    pewpew.customizable_entity_set_mesh @entity_id, mesh_path, mesh_index
  set_pos_interpolation: (is_enabled) =>
    pewpew.customizable_entity_set_position_interpolation @entity_id, is_enabled
  set_flipping_meshes: (mesh_path, index_0, index_1) =>
    pewpew.customizable_entity_set_flipping_meshes @entity_id, mesh_path, index_0, index_1
  set_mesh_color: (color) =>
    pewpew.customizable_entity_set_mesh_color @entity_id, color
  set_string: (text) =>
    pewpew.customizable_entity_set_mesh_color @entity_id, text
  set_mesh_pos: (pos) =>
    pewpew.customizable_entity_set_mesh_xyz @entity_id, pos.x, pos.y, pos.z
  set_mesh_z: (z) =>
    pewpew.customizable_entity_set_mesh_z @entity_id, z
  set_mesh_scale: (scale) =>
    pewpew.customizable_entity_set_mesh_scale @entity_id, scale
  set_mesh_xyz_scale: (scale) =>
    pewpew.customizable_entity_set_mesh_xyz_scale @entity_id, scale.x, scale.y, scale.z
  set_mesh_angle: (angle, axis) =>
    pewpew.customizable_entity_set_mesh_angle @entity_id, angle, axis.x, axis.y, axis.z
  skip_mesh_attributes_interpolation: =>
    pewpew.customizable_entity_skip_mesh_attributes_interpolation @entity_id
  configure_music_response: (config) =>
    pewpew.customizable_entity_configure_music_response @entity_id, config
  add_rotation_to_mesh: (angle, axis) =>
    pewpew.customizable_entity_add_rotation_to_mesh @entity_id, angle, axis.x, axis.y, axis.z
  set_visibility_radius: (radius) =>
    pewpew.customizable_entity_set_visibility_radius @entity_id, radius
  configure_wall_collision: (is_collide_with_walls, callback) =>
    pewpew.customizable_entity_configure_wall_collision @entity_id, is_collide_with_walls, callback
  set_player_collision_callback: (callback) =>
    pewpew.customizable_entity_set_player_collision_callback @entity_id, callback
  set_weapon_collision_callback: (callback) =>
    pewpew.customizable_entity_set_weapon_collision_callback @entity_id, callback
  start_spawning: (duration) =>
    pewpew.customizable_entity_start_spawning @entity_id, duration
  start_exploding: (duration) =>
    pewpew.customizable_entity_start_exploding @entity_id, duration


