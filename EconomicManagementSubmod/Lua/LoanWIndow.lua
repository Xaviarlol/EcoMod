-- LoanWindowLogic.lua

-- Assume these values are placeholders; adjust as needed
local iCurrentEra = Players[Game.GetActivePlayer()]:GetCurrentEra()

local eraBorrowCaps = {
  [GameInfoTypes.ERA_ANCIENT]       = 500,
  [GameInfoTypes.ERA_CLASSICAL]     = 1000,
  [GameInfoTypes.ERA_MEDIEVAL]      = 1500,
  [GameInfoTypes.ERA_RENAISSANCE]   = 2000,
  [GameInfoTypes.ERA_INDUSTRIAL]    = 3000,
  [GameInfoTypes.ERA_MODERN]        = 5000,
  [GameInfoTypes.ERA_POSTMODERN]    = 7000,
  [GameInfoTypes.ERA_FUTURE]        = 10000,
}

local borrowAmount = 0
local loanDuration = 0
local interestPerTurn = 0

local function GetBorrowCap()
  return eraBorrowCaps[iCurrentEra] or 500
end

function SetBorrowAmount(amount)
  local cap = GetBorrowCap()
  borrowAmount = math.min(amount, cap)
  UpdateLoanDisplay()
end

function SetLoanDuration(duration)
  loanDuration = duration
  UpdateLoanDisplay()
end

function SetInterestRate(rate)
  interestPerTurn = rate
  UpdateLoanDisplay()
end

function UpdateLoanDisplay()
  Controls.BorrowAmountLabel:SetText("Borrow Amount: " .. tostring(borrowAmount) .. " Gold")
  Controls.LoanDurationLabel:SetText("Duration: " .. tostring(loanDuration) .. " turns")
  Controls.InterestRateLabel:SetText("Interest per Turn: " .. tostring(interestPerTurn) .. " Gold")
end

function OnConfirmLoan()
  local totalInterest = interestPerTurn * loanDuration
  local totalRepayment = borrowAmount + totalInterest
  print("Loan confirmed: Borrow " .. borrowAmount .. " Gold, Duration " .. loanDuration ..
        " turns, Interest " .. interestPerTurn .. " Gold per turn, Total Repayment " .. totalRepayment)
  
  Players[Game.GetActivePlayer()]:ChangeGold(borrowAmount)
  
  -- Here, you could store loan details in a persistent table.
  
  OnCloseLoanWindow()
end

function OpenLoanWindow()
  Controls.LoanWindow:SetHide(false)
  -- Set default values; these can be adjusted
  SetBorrowAmount(0)
  SetLoanDuration(5)
  SetInterestRate(10)
end

function OnCloseLoanWindow()
  Controls.LoanWindow:SetHide(true)
end
