TOOL.Category               = 'Flux'
TOOL.Name                   = 'Measure Tool'
TOOL.Command                = nil
TOOL.ConfigName             = ''

TOOL.ClientConVar['unit'] = 'inch'

function TOOL:LeftClick(trace)
  if SERVER then return true end

  self.first = trace.HitPos

  return true
end

function TOOL:RightClick(trace)
  if SERVER then return true end

  self.second = trace.HitPos

  return true
end

function TOOL:Reload(trace)
  if SERVER then return true end

  self.first = nil
  self.second = nil

  return true
end

function TOOL:DrawHUD()
  local unit = self:GetClientInfo('unit')

  if self.first and self.second and Unit[unit] then
    cam.Start3D()
      render.DrawLine(self.first, self.second, color_white)
    cam.End3D()

    local text = math.round(self.first:Distance(self.second) / Unit[unit](Unit, 1), 3)..' '..t('ui.unit.'..unit)
    local font = Theme.get_font('tooltip_normal')
    local text_w, text_h = util.text_size(text, font)
    local x, y = ScrC()

    draw.SimpleTextOutlined(text, font, x - text_w * 0.5, y + text_h * 2, color_white, nil, nil, 1, color_black)
  end
end

local units = {
  'inch',
  'millimeter',
  'centimeter',
  'meter',
  'kilometer',
  'foot',
  'yard',
  'mile'
}

function TOOL.BuildCPanel(CPanel)
  local options = {}

  for k, v in pairs(units) do
    options[t('ui.unit.'..v)] = { ['measure_unit'] = v }
  end

  local units = CPanel:AddControl('ComboBox', { MenuButton = 1, Folder = 'units', Options = options, CVars = { 'measure_unit' } })
end