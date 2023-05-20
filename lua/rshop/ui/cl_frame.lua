local PANEL = {}

function PANEL:Init()
    self.header = self:Add("Panel")
    self.header:Dock(TOP)
    
    self.closeBtn = self.header:Add("DButton")
    self.closeBtn:Dock(RIGHT)
    self.closeBtn:DockMargin(0, 0, 4, 0)
    self.closeBtn:SetText("")
    self.closeBtn:SetWide(50)
    self.closeBtn.Paint = function(me, w, h)
        draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.red)
    end
    self.closeBtn.DoClick = function(me)
        self:Remove()
    end

    self.adminBtn = self.header:Add("DButton")
    self.adminBtn:Dock(RIGHT)
    self.adminBtn:DockMargin(0, 0, 4, 0)
    self.adminBtn:SetText("")
    self.adminBtn:SetWide(50)
    self.adminBtn.Paint = function(me, w, h)
        draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.accent)
    end
    self.adminBtn.DoClick = function(me)
        
    end

    self.navbar = self:Add("RShop.Navbar")
    self.navbar:Dock(TOP)
    self.navbar:DockMargin(15, 15, 15, 0)

    self.content = self:Add("Panel")
    self.content:Dock(FILL)
    self.content:DockMargin(15, 5, 15, 15)
    self.content.Paint = function(me, w, h)
        draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.body)
    end

    self.navbar:SetBody(self.content)
    
    self.navbar:AddTab("Test", "RShop.ShopPage")
end

function PANEL:Paint(w, h)
    draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.secondary)
end

vgui.Register("RShop.Frame", PANEL, "DPanel")