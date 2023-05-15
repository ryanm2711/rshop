include("shared.lua")

local scrW = ScrW
local scrH = ScrH
local screenScale = ScreenScale

local titleFontSizeScale = 24

surface.CreateFont("rshop_title", {
    font = "Roboto",
    size = screenScale(titleFontSizeScale)
})

function ENT:Draw()
    self:DrawModel()

    local ang = self:GetAngles()
    local lpos = Vector(0, 0, 83)
    local pos = self:LocalToWorld(lpos)
    ang:RotateAroundAxis(self:GetAngles():Forward(), 90)
    ang:RotateAroundAxis(self:GetAngles():Up(), 90)

    local font = "rshop_title"
    
    surface.SetFont(font)
    local Length = surface.GetTextSize(self.Title) + 50

    cam.Start3D2D(pos, ang, 0.1)
        local heightOffset = 25
        local height = screenScale(titleFontSizeScale) + heightOffset
        draw.RoundedBox(8, (Length / 2) * -1, 0, Length, height, Color(0, 0, 0, 240) )
        draw.SimpleText(self.Title, font, 0, (height - screenScale(titleFontSizeScale)) - (heightOffset / 2), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    cam.End3D2D()
end