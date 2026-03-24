SELECT
    T0.DocEntry,
    T0.DocNum,
    T0.DocDate,
    T0.CardCode,
    T0.CardName,
    T0.DocTotal,
    T0.VatSum,
    T0.DiscSum,
    
    T0.PaidToDate       AS 'Paid To Date',
    (T0.DocTotal - T0.PaidToDate) AS 'Balance Due',
    
    T1.ItemCode,
    T1.Quantity,
    T1.LineTotal,
    T1.TrgetEntry

FROM OPCH T0
INNER JOIN PCH1 T1 
    ON T0.DocEntry = T1.DocEntry

WHERE T0.CANCELED = 'N'
