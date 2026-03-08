SELECT 
    T0.DocNum,
    T0.DocDate,
    T0.CardCode,
    T0.CardName,
    T6.GroupName,
    T1.ItemCode,
    T1.Dscription,
    T1.Quantity,
    T1.TotalFrgn,
    T1.LineTotal,
    T2.SlpName,
    T4.ItmsGrpNam,
    T1.WhsCode
FROM OINV T0
INNER JOIN dbo.INV1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN dbo.OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN dbo.OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN dbo.OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN dbo.OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN dbo.OCRG T6 ON T5.GroupCode = T6.GroupCode
WHERE T0.DocDate >= '2022-01-01'
AND T0.CANCELED = 'N'

UNION ALL

SELECT 
    T0.DocNum,
    T0.DocDate,
    T0.CardCode,
    T0.CardName,
    T6.GroupName,
    T1.ItemCode,
    T1.Dscription,
    T1.Quantity * -1,
    T1.TotalFrgn * -1,
    T1.LineTotal * -1,
    T2.SlpName,
    T4.ItmsGrpNam,
    T1.WhsCode
FROM ORIN T0
INNER JOIN dbo.RIN1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN dbo.OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN dbo.OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN dbo.OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN dbo.OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN dbo.OCRG T6 ON T5.GroupCode = T6.GroupCode
WHERE T0.DocDate >= '2022-01-01'
AND T0.CANCELED = 'N'
