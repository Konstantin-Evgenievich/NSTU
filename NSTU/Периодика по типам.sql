select  'Всего периодика', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
AND i.barcode between '13831000042935' and '13831000044266'
UNION
select  '1_Официальные издания', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
(substr(extractvalue(`b`.`metadata`,'//controlfield[@tag=008]'),28,1) in ('f','i','l','a','o'))
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '2_Научные издания', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=901][1]/subfield[@code="a"]') LIKE 'Научные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '3_Учебные издания', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=900][1]/subfield[@code="a"]') LIKE 'Учебные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))		
UNION
SELECT  '4_Справочно-библиографические издания', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE

(substr(extractvalue(`b`.`metadata`,'//controlfield[@tag=008]'),25,1) in ('b', 'd', 'e') 
OR substr(extractvalue(`b`.`metadata`,'//controlfield[@tag=008]'),26,1) in ('b', 'd', 'e') 
OR substr(extractvalue(`b`.`metadata`,'//controlfield[@tag=008]'),27,1) in ('b', 'd', 'e') 
OR substr(extractvalue(`b`.`metadata`,'//controlfield[@tag=008]'),28,1) in ('b', 'd', 'e')) 
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))		
									
								