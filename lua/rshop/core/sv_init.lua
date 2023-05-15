local isValid = IsValid

RShop.Shops = RShop.Shops or {}

function RShop:SaveShop()

end

function RShop:LoadShops()

end

hook.Add("PlayerSpawnedSENT", "RShop.OnShopSpawned", function(ply, ent)
    if not isValid(ent) or ent:GetClass() ~= "rshop" then return end

    -- Open menu
end)