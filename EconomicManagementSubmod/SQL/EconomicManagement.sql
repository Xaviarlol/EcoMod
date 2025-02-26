-- EconomicManagement.sql
-- This is a sample SQL schema for storing loan records.
CREATE TABLE IF NOT EXISTS LoanRecords (
    RecordID INTEGER PRIMARY KEY AUTOINCREMENT,
    PlayerID INTEGER,
    BorrowAmount INTEGER,
    LoanDuration INTEGER,
    InterestPerTurn INTEGER,
    TotalRepayment INTEGER,
    StartTurn INTEGER
);
