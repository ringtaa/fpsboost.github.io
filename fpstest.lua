local function optimizePerformance()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            object.CastShadow = false -- Disables shadows for performance
        elseif object:IsA("Decal") then
            object:Destroy() -- Removes decals (textures applied to parts)
        elseif object:IsA("ParticleEmitter") or object:IsA("Beam") or object:IsA("Trail") then
            object.Enabled = false -- Disables visual effects
        end
    end
end

local function deleteWalls()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and (object.Name == "Wall" or object.Name == "ColorWall") then
            object:Destroy()
        end
    end
end

-- Run both functions every second
while true do
    optimizePerformance()
    deleteWalls()
    wait(1) -- Adjust the delay as needed for your game
end
