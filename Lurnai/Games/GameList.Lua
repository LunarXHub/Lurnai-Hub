--[[ 
.----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |   _          | || |  _    _      | || |  _______     | || | ____  _____  | || |      _       | || |     _____    | |
| |  | |         | || | | |  | |     | || | |_   __ \    | || ||_   \|_   _| | || |     / \      | || |    |_   _|   | |
| |  | |         | || | | |  | |     | || |   | |__) |   | || |  |   \ | |   | || |    / _ \     | || |      | |     | |
| |  | |         | || | | |  | |     | || |   |  __ /    | || |  | |\ \| |   | || |   / ___ \    | || |      | |     | |
| |  | |____     | || | | `--' |     | || |  _| |  \ \_  | || | _| |_\   |_  | || | _/ /   \ \_  | || |     _| |_    | |
| |  |______|    | || |  \____/      | || | |____| |___| | || ||_____|\____| | || ||____| |____| | || |    |_____|   | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 

© 2025 LURNAI. All Rights Reserved.
LURNAI is the legal owner of this script and is protected by copyright law.
You may use this script **only for personal, non-commercial purposes.**
Modification, redistribution, or claiming authorship of this script is **strictly prohibited** without explicit permission from the creator (LURNAI).
]]--

local url = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Github/UI/Button.Lua"
local success, scriptCode = pcall(function()
    return game:HttpGet(url)
end)
if success and scriptCode then
    local loaded = loadstring(scriptCode)
    if type(loaded) == "function" then
        loaded()
    end
else
    warn("[LURNAI] Failed to load Button.lua from GitHub.")
end

local Games = {
  [3623096087] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Muscle%20Legends.luaa", -- Muscle Legends
  [3101667897] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Legends%20Of%20Speed.lua", -- Legends of Speed (SOON)
  [2753915549] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Blox%20Fruits.lua", -- Blox Fruits (First Sea)
  [4442272183] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Blox%20Fruits.lua", -- Blox Fruits (Second Sea)
  [7449423635] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Blox%20Fruits.lua", -- Blox Fruits (Third Sea)
  [85896571713843] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/BubbleGum%20Simulator.lua", -- Bubble Gum Simulator (Soon)
  [126884695634066] = "https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Lurnai/Games/Grow%20Of%20Garden.txt", -- Grow A Garden
}

return Games
