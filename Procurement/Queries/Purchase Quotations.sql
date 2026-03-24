SELECT
    T0.DocNum        ,
    T0.DocDate       ,
    T0.CardCode      ,
    T0.CardName     ,
    T1.ItemCode      ,
    T1.Dscription    ,
    T1.Quantity      ,
    T1.Price        ,
    T1.LineTotal     ,
    T0.DocTotal      ,
    T1.TargetType  ,
    T1.TrgetEntry    
FROM OPQT T0
INNER JOIN PQT1 T1 
    ON T0.DocEntry = T1.DocEntry
WHERE T0.CANCELED = 'N'
ORDER BY T0.DocNum OFFSET 0 ROWS
