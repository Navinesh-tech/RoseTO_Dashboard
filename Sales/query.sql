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
INNER JOIN INV1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN OCRG T6 ON T5.GroupCode = T6.GroupCode
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
INNER JOIN RIN1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN OCRG T6 ON T5.GroupCode = T6.GroupCode
WHERE T0.DocDate >= '2022-01-01'
AND T0.CANCELED = 'N'
