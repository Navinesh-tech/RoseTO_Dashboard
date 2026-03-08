SELECT
    -- Production Header
    T0.DocNum        AS ProductionOrderNo,
    T0.PostDate      AS PostingDate,
    T0.ItemCode      AS FGCode,
    T0.ProdName      AS FGName,
    T4.ItmsGrpNam    AS FlowerType,

    T0.PlannedQty,
    T0.CmpltQty      AS CompletedQty,
    T0.Status,

    -- Component Details
    T1.ItemCode      AS ComponentCode,
    T1.ItemName      AS ComponentName,
    T1.PlannedQty    AS ComponentPlannedQty,
    T1.IssuedQty,

    -- Warehouse
    T1.Warehouse     AS WarehouseCode,
    T5.WhsName       AS WarehouseName,

    -- Reject from Goods Issue
    T6.ItemCode      AS RejectItem,
    T6.Quantity      AS RejectQty

FROM OWOR T0

INNER JOIN WOR1 T1
    ON T0.DocEntry = T1.DocEntry

INNER JOIN OITM T3
    ON T0.ItemCode = T3.ItemCode

INNER JOIN OITB T4
    ON T3.ItmsGrpCod = T4.ItmsGrpCod

LEFT JOIN OWHS T5
    ON T1.Warehouse = T5.WhsCode

LEFT JOIN IGE1 T6
    ON T6.BaseEntry = T0.DocEntry
    AND T6.BaseType = 202

WHERE
    T0.Status <> 'C'

ORDER BY
    T0.DocNum;
