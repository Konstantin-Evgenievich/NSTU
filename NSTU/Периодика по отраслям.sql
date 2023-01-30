select  'Всего периодика', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
AND i.barcode between '13831000042935' and '13831000044266'	
UNION
select  '1 естественно-научные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][2]/subfield[@code="a"]') LIKE 'естественно%'
AND i.barcode between '13831000042935' and '13831000044266'	
UNION
select  '2 технические журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][2]/subfield[@code="a"]') LIKE 'технические%'
AND i.barcode between '13831000042935' and '13831000044266'	
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						WHERE i.barcode between '13831000042935' and '13831000044266'	
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
							UNION
SELECT  '3 социально-экономические журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][2]/subfield[@code="a"]') LIKE 'социально%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000038485' and '13831000040056'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))		
UNION
SELECT  '4 гуманитарные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][2]/subfield[@code="a"]') LIKE 'гуманитарные%'
AND i.barcode between '13831000042935' and '13831000044266'	
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						WHERE  i.barcode between '13831000042935' and '13831000044266'	
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))		
UNION							
SELECT  '5 художественные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][2]/subfield[@code="a"]') LIKE 'художественные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						WHERE  i.barcode between '13831000042935' and '13831000044266'	
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))		
									