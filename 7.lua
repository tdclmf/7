local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

if game.PlaceId == 17720162456 then
      player.Character.HumanoidRootPart.CFrame = CFrame.new(-333.0579833984375, 16.933761596679688, 2945.642578125)
    humanoid:MoveTo(Vector3.new(-351.4451599121094, 16.70022201538086, 2964.232421875))
    wait(2)

local args = {
    [1] = workspace.Teleporters.Teleporter4,
    [2] = 10,
    [3] = "Normal",
    [4] = false
}

game:GetService("ReplicatedStorage").Remotes.Teleporters.ChooseStage:FireServer(unpack(args))

else
    local success, err = pcall(function()
        local realTimer = game:GetService("Workspace").Info.Time.RealTimer

        while true do
            local currentValue = realTimer.Value
            print("Текущее значение RealTimer:", currentValue)
            
            if currentValue == 25 then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AutoSkip"):FireServer()
            end

            if currentValue == 40 then
                local args = {
                    [1] = game:GetService("Players").LocalPlayer.Equipped5.Value,
                    [2] = CFrame.new(-27, 37, -119)
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnNewTower"):InvokeServer(unpack(args))
            end

            if currentValue == 240 then
                local args = {
                    [1] = game:GetService("Players").LocalPlayer.Equipped2.Value,
                    [2] = CFrame.new(-27, 37, -119)
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("SpawnNewTower"):InvokeServer(unpack(args))
            end

            -- Проверка на "VICTORY" теперь в цикле while
            if player.PlayerGui.GameGui.Info.Message.Text == "VICTORY" then
                local url = "https://discord.com/api/webhooks/1337737827810803773/okBl7WCf6i6BfYRWjBFfQOmaGAaaHXxp2tj37Bj4yi9hx0kvP9AQ91hyw6Xti3tm4YWa"
                local data = {["content"] = "<@851198293735768094> 10 лвл пройден йоу"}
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                local headers = {["content-type"] = "application/json"}
                local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(abcdef)
                break
            end

            wait(1)
        end
    end)
    
    if not success then
        warn("Ошибка: " .. err)
    end
end
