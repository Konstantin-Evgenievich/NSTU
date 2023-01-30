SELECT  '1 учебные', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE (substr(extractvalue(`b`.`metadata`,'//leader'),8,1) IN ('m', 's') 
AND extractvalue(`b`.`metadata`,'//datafield[@tag=900]/subfield[@code="a"]') LIKE '%учебные%' 
AND extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%CD%')

UNION
SELECT  '2 научные', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE (substr(extractvalue(`b`.`metadata`,'//leader'),8,1) IN ('m', 's') 
and extractvalue(`b`.`metadata`,'//datafield[@tag=901]/subfield[@code="a"]') LIKE 'научные%'
and extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%CD%')

UNION
SELECT  '3 художественные', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE (substr(extractvalue(`b`.`metadata`,'//leader'),8,1) IN ('m', 's') 
and extractvalue(`b`.`metadata`,'//datafield[@tag=852]/subfield[@code="h"]') LIKE '84%'
and extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%CD%')

UNION
SELECT  '4 учебное пособие', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE (substr(extractvalue(`b`.`metadata`,'//leader'),8,1) IN ('m', 's')) 
AND (extractvalue(`b`.`metadata`,'//datafield[@tag=951]/subfield[@code="b"]') LIKE '%учебное пособие%'
and extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%CD%')

UNION
SELECT  '5 DVD', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE (substr(extractvalue(`b`.`metadata`,'//leader'),8,1) IN ('m', 's')) 
AND (extractvalue(`b`.`metadata`,'//datafield[@tag=900]/subfield[@code="a"]') LIKE '%чебн%'
AND extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%DVD%')
or (extractvalue(`b`.`metadata`,'//datafield[@tag=901]/subfield[@code="a"]') LIKE 'науч%'
AND extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%DVD%')
OR (extractvalue(`b`.`metadata`,'//datafield[@tag=852]/subfield[@code="h"]') LIKE '84%'
and extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%CD%')
OR (extractvalue(`b`.`metadata`,'//datafield[@tag=951]/subfield[@code="b"]') LIKE '%учебное пособие%'
and extractvalue(`b`.`metadata`,'//datafield[@tag=300]/subfield[@code="a"]') LIKE '%DVD%')





