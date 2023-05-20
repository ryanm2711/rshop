surface.CreateFont("RShop.Navbar.Button", {
    font = RShop.Config.Font,
    size = 18
})

local isValid = IsValid

local PANEL = {}

AccessorFunc(PANEL, "m_body", "Body")

function PANEL:Init()
    self.buttons = {}
    self.panels = {}
end

function PANEL:AddTab(name, panel)
    local i = table.Count(self.buttons) + 1
    self.buttons[i] = self:Add("DButton")
    local btn = self.buttons[i]
    btn:Dock(LEFT)
    btn.id = i
    btn:DockMargin(0, 2, 0, 0)
    btn:SetText(name)
    btn:SetFont("RShop.Navbar.Button")
    btn.Paint = function(me, w, h)
        if self.active == me.id then
            draw.RoundedBox(RShop.Config.PanelRoundness, 0, h - 2, w, 2, RShop.Theme.accent)
        end
    end
    btn:SizeToContentsX(12)
    btn:SetTextColor(RShop.Theme.text)

    btn.DoClick = function(me)
        self:SetActive(me.id)
    end

    self.panels[i] = self:GetBody():Add(panel or "DPanel") 
    panel = self.panels[i]
    panel:Dock(FILL)
    panel:SetVisible(false)

    if i == 1 then
        self:SetActive(i)
    end
end

function PANEL:SetActive(id)
    local btn = self.buttons[id]
    if not isValid(btn) then return end

    local activeBtn = self.buttons[self.active]
    if isValid(activeBtn) then
        activeBtn:SetTextColor(RShop.Theme.text)
        
        local activePnl = self.panels[self.active]
        if isValid(activePnl) then
            activePnl:SetVisible(false)
        end
    end

    self.active = id
    btn:SetTextColor(RShop.Theme.accent)
    
    local newPnl = self.panels[id]
    newPnl:SetVisible(true)
end

function PANEL:SetActiveByName(name)
    for i, btn in pairs(self.buttons) do
        if btn:GetText() == name then
            self:SetActive(btn.id)
            break
        end
    end
end

function PANEL:Paint(w, h)
    draw.RoundedBox(RShop.Config.PanelRoundness, 0, 0, w, h, RShop.Theme.body)
end
vgui.Register("RShop.Navbar", PANEL, "Panel")