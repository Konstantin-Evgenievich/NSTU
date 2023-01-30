select  'Всего периодика', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
AND i.barcode between '13831000042935' and '13831000044266'
UNION
SELECT  '1 производственные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE 'производственные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '2 научные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE 'научные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '3 научно-популярные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE 'научно%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '4 реферативные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE 'реферативные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '5  профессиональные журналы', COUNT(barcode)  as Кол_во
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE 'профессиональные%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))

