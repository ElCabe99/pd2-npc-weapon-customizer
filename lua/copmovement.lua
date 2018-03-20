local add_weapons_original = CopMovement.add_weapons
function CopMovement:add_weapons()
  local _, weap = self._ext_base:default_weapon_name()
  if weap and weap.id and weap.name then
    NWC.npc_gun_added = { id = weap.id, unit = self._unit }
    self._unit:inventory():add_unit_by_factory_blueprint(weap.name, true, true, weap.blueprint or tweak_data.weapon.factory[weap.name].default_blueprint, weap.cosmetics)
    NWC.npc_gun_added = nil
  else
    add_weapons_original(self)
  end
end