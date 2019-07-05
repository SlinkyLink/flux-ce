local COMMAND = Command.new('kick')
COMMAND.name = 'Kick'
COMMAND.description = 'command.kick.description'
COMMAND.syntax = 'command.kick.syntax'
COMMAND.permission = 'assistant'
COMMAND.category = 'permission.categories.administration'
COMMAND.arguments = 1
COMMAND.immunity = true
COMMAND.aliases = { 'plykick' }

function COMMAND:on_run(player, targets, ...)
  local reason = table.concat({ ... }, ' ') or 'Kicked for unspecified reason.'

  for k, v in ipairs(targets) do
    v:Kick(reason)
  end

  self:notify_staff('command.kick.message', {
    player = get_player_name(player),
    target = util.player_list_to_string(targets),
    reason = reason
  })
end

COMMAND:register()
