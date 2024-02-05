local Players = game:GetService("Players")

game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        local NumberFromString = string.match(msg, "%d+")
        local timetodonate = tonumber(NumberFromString)

        if string.find(msg, "/donate") and timetodonate then
            for _, v in pairs(game.Players:GetChildren()) do 
                if string.find(msg, string.lower(v.Name)) then
                    if plr.leaderstats.Time.Value >= timetodonate then
                        print(plr.Name .. " gave " .. timetodonate .. " time to " .. v.Name)
                        plr.leaderstats.Time.Value = plr.leaderstats.Time.Value - timetodonate
                        v.leaderstats.Time.Value = v.leaderstats.Time.Value + timetodonate
                    else
                        print(plr.Name .. " does not have enough time to donate.")
                    end
                end
            end
        end
    end)
end)
