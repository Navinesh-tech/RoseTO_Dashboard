SELECT
T0.DocEntry,
    T0.DocNum       ,
    T0.DocDate       ,
    T0.DocDueDate   ,
    T0.CardCode     ,
    T0.CardName     ,
    T1.ItemCode      ,
    T1.Dscription  ,
    T1.Quantity      ,
    T1.OpenQty       ,
    T1.Price         ,
    T1.LineTotal    ,
    T0.DocTotal     ,
    T1.TrgetEntry    ,
    T1.TargetType    
    
FROM OPOR T0
INNER JOIN POR1 T1 
    ON T0.DocEntry = T1.DocEntry
WHERE T0.CANCELED = 'N'
ORDER BY T0.DocNum OFFSET 0 ROWS
