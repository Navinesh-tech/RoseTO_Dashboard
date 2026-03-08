SELECT 
    T0.DocNum AS DocNum,
    T0.DocDate AS DocDate,
    T0.CardCode AS CardCode,
    T0.CardName AS CardName,
    T6.GroupName AS GroupName,
    T1.ItemCode AS ItemCode,
    T1.Dscription AS Description,
    T1.Quantity AS Quantity,
    T1.TotalFrgn AS TotalFrgn,
    T1.LineTotal AS [Total Sales],
    T4.ItmsGrpNam AS [Item Name],
    T2.SlpName AS [Sales Person],
    T1.WhsCode AS WhsCode,
    T0.U_TOS AS SalesType
FROM OINV T0
INNER JOIN INV1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN OCRG T6 ON T5.GroupCode = T6.GroupCode
WHERE 
    T0.DocDate >= '2022-01-01'
    AND T0.CANCELED = 'N'

UNION ALL

SELECT 
    T0.DocNum AS DocNum,
    T0.DocDate AS DocDate,
    T0.CardCode AS CardCode,
    T0.CardName AS CardName,
    T6.GroupName AS GroupName,
    T1.ItemCode AS ItemCode,
    T1.Dscription AS Description,
    T1.Quantity * -1 AS Quantity,
    T1.TotalFrgn * -1 AS TotalFrgn,
    T1.LineTotal * -1 AS [Total Sales],
    T4.ItmsGrpNam AS [Item Name],
    T2.SlpName AS [Sales Person],
    T1.WhsCode AS WhsCode,
    T0.U_TOS AS SalesType
FROM ORIN T0
INNER JOIN RIN1 T1 ON T0.DocEntry = T1.DocEntry
INNER JOIN OSLP T2 ON T0.SlpCode = T2.SlpCode
INNER JOIN OITM T3 ON T1.ItemCode = T3.ItemCode
INNER JOIN OITB T4 ON T3.ItmsGrpCod = T4.ItmsGrpCod
INNER JOIN OCRD T5 ON T0.CardCode = T5.CardCode
INNER JOIN OCRG T6 ON T5.GroupCode = T6.GroupCode
WHERE 
    T0.DocDate >= '2022-01-01'
    AND T0.CANCELED = 'N'
