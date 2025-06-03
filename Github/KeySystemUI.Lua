return function(config)
    local function sha256(str)
        local function rightrotate(value, amount)
            local lbits, rbits
            if amount < 32 then
                lbits = bit32.lshift(bit32.band(value, bit32.rshift(0xffffffff, amount)), (32 - amount))
                rbits = bit32.rshift(value, amount)
            else
                lbits, rbits = 0, 0
            end
            return bit32.bor(lbits, rbits)
        end
        
        local function sha256_digest(msg)
            local h0, h1, h2, h3, h4, h5, h6, h7 = 0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
            local k = {
                0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
                0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
                0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
                0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
                0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
                0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
                0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
            }
            
            local msgLen = string.len(msg)
            local msg = msg .. string.char(0x80)
            local extraBytes = 56 - ((msgLen + 1) % 64)
            if extraBytes < 0 then extraBytes = extraBytes + 64 end
            msg = msg .. string.rep(string.char(0), extraBytes)
            
            local function u32str_be(i)
                return string.char(bit32.band(bit32.rshift(i, 24), 0xff), bit32.band(bit32.rshift(i, 16), 0xff), bit32.band(bit32.rshift(i, 8), 0xff), bit32.band(i, 0xff))
            end
            
            msg = msg .. u32str_be(0) .. u32str_be(msgLen * 8)
            
            for chunkStart = 1, string.len(msg), 64 do
                local w = {}
                for i = 0, 15 do
                    local byteStart = chunkStart + i * 4
                    w[i] = bit32.bor(bit32.lshift(string.byte(msg, byteStart), 24), bit32.lshift(string.byte(msg, byteStart + 1), 16), bit32.lshift(string.byte(msg, byteStart + 2), 8), string.byte(msg, byteStart + 3))
                end
                
                for i = 16, 63 do
                    local s0 = bit32.bxor(rightrotate(w[i - 15], 7), rightrotate(w[i - 15], 18), bit32.rshift(w[i - 15], 3))
                    local s1 = bit32.bxor(rightrotate(w[i - 2], 17), rightrotate(w[i - 2], 19), bit32.rshift(w[i - 2], 10))
                    w[i] = bit32.band(w[i - 16] + s0 + w[i - 7] + s1, 0xffffffff)
                end
                
                local a, b, c, d, e, f, g, h = h0, h1, h2, h3, h4, h5, h6, h7
                
                for i = 0, 63 do
                    local s1 = bit32.bxor(rightrotate(e, 6), rightrotate(e, 11), rightrotate(e, 25))
                    local ch = bit32.bxor(bit32.band(e, f), bit32.band(bit32.bnot(e), g))
                    local temp1 = bit32.band(h + s1 + ch + k[i + 1] + w[i], 0xffffffff)
                    local s0 = bit32.bxor(rightrotate(a, 2), rightrotate(a, 13), rightrotate(a, 22))
                    local maj = bit32.bxor(bit32.band(a, b), bit32.band(a, c), bit32.band(b, c))
                    local temp2 = bit32.band(s0 + maj, 0xffffffff)
                    
                    h, g, f, e, d, c, b, a = g, f, e, bit32.band(d + temp1, 0xffffffff), c, b, a, bit32.band(temp1 + temp2, 0xffffffff)
                end
                
                h0 = bit32.band(h0 + a, 0xffffffff)
                h1 = bit32.band(h1 + b, 0xffffffff)
                h2 = bit32.band(h2 + c, 0xffffffff)
                h3 = bit32.band(h3 + d, 0xffffffff)
                h4 = bit32.band(h4 + e, 0xffffffff)
                h5 = bit32.band(h5 + f, 0xffffffff)
                h6 = bit32.band(h6 + g, 0xffffffff)
                h7 = bit32.band(h7 + h, 0xffffffff)
            end
            
            return string.format("%08x%08x%08x%08x%08x%08x%08x%08x", h0, h1, h2, h3, h4, h5, h6, h7)
        end
        
        return sha256_digest(str)
    end
    
    local function fetchValidKeys()
        local success, result = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/HVX-Havoc/Lurnai-Hub/refs/heads/main/Github/Help.lua")
        end)
        
        if success then
            local validKeys = {}
            for key in result:gmatch('"([^"]+)"') do
                table.insert(validKeys, sha256(key))
            end
            return validKeys
        else
            return {}
        end
    end
    
    local validHashes = config and config.keys or fetchValidKeys()
    local successCallback = config and config.callback or function() end
    
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "LurnaiHub"
    gui.Parent = playerGui
    
    local main = Instance.new("Frame")
    main.Size = UDim2.new(0, 420, 0, 280)
    main.Position = UDim2.new(0.5, -210, 0.5, -140)
    main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    main.BorderSizePixel = 0
    main.Parent = gui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = main
    
    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(255, 45, 45)
    border.Thickness = 2
    border.Transparency = 0.3
    border.Parent = main
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 60)
    title.Position = UDim2.new(0, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "lurnai hub"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 32
    title.Font = Enum.Font.SourceSansBold
    title.Parent = main
    
    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(0.8, 0, 0, 40)
    keyBox.Position = UDim2.new(0.1, 0, 0, 120)
    keyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
    keyBox.BorderSizePixel = 0
    keyBox.Text = ""
    keyBox.PlaceholderText = "enter key"
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
    keyBox.TextSize = 16
    keyBox.Font = Enum.Font.SourceSans
    keyBox.Parent = main
    
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 6)
    keyCorner.Parent = keyBox
    
    local submit = Instance.new("TextButton")
    submit.Size = UDim2.new(0.35, 0, 0, 35)
    submit.Position = UDim2.new(0.1, 0, 0, 185)
    submit.BackgroundColor3 = Color3.fromRGB(255, 45, 45)
    submit.BorderSizePixel = 0
    submit.Text = "verify"
    submit.TextColor3 = Color3.fromRGB(255, 255, 255)
    submit.TextSize = 16
    submit.Font = Enum.Font.SourceSansBold
    submit.Parent = main
    
    local submitCorner = Instance.new("UICorner")
    submitCorner.CornerRadius = UDim.new(0, 6)
    submitCorner.Parent = submit
    
    local getkey = Instance.new("TextButton")
    getkey.Size = UDim2.new(0.35, 0, 0, 35)
    getkey.Position = UDim2.new(0.55, 0, 0, 185)
    getkey.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
    getkey.BorderSizePixel = 0
    getkey.Text = "get key"
    getkey.TextColor3 = Color3.fromRGB(255, 255, 255)
    getkey.TextSize = 16
    getkey.Font = Enum.Font.SourceSansBold
    getkey.Parent = main
    
    local getkeyCorner = Instance.new("UICorner")
    getkeyCorner.CornerRadius = UDim.new(0, 6)
    getkeyCorner.Parent = getkey
    
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0.8, 0, 0, 20)
    status.Position = UDim2.new(0.1, 0, 0, 240)
    status.BackgroundTransparency = 1
    status.Text = "waiting for key..."
    status.TextColor3 = Color3.fromRGB(150, 150, 150)
    status.TextSize = 14
    status.Font = Enum.Font.SourceSans
    status.Parent = main
    
    local close = Instance.new("TextButton")
    close.Size = UDim2.new(0, 25, 0, 25)
    close.Position = UDim2.new(1, -35, 0, 10)
    close.BackgroundColor3 = Color3.fromRGB(255, 45, 45)
    close.BorderSizePixel = 0
    close.Text = "×"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.TextSize = 16
    close.Font = Enum.Font.SourceSansBold
    close.Parent = main
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 12)
    closeCorner.Parent = close
    
    local glowTween = TweenService:Create(border, TweenInfo.new(1.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {Transparency = 0.8})
    glowTween:Play()
    
    submit.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if key == "" then
            status.Text = "enter a key first"
            status.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        status.Text = "checking key..."
        status.TextColor3 = Color3.fromRGB(255, 200, 100)
        
        wait(1)
        
        local keyHash = sha256(key)
        local valid = false
        for i = 1, #validHashes do
            if keyHash == validHashes[i] then
                valid = true
                break
            end
        end
        
              
