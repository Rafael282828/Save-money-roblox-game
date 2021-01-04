local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("DineroStats") 

game.Players.PlayerAdded:Connect(function(Player)
	local Leaderstats = Instance.new("Folder", Player)
	Leaderstats.Name = "leaderstats"
	local Currency = Instance.new("IntValue", Leaderstats)
	Currency.Name = "Dinero"
	Currency.Value = 0
	
	local Data = DataStore:GetAsync(Player.UserId)
	if Data then
		Currency.Value = Data
	end
end)

game.Players.PlayerRemoving:Connect(function(Player)
	DataStore:SetAsync(Player.UserId, Player.leaderstats.Dinero.Value)
end)
