SELECT
    T0.DocNum,
    T0.DocDate,
    T0.CardCode,
    T0.CardName,
    T0.DocTotal,
    T0.VatSum,
    T0.DiscSum,    
    T1.ItemCode,
    T1.Quantity,
    T1.LineTotal,
    T1.TrgetEntry

FROM ORPC T0
INNER JOIN RPC1 T1 
    ON T0.DocEntry = T1.DocEntry
WHERE T0.CANCELED = 'N'
