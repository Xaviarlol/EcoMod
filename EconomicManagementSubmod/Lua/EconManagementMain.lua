-- EconManagementMain.lua

-- Opens the Economic Management main window
function OpenEconManagementMainWindow()
    Controls.EconManagementMainWindow:SetHide(false)
end

-- Closes the Economic Management main window
function OnCloseMainWindow()
    Controls.EconManagementMainWindow:SetHide(true)
end

-- Callback for when the EconMgmtButton is clicked.
function OnEconMgmtButtonClicked()
    OpenEconManagementMainWindow()
end

-- Callback to open the Loan window.
function OnOpenLoanWindow()
    OpenLoanWindow()  -- This function is defined in LoanWindowLogic.lua
end

-- Input handler to open the window with the '9' key for testing purposes
function InputHandler(uiMsg, wParam, lParam)
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_9 then
            OnEconMgmtButtonClicked()
            return true
        end
    end
    return false
end

ContextPtr:SetInputHandler(InputHandler)

-- Initialize the main window and register callbacks
function InitializeEconManagementMain()
    -- Hide the main window at start.
    Controls.EconManagementMainWindow:SetHide(true)

    -- Register button callbacks for controls defined in your XML
    if Controls.EconMgmtButton then
        Controls.EconMgmtButton:RegisterCallback(Mouse.eLClick, OnEconMgmtButtonClicked)
    end
    if Controls.OpenLoanButton then
        Controls.OpenLoanButton:RegisterCallback(Mouse.eLClick, OnOpenLoanWindow)
    end
    if Controls.CloseButton then
        Controls.CloseButton:RegisterCallback(Mouse.eLClick, OnCloseMainWindow)
    end
end

InitializeEconManagementMain()

-- Registers the top panel button's callback.
function InitializeEconTopPanelButton()
    if Controls.EconTopPanelButton then
        Controls.EconTopPanelButton:RegisterCallback(Mouse.eLClick, OnEconMgmtButtonClicked)
    end
end

InitializeEconTopPanelButton()
