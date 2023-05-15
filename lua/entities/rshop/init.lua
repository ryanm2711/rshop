local isValid = IsValid

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/Humans/Group03/male_07.mdl")
    self:SetHullType(HULL_HUMAN) -- Sets the hull type, used for movement calculations amongst other things.
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX) -- This entity uses a solid bounding box for collisions.
    
    local capabilities = CAP_ANIMATEDFACE + CAP_TURN_HEAD
	self:CapabilitiesAdd(capabilities) -- Adds what the NPC is allowed to do ( It cannot move in this case ).
	
    self:SetUseType(SIMPLE_USE) -- Makes the ENT.Use hook only get called once at every use.
	self:DropToFloor()
 
	self:SetMaxYawSpeed( 90 ) --Sets the angle by which an NPC can rotate at once.
end

function ENT:Use(ply, caller)
	if not isValid(ply) then return end

	
end