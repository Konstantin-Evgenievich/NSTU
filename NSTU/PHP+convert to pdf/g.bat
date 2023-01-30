@echo off: скрывает отображаемый текст;
@chcp 1251
wkhtmltopdf http://localhost/ "Актуальное кол-во библ.записей".pdf
wkhtmltopdf http://localhost2/ "Актуальное кол-во библ.записей2".pdf
TIMEOUT 3
taskkill /im cmd.exe
exit


