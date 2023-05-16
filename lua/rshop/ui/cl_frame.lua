local PANEL = {}

function PANEL:Init()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    
    self.closeBtn = self.header:Add("DButton")
    self.closeBtn:Dock(RIGHT)
    self.closeBtn:SetText("")
    self.closeBtn:SetWide(50)
    self.closeBtn.Paint = function(me, w, h)
        draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.red)
    end
    self.closeBtn.DoClick = function(me)
        self:Remove()
    end

    self.navbar = self:Add("RShop.Navbar")
    self.navbar:Dock(TOP)

    self.content = self:Add("Panel")
    self.content:Dock(FILL)
    self.content:DockMargin(15, 15, 15, 15)
    self.content.Paint = function(me, w, h)
        draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.body)
    end
end

function PANEL:Paint(w, h)
    draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.secondary)
end

vgui.Register("RShop.Frame", PANEL, "DPanel")