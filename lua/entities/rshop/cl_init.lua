include("shared.lua")

local scrW = ScrW
local scrH = ScrH
local screenScale = ScreenScale

function ENT:Draw()
    self:DrawModel()

    --[[local ang = self:GetAngles()
    local lpos = Vector(0, 0, 80)
    local pos = self:LocalToWorld(lpos)
    ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
    ang:RotateAroundAxis(self:GetAngles():Up(), 90)
    
    local font = DoctorWhoRP:SetFont(DoctorWhoRP.Config.Theme.Font, screenScale(8))
    surface.SetFont(font)
    local Length = surface.GetTextSize(font)

    cam.Start3D2D(pos, ang, 0.1)
        local height = 50
        draw.RoundedBox(DoctorWhoRP.Config.Theme.Roundness, (Length / 2) * -1, 0, Length, height, DoctorWhoRP.Config.Theme.Body )
        draw.SimpleText(self.PrintName, font, 0, height - 36, DoctorWhoRP.Config.Theme.Text, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    cam.End3D2D()--]]
end