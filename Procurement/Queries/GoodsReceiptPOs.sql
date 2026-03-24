SELECT
    T0.DocNum        ,
    T0.DocEntry,
    T0.DocDate     ,

    T0.CardCode,
    T0.CardName,

    T1.ItemCode,
    T1.Quantity,
    T1.LineTotal,

    T1.BaseEntry    ,

    T2.DocNum        ,
    T2.DocDate       , 
    T2.DocDueDate  ,      

    T0.DocTotal

FROM OPDN T0
INNER JOIN PDN1 T1 
    ON T0.DocEntry = T1.DocEntry

LEFT JOIN OPOR T2 
    ON T1.BaseEntry = T2.DocEntry

WHERE T0.CANCELED = 'N'
