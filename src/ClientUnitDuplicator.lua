-- Client Unit Duplicator Script for Cameraman Tower Defense

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local UnitDuplicatorRemote = ReplicatedStorage:WaitForChild("UnitDuplicatorRemote")

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.E then
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {workspace.Terrain, character}
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

        local raycastResult = workspace:Raycast(humanoidRootPart.Position, humanoidRootPart.CFrame.LookVector * 10, raycastParams)

        if raycastResult then
            local unit = raycastResult.Instance:FindFirstAncestorOfClass("Model")
            if unit and unit:GetAttribute("Owner") == player.Name then
                UnitDuplicatorRemote:FireServer(unit)
            end
        end
    end
end

UserInputService.InputBegan:Connect(onInputBegan)