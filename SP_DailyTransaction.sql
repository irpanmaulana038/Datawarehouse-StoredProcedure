CREATE PROCEDURE DailyTransaction
  
    @start_date DATE,
    @end_date DATE
AS
BEGIN
    
    SELECT    
        CONVERT(DATE, TransactionDate) AS [Date],
        COUNT(TransactionID) AS TotalTransactions,
        SUM(Amount) AS TotalAmount
    FROM
        FactTransaction 
    WHERE
        TransactionDate BETWEEN @start_date
        AND  @end_date
    GROUP BY
        CONVERT(DATE, TransactionDate)
    ORDER BY
        [Date] ASC;
END