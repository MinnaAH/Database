-- a) VIP asiakkaiden lisääminen kantaan
INSERT INTO vip VALUES ((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Tampere'), 'Matti', 'Rauhala', '1991-05-28', 'matti@gmail.com', '0507716987'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Tampere'), 'Miia', 'Rauhala', '1987-04-01', 'miia@gmail.com', '0417904657'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Tampere'), 'Laura', 'Olkinen', '1999-03-15', 'laura@gmail.com', '0400845590'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Helsinki'), 'Kimmo', 'Saari', '1988-06-06', 'kimmo@gmail.com', '0509874221'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Helsinki'), 'Mika', 'Ojanperä', '1993-06-10', 'mika@gmail.com', '0507369999'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Oulu'), 'Juha', 'Kaatiala', '1991-04-27', 'jiha@gmail.com', '0505792228'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Jyväskylä'), 'Isabella', 'Kanto', '1993-07-21', 'isabella@gmail.com', '0407663225'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Turku'), 'Kiia', 'Laakso', '1989-01-05', 'kiia@gmail.com', '0500060779'),
((SELECT TUNNUS FROM yokerho WHERE KAUPUNKI = 'Jyväskylä'), 'Doris', 'Miettinen', '1994-12-03', 'doris@gmail.com', '0507931585');

-- b) Kaikki VIP-asiakkaat, jotka ovat yli 30 vuotiaita
-- DATEDIFF funktiolla lasketaan päivät, jotka ovat tämän päivän ja asiakkaan syntymäpäivän välissä. 
-- FLOOR funktio pyöristää arvon alaspäin. 
SELECT FLOOR(DATEDIFF(current_date(), SYNTYMAPAIVA) / 365.25), ETUNIMI, SUKUNIMI from vip WHERE FLOOR(DATEDIFF(current_date(), SYNTYMAPAIVA) / 365.25) >= 30;

-- c) Kaikki tuotteet, joille ei ole määritelty hintaa
-- Tietokantaa piti muokata tässä välissä, sillä olin määritellyt hinnan pakolliseksi tiedoksi
SELECT * FROM JUOMAT WHERE HINTA IS NULL;

-- d) Tietyn artistin esiintymiskerrat yökerhoissa
SELECT COUNT(NIMI) FROM esiintyjat WHERE NIMI = 'HIM';

-- e) Yökerhon vastuuhenkilön muuttaminen kantaan
-- Muokataan nimi, tunnus ja sähköposti, puhelinnumero pysyy samana. Oletetan tämän olevan yökerhon oma numero.
UPDATE paalikko
SET ETUNIMI = 'Miia', SUKUNIMI = 'Jokinen', EMAIL = 'miia.jokinen@nightclub.com', TUNNUS = 123
WHERE TUNNUS = 658;

-- f) tuotteiden hinta luokittelu
SELECT NIMI AS Halpa FROM juomat WHERE hinta < 3;
SELECT NIMI AS Keskihintainen FROM juomat WHERE HINTA BETWEEN 3 AND 10;
SELECT NIMI AS Kallis FROM juomat WHERE HINTA > 10;

SELECT NIMI AS Halpa FROM purtavat WHERE hinta < 3;
SELECT NIMI AS Keskihintainen FROM purtavat WHERE HINTA BETWEEN 3 AND 10;
SELECT NIMI AS Kallis FROM purtavat WHERE HINTA > 10;