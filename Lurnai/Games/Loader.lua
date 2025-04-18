local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/GameList.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
