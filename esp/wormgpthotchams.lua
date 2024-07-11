-- HotChams script for Roblox by WormGPT


paint ("                                                                                                                   ")
paint (" __          __                   _____ _____ _______            _    _       _    _____ _                         ")
paint (" \ \        / /                  / ____|  __ \__   __|          | |  | |     | |  / ____| |                        ")
paint ("  \ \  /\  / /__  _ __ _ __ ___ | |  __| |__) | | |    __  __   | |__| | ___ | |_| |    | |__   __ _ _ __ ___  ___ ")
paint ("   \ \/  \/ / _ \| '__| '_ ` _ \| | |_ |  ___/  | |    \ \/ /   |  __  |/ _ \| __| |    | '_ \ / _` | '_ ` _ \/ __|")
paint ("    \  /\  / (_) | |  | | | | | | |__| | |      | |     >  <    | |  | | (_) | |_| |____| | | | (_| | | | | | \__ \")
paint ("     \/  \/ \___/|_|  |_| |_| |_|\_____|_|      |_|    /_/\_\   |_|  |_|\___/ \__|\_____|_| |_|\__,_|_| |_| |_|___/")
paint ("                                                                                                                   ")
                                                                                                                 
                                                                                                                 


local player = game.Players.LocalPlayer

local function applyChams(bodyPart, visibleColor, invisibleColor, overrideColor)
    local visibleMaterial = Enum.Material.SmoothPlastic
    local invisibleMaterial = Enum.Material.SmoothPlastic
    local overrideMaterial = Enum.Material.SmoothPlastic

    bodyPart.Color = visibleColor
    bodyPart.Material = visibleMaterial

    bodyPart.LocalTransparencyModifier = 0.3

    bodyPart.NameDisplayDistance = 0
    bodyPart.Name.Visible = true
    bodyPart.Name.TextStrokeTransparency = 0
    bodyPart.Name.TextColor3 = Color3.new(1, 1, 1)
    bodyPart.Name.TextStrokeColor3 = Color3.new(0, 0, 0)

    local healthBar = Instance.new("BillboardGui")
    local healthFrame = Instance.new("Frame")

    healthBar.Size = UDim2.new(2, 0, 0.2, 0)
    healthBar.Adornee = bodyPart

    healthFrame.Size = UDim2.new(1, 0, 1, 0)

    if player.Health == player.MaxHealth then
        healthFrame.BackgroundColor3 = Color3.new(0, 1, 0)  -- Green if health is full
    elseif player.Health >= player.MaxHealth * 0.75 then
        healthFrame.BackgroundColor3 = Color3.new(1, 1, 0)  -- Yellow if health is medium
    else
        healthFrame.BackgroundColor3 = Color3.new(1, 0, 0)  -- Red if health is low
    end

    healthFrame.Parent = healthBar
    healthBar.Parent = bodyPart
end

-- Iterate over all body parts
for _, bodyPart in pairs(player.Character:GetDescendants()) do
    if bodyPart:IsA("BasePart") then
        if bodyPart.Name == "Head" then
            applyChams(bodyPart, Color3.new(0.9, 1, 0), Color3.new(0, 0.5, 1), Color3.new(0.9, 1, 0))
        else
            applyChams(bodyPart, Color3.new(0.9, 1, 0), Color3.new(0, 0.5, 1), Color3.new(0.9, 1, 0))
        end
    end
end
