-- Made by DragonSpawner12

local blockSize = 5
local noiseScale = 10
local amplitude = 15
local xLength = 50
local zLength = 50
math.randomseed(tick())
local seed = math.random()

local isColorCoded = true


local terrainFolder 

if not workspace:FindFirstChild("TerrainFolder") then
	terrainFolder = Instance.new("Folder", workspace)
	terrainFolder.Name = "TerrainFolder"
else
	terrainFolder = workspace:FindFirstChild("TerrainFolder")
	terrainFolder:ClearAllChildren()
end


local start = tick()

for x = 1, xLength do
	for z = 1, zLength do
		local y = math.noise((x / noiseScale) + seed, (z / noiseScale) + seed) * amplitude
		local part = Instance.new("Part", terrainFolder)
		part.Anchored = true
		part.Size = Vector3.new(blockSize, blockSize, blockSize)
		part.Position = Vector3.new(x*blockSize, y, z*blockSize)
		
		if isColorCoded then
			if y > (5 * amplitude) then
				part.BrickColor = BrickColor.new("Ghost grey")
				part.Material = "Slate"
			else
				part.BrickColor = BrickColor.new("Bright green")
				part.Material = "Grass"
			end
		end
	end
	wait()
end

print("Completed in "..(tick() - start).." seconds")
