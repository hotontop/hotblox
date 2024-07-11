// HotChams Esp Roblox Script by ChatGPT

paint ("                                                                                                           ")
paint ("   _____ _           _    _____ _____ _______            _    _       _    _____ _                         ")
paint ("  / ____| |         | |  / ____|  __ \__   __|          | |  | |     | |  / ____| |                        ")
paint (" | |    | |__   __ _| |_| |  __| |__) | | |    __  __   | |__| | ___ | |_| |    | |__   __ _ _ __ ___  ___ ")
paint (" | |    | '_ \ / _` | __| | |_ |  ___/  | |    \ \/ /   |  __  |/ _ \| __| |    | '_ \ / _` | '_ ` _ \/ __|")
paint (" | |____| | | | (_| | |_| |__| | |      | |     >  <    | |  | | (_) | |_| |____| | | | (_| | | | | | \__ \")
paint ("  \_____|_| |_|\__,_|\__|\_____|_|      |_|    /_/\_\   |_|  |_|\___/ \__|\_____|_| |_|\__,_|_| |_| |_|___/")
paint ("                                                                                                           ")
                                                                                                         


-- Constants for ESP colors
local VISIBLE_COLOR = Color3.new(0.8, 1, 0)  -- Yellowish green for visible parts
local INVISIBLE_COLOR = Color3.new(0, 0, 1, 0.5)  -- Blue with transparency for invisible parts

-- Function to create ESP and health bar
local function createESP(player)
    -- Create a BillboardGui for displaying ESP elements
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_Billboard"
    billboard.Size = UDim2.new(4, 0, 4, 0)  -- Adjust size as needed
    billboard.StudsOffset = Vector3.new(0, 2, 0)  -- Offset to position above player

    -- Name display
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)  -- White text color
    nameLabel.TextStrokeTransparency = 0  -- Black outline
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)  -- Black outline color
    nameLabel.Size = UDim2.new(1, 0, 0.2, 0)  -- Adjust size as needed
    nameLabel.Parent = billboard

    -- Health bar display
    local healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(1, 0, 0.1, 0)  -- Bar size relative to billboard size
    healthBar.Position = UDim2.new(0, 0, 0.25, 0)  -- Adjust position relative to billboard size
    healthBar.BackgroundColor3 = Color3.new(0, 1, 0)  -- Default to green (full health)
    healthBar.Parent = billboard

    -- Function to update health bar color based on player's health
    local function updateHealthBar()
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local maxHealth = humanoid.MaxHealth
            local currentHealth = humanoid.Health
            local healthRatio = currentHealth / maxHealth

            if healthRatio > 0.5 then
                healthBar.BackgroundColor3 = Color3.new(0, 1, 0)  -- Green
            elseif healthRatio > 0.2 then
                healthBar.BackgroundColor3 = Color3.new(1, 1, 0)  -- Yellow
            else
                healthBar.BackgroundColor3 = Color3.new(1, 0, 0)  -- Red
            end
        end
    end

    -- Connect to health change events to update health bar
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.HealthChanged:Connect(updateHealthBar)
        humanoid.MaxHealthChanged:Connect(updateHealthBar)
        updateHealthBar()  -- Initial update
    end

    billboard.Parent = game.Workspace.CurrentCamera
end

-- Function to handle player added event
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Apply ESP effect (for demonstration purposes, doesn't actually modify appearance)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Color = VISIBLE_COLOR  -- Set all body parts to visible color
                part.Transparency = 0.5  -- Semi-transparent to indicate invisibility
            end
        end
        createESP(player)
    end)
end

-- Loop through existing players and add ESP
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Connect to new player event
game.Players.PlayerAdded:Connect(onPlayerAdded)
