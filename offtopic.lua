local dataStoreService = game:GetService("DataStoreService")
local DATA_STORE_NAME = "test"

local function loadPlayerData(player)
    local keyPrefix = player.UserId .. " -"
    local tapsData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "Taps")
    local gemsData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "Gems")
    local rebirthData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "Rebirths")
    local honeyData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "Honey")
    local superRebirthData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "SuperRebirths")
    local totalTapsData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "TotalTaps")
    local totalGemsData = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "TotalGems")
    local speedUpgrade = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "SpeedUpgrades")
    local tapsUpgrades = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "TapsUpgrades")
    local gemsUpgrades = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "GemsUpgrades")
    local maxPetsEquippedUpgrades = dataStoreService:GetAsync(DATA_STORE_NAME, keyPrefix .. "MaxPetsEquippedUpgrades")

    player.leaderstats.Taps.Value = tapsData
    player.leaderstats.Gems.Value = gemsData
    player.leaderstats.Rebirths.Value = rebirthData
    player.leaderstats.Honey.Value = honeyData
    player.SuperRebirths.Value = superRebirthData
    player.Upgrades.SpeedUpgrades.Value = speedUpgrade
    player.Upgrades.TapsUpgrades.Value = tapsUpgrades
    player.Upgrades.GemsUpgrades.Value = gemsUpgrades
    player.Upgrades.MaxPetsEquippedUpgrades.Value = maxPetsEquippedUpgrades
    player.TotalTaps.Value = totalTapsData
    player.TotalGems.Value = totalGemsData
end

local function savePlayerData(player)
    local keyPrefix = player.UserId .. " -"
    dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "Taps", player.leaderstats.Taps.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "Rebirths", player.leaderstats.Rebirths.Value)
    dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "Honey", player.leaderstats.Honey.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "SuperRebirths", player.SuperRebirths.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "TotalTaps", player.TotalTaps.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "TotalGems", player.TotalGems.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "SpeedUpgrades", player.Upgrades.SpeedUpgrades.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "TapsUpgrades", player.Upgrades.TapsUpgrades.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "GemsUpgrades", player.Upgrades.GemsUpgrades.Value)
dataStoreService:SetAsync(DATA_STORE_NAME, keyPrefix .. "MaxPetsEquippedUpgrades", player.Upgrades.MaxPetsEquippedUpgrades.Value)
end

game.Players.PlayerAdded:Connect(function(player)
loadPlayerData(player)
player.CharacterAdded:Connect(function(character)
character:WaitForChild("Humanoid").Died:Connect(function()
savePlayerData(player)
end)
end)
player:WaitForChild("Removing"):Connect(function()
savePlayerData(player)
end)
end)

game.Players.PlayerRemoving:Connect(function(player)
savePlayerData(player)
end)
