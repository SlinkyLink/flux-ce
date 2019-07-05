local COMMAND = Command.new('tpto')
COMMAND.name = 'Tpto'
COMMAND.description = 'command.tpto.description'
COMMAND.syntax = 'command.tpto.syntax'
COMMAND.permission = 'assistant'
COMMAND.category = 'permission.categories.administration'
COMMAND.arguments = 1
COMMAND.immunity = true
COMMAND.aliases = { 'goto' }

function COMMAND:on_run(player, targets)
  local target = targets[1]

  if IsValid(target) then
    player:teleport(target:GetPos())
  end

  self:notify_staff('command.tpto.message', {
    player = get_player_name(player),
    target = util.player_list_to_string({ target })
  })
end

COMMAND:register()
