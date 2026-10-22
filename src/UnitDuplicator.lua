-- Unit Duplicator Script for Cameraman Tower Defense

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local UnitDuplicator = {}

function UnitDuplicator:DuplicateUnit(player, unit)
    -- Check if the player has enough resources to duplicate the unit
    if player.leaderstats.Gold.Value >= unit:GetAttribute("Cost") then
        -- Deduct the cost from the player's resources
        player.leaderstats.Gold.Value = player.leaderstats.Gold.Value - unit:GetAttribute("Cost")

        -- Create a duplicate of the unit
        local duplicate = unit:Clone()
        duplicate:SetPrimaryPartCFrame(unit:GetPrimaryPartCFrame() + Vector3.new(2, 0, 0))
        duplicate.Parent = workspace.Units

        -- Set up the duplicate unit
        self:SetupUnit(duplicate, player)
    else
        warn("Not enough gold to duplicate unit")
    end
end

function UnitDuplicator:SetupUnit(unit, player)
    -- Set the unit's attributes and behavior
    unit:SetAttribute("Owner", player.Name)
    unit:SetAttribute("Health", unit:GetAttribute("MaxHealth"))
    unit:SetAttribute("Cost", unit:GetAttribute("Cost"))

    -- Add any additional setup logic here
end

return UnitDuplicator