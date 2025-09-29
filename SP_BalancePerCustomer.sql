CREATE PROCEDURE BalancePerCustomer 
    @customer_name NVARCHAR(255)
AS
BEGIN 
    SELECT
        DC.CustomerName,
        DA.AccountType,
        DA.Balance, 
        (DA.Balance + ISNULL(SUM(CASE 
                WHEN FT.Transaction_type = 'Deposit' THEN FT.Amount 
                ELSE -FT.Amount 
            END), 0)) AS CurrentBalance
    FROM
        DimCustomer DC 
    INNER JOIN
        DimAccount DA ON DC.CustomerID = DA.CustomerID 
    LEFT JOIN
        FactTransaction FT ON DA.AccountID = FT.AccountID
    WHERE
        DC.CustomerName = @customer_name
        AND DA.Status = 'Active'
    GROUP BY
        DC.CustomerName, DA.AccountType, DA.Balance
    ORDER BY
        DC.CustomerName, DA.AccountType;
END
