if game.CoreGui:FindFirstChild("SkullWareLibrary") ~= nil then
    game.CoreGui["SkullWareLibrary"]:Destroy()
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local Library = {}
function Library:CreateWindow(Title)
    local SkullWareLibrary = Instance.new("ScreenGui")
    local Main_1 = Instance.new("Frame")
    local Topbar_1 = Instance.new("Frame")
    local Line_1 = Instance.new("Frame")
    local Title_1 = Instance.new("TextLabel")
    local UIPadding_1 = Instance.new("UIPadding")
    local Logo_1 = Instance.new("ImageLabel")
    local Close_1 = Instance.new("ImageButton")
    local SideBar_1 = Instance.new("Frame")
    local Line_2 = Instance.new("Frame")
    local TabsScroll_1 = Instance.new("ScrollingFrame")
    local UIListLayout_1 = Instance.new("UIListLayout")
    local UIPadding_2 = Instance.new("UIPadding")
    local ElementsFrame_1 = Instance.new("Frame")
    local UICorner_8 = Instance.new("UICorner")

    SkullWareLibrary.Name = "SkullWareLibrary"
    SkullWareLibrary.Parent = game.CoreGui

    Main_1.Name = "Main"
    Main_1.Parent = SkullWareLibrary
    Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
    Main_1.BackgroundColor3 = Color3.fromRGB(35,37,42)
    Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Main_1.BorderSizePixel = 0
    Main_1.Position = UDim2.new(0.5, 0,0.5, 0)
    Main_1.Size = UDim2.new(0, 557,0, 326)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed then
            if input.KeyCode == Enum.KeyCode.LeftControl then
                Main_1.Visible = not Main_1.Visible
            end
        end
    end)

    local gui = Main_1
    local dragging
    local dragInput
    local dragStart
    local startPos
    function Lerp(a, b, m)
        return a + (b - a) * m
    end
    local lastMousePos
    local lastGoalPos
    local DRAG_SPEED = (12)
    function Update(dt)
        if not (startPos) then return end
        if not (dragging) and (lastGoalPos) then
            gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
            return 
        end

        local delta = (lastMousePos - UserInputService:GetMouseLocation())
        local xGoal = (startPos.X.Offset - delta.X)
        local yGoal = (startPos.Y.Offset - delta.Y)
        lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
        gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
    end
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            lastMousePos = UserInputService:GetMouseLocation()

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    runService.Heartbeat:Connect(Update)


    Topbar_1.Name = "Topbar"
    Topbar_1.Parent = Main_1
    Topbar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Topbar_1.BackgroundTransparency = 1
    Topbar_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Topbar_1.BorderSizePixel = 0
    Topbar_1.Size = UDim2.new(0, 557,0, 25)

    Line_1.Name = "Line"
    Line_1.Parent = Topbar_1
    Line_1.BackgroundColor3 = Color3.fromRGB(55,58,66)
    Line_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Line_1.BorderSizePixel = 0
    Line_1.Position = UDim2.new(0, 0,1, 0)
    Line_1.Size = UDim2.new(0, 557,0, 1)

    Title_1.Name = "Title"
    Title_1.Parent = Topbar_1
    Title_1.AnchorPoint = Vector2.new(0, 0.5)
    Title_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Title_1.BackgroundTransparency = 1
    Title_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Title_1.BorderSizePixel = 0
    Title_1.Position = UDim2.new(0, 0,0.5, 0)
    Title_1.Size = UDim2.new(0, 557,0, 19)
    Title_1.Font = Enum.Font.SourceSans
    Title_1.Text = "SkullWare - "..Title
    Title_1.TextColor3 = Color3.fromRGB(255,255,255)
    Title_1.TextSize = 14
    Title_1.TextXAlignment = Enum.TextXAlignment.Left

    UIPadding_1.Parent = Title_1
    UIPadding_1.PaddingLeft = UDim.new(0,30)

    Logo_1.Name = "Logo"
    Logo_1.Parent = Topbar_1
    Logo_1.AnchorPoint = Vector2.new(0, 0.5)
    Logo_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Logo_1.BackgroundTransparency = 1
    Logo_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Logo_1.BorderSizePixel = 0
    Logo_1.Position = UDim2.new(0, 7,0.5, 0)
    Logo_1.Size = UDim2.new(0, 16,0, 16)
    Logo_1.Image = "rbxassetid://139757128778029"

    Close_1.Name = "Close"
    Close_1.Parent = Topbar_1
    Close_1.Active = true
    Close_1.AnchorPoint = Vector2.new(0, 0.5)
    Close_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Close_1.BackgroundTransparency = 1
    Close_1.BorderColor3 = Color3.fromRGB(0,0,0)
    Close_1.BorderSizePixel = 0
    Close_1.Position = UDim2.new(0.964999974, 0,0.5, 0)
    Close_1.Size = UDim2.new(0, 14,0, 14)
    Close_1.Image = "rbxassetid://94272079953586"

    Close_1.MouseButton1Click:Connect(function()
        game.CoreGui["SkullWareLibrary"]:Destroy()
    end)

    SideBar_1.Name = "SideBar"
    SideBar_1.Parent = Main_1
    SideBar_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    SideBar_1.BackgroundTransparency = 1
    SideBar_1.BorderColor3 = Color3.fromRGB(0,0,0)
    SideBar_1.BorderSizePixel = 0
    SideBar_1.Position = UDim2.new(0, 0,0.0797545984, 0)
    SideBar_1.Size = UDim2.new(0, 101,0, 300)

    Line_2.Name = "Line"
    Line_2.Parent = SideBar_1
    Line_2.BackgroundColor3 = Color3.fromRGB(55,58,66)
    Line_2.BorderColor3 = Color3.fromRGB(0,0,0)
    Line_2.BorderSizePixel = 0
    Line_2.Position = UDim2.new(1, 0,0, 0)
    Line_2.Size = UDim2.new(0, 1,0, 300)

    TabsScroll_1.Name = "TabsScroll"
    TabsScroll_1.Parent = SideBar_1
    TabsScroll_1.Active = true
    TabsScroll_1.AnchorPoint = Vector2.new(0.5, 0.5)
    TabsScroll_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    TabsScroll_1.BackgroundTransparency = 1
    TabsScroll_1.BorderColor3 = Color3.fromRGB(0,0,0)
    TabsScroll_1.BorderSizePixel = 0
    TabsScroll_1.Position = UDim2.new(0.5, 0,0.491666675, 0)
    TabsScroll_1.Size = UDim2.new(0, 95,0, 295)
    TabsScroll_1.ClipsDescendants = true
    TabsScroll_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
    TabsScroll_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
    TabsScroll_1.CanvasPosition = Vector2.new(0, 0)
    TabsScroll_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
    TabsScroll_1.ElasticBehavior = Enum.ElasticBehavior.Never
    TabsScroll_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
    TabsScroll_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    TabsScroll_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
    TabsScroll_1.ScrollBarImageTransparency = 1
    TabsScroll_1.ScrollBarThickness = 1
    TabsScroll_1.ScrollingDirection = Enum.ScrollingDirection.Y
    TabsScroll_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
    TabsScroll_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
    TabsScroll_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

    UIListLayout_1.Parent = TabsScroll_1
    UIListLayout_1.Padding = UDim.new(0,3)
    UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
    
    UIPadding_2.Parent = TabsScroll_1
    UIPadding_2.PaddingBottom = UDim.new(0,3)
    UIPadding_2.PaddingTop = UDim.new(0,3)

    ElementsFrame_1.Name = "ElementsFrame"
    ElementsFrame_1.Parent = Main_1
    ElementsFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ElementsFrame_1.BackgroundTransparency = 1
    ElementsFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
    ElementsFrame_1.BorderSizePixel = 0
    ElementsFrame_1.Position = UDim2.new(0.183123872, 0,0.0797545984, 0)
    ElementsFrame_1.Size = UDim2.new(0, 455,0, 300)

    UICorner_8.Parent = Main_1
    UICorner_8.CornerRadius = UDim.new(0,2)

    local Tabs = {}
    local first = true
	local currentTab = nil
    function Tabs:CreateTab(Title)
        local TabFrame_2 = Instance.new("Frame")
        local TextButton_2 = Instance.new("TextButton")
        local Elements_1 = Instance.new("Frame")
        local UIListLayout_2 = Instance.new("UIListLayout")

        TabFrame_2.Name = "TabFrame"
        TabFrame_2.Parent = TabsScroll_1
        TabFrame_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TabFrame_2.BackgroundTransparency = 1
        TabFrame_2.BorderColor3 = Color3.fromRGB(0,0,0)
        TabFrame_2.BorderSizePixel = 0
        TabFrame_2.Size = UDim2.new(0, 95,0, 20)

        TextButton_2.Parent = TabFrame_2
        TextButton_2.Active = true
        TextButton_2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TextButton_2.BackgroundTransparency = 1
        TextButton_2.BorderColor3 = Color3.fromRGB(0,0,0)
        TextButton_2.BorderSizePixel = 0
        TextButton_2.Position = UDim2.new(0.5, 0,0.5, 0)
        TextButton_2.Size = UDim2.new(0, 95,0, 20)
        TextButton_2.ClipsDescendants = true
        TextButton_2.Font = Enum.Font.SourceSans
        TextButton_2.Text = Title
        TextButton_2.TextColor3 = Color3.fromRGB(200,200,200)
        TextButton_2.TextSize = 14

        Elements_1.Name = "Elements"
        Elements_1.Parent = ElementsFrame_1
        Elements_1.BackgroundColor3 = Color3.fromRGB(35,37,42)
        Elements_1.BorderColor3 = Color3.fromRGB(0,0,0)
        Elements_1.BorderSizePixel = 0
        Elements_1.Size = UDim2.new(0, 455,0, 300)
        
        UIListLayout_2.Parent = Elements_1
        UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

        if first then
			first = false
			Elements_1.Visible = true
			currentTab = TextButton_2
			TextButton_2.TextColor3 = Color3.fromRGB(255,255,255)
		else
			Elements_1.Visible = false
		end

		TextButton_2.MouseButton1Click:Connect(function()
			if currentTab == TextButton_2 then
				return
			end
			if currentTab then
				local deactivateTween = TweenService:Create(
					currentTab, 
					TweenInfo.new(0.3), 
					{TextColor3 = Color3.fromRGB(200,200,200)}
				)
				deactivateTween:Play()
			end
			local activateTween = TweenService:Create(
				TextButton_2, 
				TweenInfo.new(0.3), 
				{TextColor3 = Color3.fromRGB(255,255,255)}
			)
			activateTween:Play()
			currentTab = TextButton_2
			for i, v in next, ElementsFrame_1:GetChildren() do
				v.Visible = false
			end
			Elements_1.Visible = true
		end)

        local Sections = {}
        function Sections:CreateSection()
            local Section_1 = Instance.new("Frame")
            local Items_1 = Instance.new("ScrollingFrame")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local UIPadding_4 = Instance.new("UIPadding")

            Section_1.Name = "Section"
            Section_1.Parent = Elements_1
            Section_1.BackgroundColor3 = Color3.fromRGB(82,87,98)
            Section_1.BackgroundTransparency = 1
            Section_1.BorderColor3 = Color3.fromRGB(0,0,0)
            Section_1.BorderSizePixel = 0
            Section_1.Size = UDim2.new(0, 227,0, 300)

            Items_1.Name = "Items"
            Items_1.Parent = Section_1
            Items_1.Active = true
            Items_1.AnchorPoint = Vector2.new(0.5, 0.5)
            Items_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
            Items_1.BackgroundTransparency = 1
            Items_1.BorderColor3 = Color3.fromRGB(0,0,0)
            Items_1.BorderSizePixel = 0
            Items_1.Position = UDim2.new(0.5, 0,0.5, 0)
            Items_1.Size = UDim2.new(0, 220,0, 300)
            Items_1.ClipsDescendants = true
            Items_1.AutomaticCanvasSize = Enum.AutomaticSize.Y
            Items_1.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
            Items_1.CanvasPosition = Vector2.new(0, 0)
            Items_1.CanvasSize = UDim2.new(0, 0,0.5, 0)
            Items_1.ElasticBehavior = Enum.ElasticBehavior.Never
            Items_1.HorizontalScrollBarInset = Enum.ScrollBarInset.None
            Items_1.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            Items_1.ScrollBarImageColor3 = Color3.fromRGB(0,0,0)
            Items_1.ScrollBarImageTransparency = 1
            Items_1.ScrollBarThickness = 1
            Items_1.ScrollingDirection = Enum.ScrollingDirection.Y
            Items_1.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
            Items_1.VerticalScrollBarInset = Enum.ScrollBarInset.None
            Items_1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right

            UIListLayout_3.Parent = Items_1
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

            UIPadding_4.Parent = Items_1
            UIPadding_4.PaddingBottom = UDim.new(0,3)

            local Elements = {}
            function Elements:AddSection(Title)
                local SectionFrame_1 = Instance.new("Frame")
                local SectionText_1 = Instance.new("TextLabel")
                local UIPadding_3 = Instance.new("UIPadding")

                SectionFrame_1.Name = "SectionFrame"
                SectionFrame_1.Parent = Items_1
                SectionFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SectionFrame_1.BackgroundTransparency = 1
                SectionFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SectionFrame_1.BorderSizePixel = 0
                SectionFrame_1.Size = UDim2.new(0, 220,0, 23)

                SectionText_1.Name = "SectionText"
                SectionText_1.Parent = SectionFrame_1
                SectionText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SectionText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SectionText_1.BackgroundTransparency = 1
                SectionText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SectionText_1.BorderSizePixel = 0
                SectionText_1.Position = UDim2.new(0.5, 0,0.5, 0)
                SectionText_1.Size = UDim2.new(0, 220,0, 20)
                SectionText_1.ClipsDescendants = true
                SectionText_1.Font = Enum.Font.SourceSans
                SectionText_1.Text = Title
                SectionText_1.TextColor3 = Color3.fromRGB(255,255,255)
                SectionText_1.TextSize = 14
                SectionText_1.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_3.Parent = SectionText_1
                UIPadding_3.PaddingLeft = UDim.new(0,6)
                UIPadding_3.PaddingTop = UDim.new(0,3)
            end
            function Elements:AddBox(Title, Default, Callback)
                local BoxFrame_1 = Instance.new("Frame")
                local BoxText_1 = Instance.new("TextLabel")
                local UIPadding_5 = Instance.new("UIPadding")
                local TextBoxFrame_1 = Instance.new("Frame")
                local TextBox_1 = Instance.new("TextBox")
                local UIPadding_6 = Instance.new("UIPadding")
                local UICorner_1 = Instance.new("UICorner")

                BoxFrame_1.Name = "BoxFrame"
                BoxFrame_1.Parent = Items_1
                BoxFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                BoxFrame_1.BackgroundTransparency = 1
                BoxFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                BoxFrame_1.BorderSizePixel = 0
                BoxFrame_1.Size = UDim2.new(0, 220,0, 20)

                BoxText_1.Name = "BoxText"
                BoxText_1.Parent = BoxFrame_1
                BoxText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                BoxText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                BoxText_1.BackgroundTransparency = 1
                BoxText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                BoxText_1.BorderSizePixel = 0
                BoxText_1.Position = UDim2.new(0.272727281, 0,0.5, 0)
                BoxText_1.Size = UDim2.new(0, 120,0, 20)
                BoxText_1.ClipsDescendants = true
                BoxText_1.Font = Enum.Font.SourceSans
                BoxText_1.Text = Title
                BoxText_1.TextColor3 = Color3.fromRGB(200,200,200)
                BoxText_1.TextSize = 14
                BoxText_1.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_5.Parent = BoxText_1
                UIPadding_5.PaddingLeft = UDim.new(0,6)

                TextBoxFrame_1.Name = "TextBoxFrame"
                TextBoxFrame_1.Parent = BoxFrame_1
                TextBoxFrame_1.AnchorPoint = Vector2.new(0, 0.5)
                TextBoxFrame_1.BackgroundColor3 = Color3.fromRGB(67,71,81)
                TextBoxFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TextBoxFrame_1.BorderSizePixel = 0
                TextBoxFrame_1.Position = UDim2.new(0.577000022, 0,0.5, 0)
                TextBoxFrame_1.Size = UDim2.new(0, 90,0, 17)

                TextBox_1.Parent = TextBoxFrame_1
                TextBox_1.Active = true
                TextBox_1.AnchorPoint = Vector2.new(0.5, 0.5)
                TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                TextBox_1.BackgroundTransparency = 1
                TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TextBox_1.BorderSizePixel = 0
                TextBox_1.CursorPosition = -1
                TextBox_1.Position = UDim2.new(0.5, 0,0.5, 0)
                TextBox_1.Size = UDim2.new(0, 90,0, 17)
                TextBox_1.ClipsDescendants = true
                TextBox_1.Font = Enum.Font.SourceSans
                TextBox_1.PlaceholderColor3 = Color3.fromRGB(180,180,180)
                TextBox_1.PlaceholderText = Default
                TextBox_1.Text = ""
                TextBox_1.TextColor3 = Color3.fromRGB(180,180,180)
                TextBox_1.TextSize = 14

                UIPadding_6.Parent = TextBox_1
                UIPadding_6.PaddingBottom = UDim.new(0,1)

                UICorner_1.Parent = TextBoxFrame_1
                UICorner_1.CornerRadius = UDim.new(0,2)

                TextBox_1.FocusLost:Connect(function()
                    Callback(TextBox_1.Text)
                end)
            end
            function Elements:AddToggle(Title, Callback)
                Callback = Callback or function() end

                local toggled = false
                local debounce = false

                local ToggleFrame_1 = Instance.new("Frame")
                local ToggleText_1 = Instance.new("TextLabel")
                local UIPadding_7 = Instance.new("UIPadding")
                local TogglerFrame_1 = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local TogglerIndicator_1 = Instance.new("Frame")
                local UICorner_3 = Instance.new("UICorner")
                local Toggler_1 = Instance.new("TextButton")

                ToggleFrame_1.Name = "ToggleFrame"
                ToggleFrame_1.Parent = Items_1
                ToggleFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ToggleFrame_1.BackgroundTransparency = 1
                ToggleFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ToggleFrame_1.BorderSizePixel = 0
                ToggleFrame_1.Size = UDim2.new(0, 220,0, 20)
                
                ToggleText_1.Name = "ToggleText"
                ToggleText_1.Parent = ToggleFrame_1
                ToggleText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ToggleText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ToggleText_1.BackgroundTransparency = 1
                ToggleText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ToggleText_1.BorderSizePixel = 0
                ToggleText_1.Position = UDim2.new(0.272727281, 0,0.5, 0)
                ToggleText_1.Size = UDim2.new(0, 120,0, 20)
                ToggleText_1.ClipsDescendants = true
                ToggleText_1.Font = Enum.Font.SourceSans
                ToggleText_1.Text = Title
                ToggleText_1.TextColor3 = Color3.fromRGB(200,200,200)
                ToggleText_1.TextSize = 14
                ToggleText_1.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_7.Parent = ToggleText_1
                UIPadding_7.PaddingLeft = UDim.new(0,6)
                
                TogglerFrame_1.Name = "TogglerFrame"
                TogglerFrame_1.Parent = ToggleFrame_1
                TogglerFrame_1.AnchorPoint = Vector2.new(0, 0.5)
                TogglerFrame_1.BackgroundColor3 = Color3.fromRGB(67,71,81)
                TogglerFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TogglerFrame_1.BorderSizePixel = 0
                TogglerFrame_1.Position = UDim2.new(0.908818185, 0,0.5, 0)
                TogglerFrame_1.Size = UDim2.new(0, 17,0, 17)
                
                UICorner_2.Parent = TogglerFrame_1
                UICorner_2.CornerRadius = UDim.new(0,5)
                
                TogglerIndicator_1.Name = "TogglerIndicator"
                TogglerIndicator_1.Parent = TogglerFrame_1
                TogglerIndicator_1.AnchorPoint = Vector2.new(0.5, 0.5)
                TogglerIndicator_1.BackgroundColor3 = Color3.fromRGB(96,102,116)
                TogglerIndicator_1.BorderColor3 = Color3.fromRGB(0,0,0)
                TogglerIndicator_1.BorderSizePixel = 0
                TogglerIndicator_1.Position = UDim2.new(0.5, 0,0.5, 0)
                TogglerIndicator_1.Size = UDim2.new(0, 13,0, 13)
                TogglerIndicator_1.BackgroundTransparency = 1

                UICorner_3.Parent = TogglerIndicator_1
                UICorner_3.CornerRadius = UDim.new(0,4)
                
                Toggler_1.Name = "Toggler"
                Toggler_1.Parent = TogglerFrame_1
                Toggler_1.Active = true
                Toggler_1.AnchorPoint = Vector2.new(0.5, 0.5)
                Toggler_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                Toggler_1.BackgroundTransparency = 1
                Toggler_1.BorderColor3 = Color3.fromRGB(0,0,0)
                Toggler_1.BorderSizePixel = 0
                Toggler_1.Position = UDim2.new(0.5, 0,0.5, 0)
                Toggler_1.Size = UDim2.new(0, 17,0, 17)
                Toggler_1.Font = Enum.Font.SourceSans
                Toggler_1.Text = ""
                Toggler_1.TextSize = 14

                Toggler_1.MouseButton1Click:Connect(function()
                    if debounce == false then
                        if toggled == false then
                            debounce = true
                            local onTween = TweenService:Create(
                                TogglerIndicator_1, 
                                TweenInfo.new(0.2),
                                {BackgroundTransparency = 0}
                            )
                            onTween:Play()
                            debounce = false
                            toggled = true
                            pcall(Callback, toggled)
                        elseif toggled == true then
                            debounce = true
                            local offTween = TweenService:Create(
                                TogglerIndicator_1, 
                                TweenInfo.new(0.2),
                                {BackgroundTransparency = 1}
                            )
                            offTween:Play()
                            debounce = false
                            toggled = false
                            pcall(Callback, toggled)
                        end
                    end
                end)
            end
            function Elements:AddDropdown(Title, Options, Callback)
                local DropdownFrame_1 = Instance.new("Frame")
                local DropdownText_1 = Instance.new("TextLabel")
                local UIPadding_8 = Instance.new("UIPadding")
                local SelectingFrame_1 = Instance.new("Frame")
                local UICorner_4 = Instance.new("UICorner")
                local DropdownButton_1 = Instance.new("TextButton")
                local UIPadding_9 = Instance.new("UIPadding")
                local OptionsExtra_1 = Instance.new("Frame")
                local SelectedText_1 = Instance.new("TextLabel")
                local OptionsFrame_1 = Instance.new("Frame")
                local UICorner_5 = Instance.new("UICorner")
                local UIListLayout_4 = Instance.new("UIListLayout")
                local UIPadding_10 = Instance.new("UIPadding")

                DropdownFrame_1.Name = "DropdownFrame"
                DropdownFrame_1.Parent = Items_1
                DropdownFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                DropdownFrame_1.BackgroundTransparency = 1
                DropdownFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                DropdownFrame_1.BorderSizePixel = 0
                DropdownFrame_1.Size = UDim2.new(0, 220,0, 20)
                
                DropdownText_1.Name = "DropdownText"
                DropdownText_1.Parent = DropdownFrame_1
                DropdownText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                DropdownText_1.BackgroundTransparency = 1
                DropdownText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                DropdownText_1.BorderSizePixel = 0
                DropdownText_1.Position = UDim2.new(0.272727281, 0,0.5, 0)
                DropdownText_1.Size = UDim2.new(0, 120,0, 20)
                DropdownText_1.ClipsDescendants = true
                DropdownText_1.Font = Enum.Font.SourceSans
                DropdownText_1.Text = Title
                DropdownText_1.TextColor3 = Color3.fromRGB(200,200,200)
                DropdownText_1.TextSize = 14
                DropdownText_1.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_8.Parent = DropdownText_1
                UIPadding_8.PaddingLeft = UDim.new(0,6)
                
                SelectingFrame_1.Name = "SelectingFrame"
                SelectingFrame_1.Parent = DropdownFrame_1
                SelectingFrame_1.AnchorPoint = Vector2.new(0, 0.5)
                SelectingFrame_1.BackgroundColor3 = Color3.fromRGB(67,71,81)
                SelectingFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SelectingFrame_1.BorderSizePixel = 0
                SelectingFrame_1.Position = UDim2.new(0.577000022, 0,0.5, 0)
                SelectingFrame_1.Size = UDim2.new(0, 90,0, 17)
                
                UICorner_4.Parent = SelectingFrame_1
                UICorner_4.CornerRadius = UDim.new(0,2)
                
                DropdownButton_1.Name = "DropdownButton"
                DropdownButton_1.Parent = SelectingFrame_1
                DropdownButton_1.Active = true
                DropdownButton_1.AnchorPoint = Vector2.new(0.5, 0.5)
                DropdownButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                DropdownButton_1.BackgroundTransparency = 1
                DropdownButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
                DropdownButton_1.BorderSizePixel = 0
                DropdownButton_1.Position = UDim2.new(0.5, 0,0.5, 0)
                DropdownButton_1.Size = UDim2.new(0, 90,0, 17)
                DropdownButton_1.ZIndex = 3
                DropdownButton_1.ClipsDescendants = true
                DropdownButton_1.Font = Enum.Font.SourceSans
                DropdownButton_1.Text = ""
                DropdownButton_1.TextColor3 = Color3.fromRGB(180,180,180)
                DropdownButton_1.TextSize = 14
                
                UIPadding_9.Parent = DropdownButton_1
                UIPadding_9.PaddingBottom = UDim.new(0,1)
                
                OptionsExtra_1.Name = "OptionsExtra"
                OptionsExtra_1.Parent = SelectingFrame_1
                OptionsExtra_1.BackgroundColor3 = Color3.fromRGB(67,71,81)
                OptionsExtra_1.BorderColor3 = Color3.fromRGB(0,0,0)
                OptionsExtra_1.BorderSizePixel = 0
                OptionsExtra_1.Position = UDim2.new(0, 0,0.411764711, 0)
                OptionsExtra_1.Size = UDim2.new(0, 90,0, 11)
                
                SelectedText_1.Name = "SelectedText"
                SelectedText_1.Parent = SelectingFrame_1
                SelectedText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SelectedText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SelectedText_1.BackgroundTransparency = 1
                SelectedText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SelectedText_1.BorderSizePixel = 0
                SelectedText_1.Position = UDim2.new(0.5, 0,0.5, 0)
                SelectedText_1.Size = UDim2.new(0, 90,0, 17)
                SelectedText_1.ZIndex = 2
                SelectedText_1.ClipsDescendants = true
                SelectedText_1.Font = Enum.Font.SourceSans
                SelectedText_1.Text = "None"
                SelectedText_1.TextColor3 = Color3.fromRGB(220,220,220)
                SelectedText_1.TextSize = 14
                
                OptionsFrame_1.Name = "OptionsFrame"
                OptionsFrame_1.Parent = DropdownFrame_1
                OptionsFrame_1.AutomaticSize = Enum.AutomaticSize.Y
                OptionsFrame_1.BackgroundColor3 = Color3.fromRGB(67,71,81)
                OptionsFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                OptionsFrame_1.BorderSizePixel = 0
                OptionsFrame_1.Position = UDim2.new(0.577000022, 0,0, 20)
                OptionsFrame_1.Size = UDim2.new(0, 90,0, 15)
                OptionsFrame_1.Visible = false
                OptionsFrame_1.ZIndex = 3
                
                UICorner_5.Parent = OptionsFrame_1
                UICorner_5.CornerRadius = UDim.new(0,2)
                
                UIListLayout_4.Parent = OptionsFrame_1
                UIListLayout_4.Padding = UDim.new(0,3)
                UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
                
                UIPadding_10.Parent = OptionsFrame_1
                UIPadding_10.PaddingBottom = UDim.new(0,3)

                local isDropdownOpen = false

                local function ToggleDropdown()
                    isDropdownOpen = not isDropdownOpen
                    if isDropdownOpen then
                        OptionsFrame_1.Visible = true
                    else
                        OptionsFrame_1.Visible = false
                    end
                end

                DropdownButton_1.MouseButton1Click:Connect(ToggleDropdown)

                for i, optionText in ipairs(Options) do
                    local OptionButton_1 = Instance.new("TextButton")

                    OptionButton_1.Name = "OptionButton"
                    OptionButton_1.Parent = OptionsFrame_1
                    OptionButton_1.Active = true
                    OptionButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                    OptionButton_1.BackgroundTransparency = 1
                    OptionButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
                    OptionButton_1.BorderSizePixel = 0
                    OptionButton_1.Size = UDim2.new(0, 90,0, 15)
                    OptionButton_1.ClipsDescendants = true
                    OptionButton_1.Font = Enum.Font.SourceSans
                    OptionButton_1.Text = optionText
                    OptionButton_1.TextColor3 = Color3.fromRGB(255,255,255)
                    OptionButton_1.TextSize = 14
                    OptionButton_1.ZIndex = 4

                    OptionButton_1.MouseButton1Click:Connect(function()
                        SelectedText_1.Text = optionText
                        Callback(optionText)
                        ToggleDropdown()
                    end)
                end
            end
            function Elements:AddLabel(Title)
                local LabelFrame_1 = Instance.new("Frame")
                local LabelText_1 = Instance.new("TextLabel")
                local UIPadding_11 = Instance.new("UIPadding")

                LabelFrame_1.Name = "LabelFrame"
                LabelFrame_1.Parent = Items_1
                LabelFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                LabelFrame_1.BackgroundTransparency = 1
                LabelFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                LabelFrame_1.BorderSizePixel = 0
                LabelFrame_1.Size = UDim2.new(0, 220,0, 20)

                LabelText_1.Name = "LabelText"
                LabelText_1.Parent = LabelFrame_1
                LabelText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                LabelText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                LabelText_1.BackgroundTransparency = 1
                LabelText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                LabelText_1.BorderSizePixel = 0
                LabelText_1.Position = UDim2.new(0.488499999, 0,0.5, 0)
                LabelText_1.Size = UDim2.new(0, 214,0, 20)
                LabelText_1.ClipsDescendants = true
                LabelText_1.Font = Enum.Font.SourceSans
                LabelText_1.Text = Title
                LabelText_1.TextColor3 = Color3.fromRGB(200,200,200)
                LabelText_1.TextSize = 14
                LabelText_1.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding_11.Parent = LabelText_1
                UIPadding_11.PaddingLeft = UDim.new(0,6)
            end
            function Elements:AddSlider(Title, Min, Max, Callback)
                local SliderFrame_1 = Instance.new("Frame")
                local SliderText_1 = Instance.new("TextLabel")
                local UIPadding_12 = Instance.new("UIPadding")
                local SliderHolder_1 = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local SliderButton_1 = Instance.new("TextButton")
                local SliderInner_1 = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")

                SliderFrame_1.Name = "SliderFrame"
                SliderFrame_1.Parent = Items_1
                SliderFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SliderFrame_1.BackgroundTransparency = 1
                SliderFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderFrame_1.BorderSizePixel = 0
                SliderFrame_1.Size = UDim2.new(0, 220,0, 20)
                
                SliderText_1.Name = "SliderText"
                SliderText_1.Parent = SliderFrame_1
                SliderText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SliderText_1.BackgroundTransparency = 1
                SliderText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderText_1.BorderSizePixel = 0
                SliderText_1.Position = UDim2.new(0.272727281, 0,0.5, 0)
                SliderText_1.Size = UDim2.new(0, 120,0, 20)
                SliderText_1.ClipsDescendants = true
                SliderText_1.Font = Enum.Font.SourceSans
                SliderText_1.Text = Title
                SliderText_1.TextColor3 = Color3.fromRGB(200,200,200)
                SliderText_1.TextSize = 14
                SliderText_1.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_12.Parent = SliderText_1
                UIPadding_12.PaddingLeft = UDim.new(0,6)
                
                SliderHolder_1.Name = "SliderHolder"
                SliderHolder_1.Parent = SliderFrame_1
                SliderHolder_1.AnchorPoint = Vector2.new(0, 0.5)
                SliderHolder_1.BackgroundColor3 = Color3.fromRGB(59,63,71)
                SliderHolder_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderHolder_1.BorderSizePixel = 0
                SliderHolder_1.Position = UDim2.new(0.577000022, 0,0.504999995, 0)
                SliderHolder_1.Size = UDim2.new(0, 90,0, 6)
                
                UICorner_6.Parent = SliderHolder_1
                UICorner_6.CornerRadius = UDim.new(0,15)
                
                SliderButton_1.Name = "SliderButton"
                SliderButton_1.Parent = SliderHolder_1
                SliderButton_1.Active = true
                SliderButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                SliderButton_1.BackgroundTransparency = 1
                SliderButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderButton_1.BorderSizePixel = 0
                SliderButton_1.Size = UDim2.new(0, 90,0, 6)
                SliderButton_1.Font = Enum.Font.SourceSans
                SliderButton_1.Text = ""
                SliderButton_1.TextSize = 14
                
                SliderInner_1.Name = "SliderInner"
                SliderInner_1.Parent = SliderButton_1
                SliderInner_1.BackgroundColor3 = Color3.fromRGB(96,102,116)
                SliderInner_1.BorderColor3 = Color3.fromRGB(0,0,0)
                SliderInner_1.BorderSizePixel = 0
                SliderInner_1.Size = UDim2.new(0, 0,0, 6)
                
                UICorner_7.Parent = SliderInner_1
                UICorner_7.CornerRadius = UDim.new(0,15)

                local isDragging = false

                SliderButton_1.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = true
                    end
                end)

                game:GetService("UserInputService").InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
                        isDragging = false
                    end
                end)

                game:GetService("RunService").RenderStepped:Connect(function()
                    if isDragging then
                        local mousePosition = game:GetService("UserInputService"):GetMouseLocation()
						local sliderPosition = SliderButton_1.AbsolutePosition
						local sliderWidth = SliderButton_1.AbsoluteSize.X
						local fillWidth = math.clamp(mousePosition.X - sliderPosition.X, 0, sliderWidth)
						SliderInner_1.Size = UDim2.new(0, fillWidth, 1, 0)
						local value = fillWidth / sliderWidth
						local displayValue = Min + (Max - Min) * value
						Callback(math.floor(displayValue + 0.5))
                    end
                end)
            end
            function Elements:AddButton(Title, Callback)
                local ButtonFrame_1 = Instance.new("Frame")
                local ButtonText_1 = Instance.new("TextLabel")
                local UIPadding_13 = Instance.new("UIPadding")
                local ButtonButton_1 = Instance.new("TextButton")
                local UIPadding_14 = Instance.new("UIPadding")

                ButtonFrame_1.Name = "ButtonFrame"
                ButtonFrame_1.Parent = Items_1
                ButtonFrame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ButtonFrame_1.BackgroundTransparency = 1
                ButtonFrame_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ButtonFrame_1.BorderSizePixel = 0
                ButtonFrame_1.Size = UDim2.new(0, 220,0, 20)
                
                ButtonText_1.Name = "ButtonText"
                ButtonText_1.Parent = ButtonFrame_1
                ButtonText_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ButtonText_1.BackgroundTransparency = 1
                ButtonText_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ButtonText_1.BorderSizePixel = 0
                ButtonText_1.Position = UDim2.new(0.289568126, 0,0.5, 0)
                ButtonText_1.Size = UDim2.new(0, 126,0, 20)
                ButtonText_1.ClipsDescendants = true
                ButtonText_1.Font = Enum.Font.SourceSans
                ButtonText_1.Text = Title
                ButtonText_1.TextColor3 = Color3.fromRGB(200,200,200)
                ButtonText_1.TextSize = 14
                ButtonText_1.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_13.Parent = ButtonText_1
                UIPadding_13.PaddingLeft = UDim.new(0,6)
                
                ButtonButton_1.Name = "ButtonButton"
                ButtonButton_1.Parent = ButtonFrame_1
                ButtonButton_1.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
                ButtonButton_1.BackgroundTransparency = 1
                ButtonButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
                ButtonButton_1.BorderSizePixel = 0
                ButtonButton_1.Position = UDim2.new(0.780141771, 0,0.5, 0)
                ButtonButton_1.Size = UDim2.new(0, 89,0, 20)
                ButtonButton_1.ClipsDescendants = true
                ButtonButton_1.Font = Enum.Font.SourceSans
                ButtonButton_1.Text = "Click"
                ButtonButton_1.TextColor3 = Color3.fromRGB(255,255,255)
                ButtonButton_1.TextSize = 14
                ButtonButton_1.TextXAlignment = Enum.TextXAlignment.Right
                
                UIPadding_14.Parent = ButtonButton_1
                UIPadding_14.PaddingRight = UDim.new(0,6)

                ButtonButton_1.MouseButton1Click:Connect(function()
                    local buttonClickTween = TweenService:Create(
                        ButtonButton_1, 
                        TweenInfo.new(0.1), 
                        {TextColor3 = Color3.fromRGB(200,200,200)}
                    )
                    buttonClickTween:Play()
    
                    buttonClickTween.Completed:Connect(function()
                        local buttonClickOffTween = TweenService:Create(
                            ButtonButton_1, 
                            TweenInfo.new(0.2), 
                            {TextColor3 = Color3.fromRGB(255,255,255)}
                        )
                        buttonClickOffTween:Play()
                    end)
                    Callback()
                end)
            end
            return Elements
        end
        return Sections
    end
    return Tabs
end
print("SkullWare - By Scott Calloway")
return Library
