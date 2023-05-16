local PANEL = {}

function PANEL:Init()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    
    self.closeBtn = self.header:Add("DButton")
    self.closeBtn:Dock(RIGHT)
    self.closeBtn.DoClick = function(me)
        self:Remove()
    end
end

vgui.Register("RShop.Frame", PANEL, "DPanel")