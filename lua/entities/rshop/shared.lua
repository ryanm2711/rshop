ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "RShop NPC"
ENT.Category = "RShop"
ENT.Author = "ryanm2711"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance(usingAnim) -- This is called by the game to tell the entity if it should animate itself.
	self.AutomaticFrameAdvance = bUsingAnim
end