-- Server Unit Duplicator Script for Cameraman Tower Defense

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local UnitDuplicator = require(script.Parent.UnitDuplicator)

local UnitDuplicatorRemote = Instance.new("RemoteEvent")
UnitDuplicatorRemote.Name = "UnitDuplicatorRemote"
UnitDuplicatorRemote.Parent = ReplicatedStorage

UnitDuplicatorRemote.OnServerEvent:Connect(function(player, unit)
    UnitDuplicator:DuplicateUnit(player, unit)
end)

-- Initialize player leaderstats
Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local gold = Instance.new("IntValue")
    gold.Name = "Gold"
    gold.Value = 1000
    gold.Parent = leaderstats
end)