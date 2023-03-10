select  '????? ?????????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
AND i.barcode between '13831000042935' and '13831000044266'
UNION
SELECT  '1 ???????????????? ???????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE '????????????????%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '2 ??????? ???????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE '???????%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '3 ??????-?????????? ???????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE '??????%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '4 ???????????? ???????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE '????????????%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))
UNION
select  '5  ???????????????? ???????', COUNT(barcode)  as ???_??
FROM 
items AS i  
INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
WHERE
EXTRACTVALUE(b.metadata,'//datafield[@tag=653][1]/subfield[@code="a"]') LIKE '????????????????%'
AND i.barcode between '13831000042935' and '13831000044266'
AND i.barcode NOT IN (
		SELECT  barcode
			FROM 
				items AS i  
					INNER JOIN biblio_metadata AS b ON (i.biblionumber=b.biblionumber)
						where i.barcode between '13831000042935' and '13831000044266'
							AND (i.withdrawn = '1' OR i.withdrawn = '3'))

