cable.receive('fl_bolt_set_role', function(player, target, role_id)
  target:SetUserGroup(role_id)

  fl.player:broadcast('set_group.message', { get_player_name(player), target:steam_name(true), role_id })
end)

