-- =======SELECT-WHERE=====
create table ogrenciler(
id int,
name varchar(45),
adress varchar(100),
examen_not int
);

Insert into ogrenciler values(123, 'Ali Can', 'Ankara',75);
Insert into ogrenciler values(124, 'Merve Gul', 'Ankara',85);
Insert into ogrenciler values(125, 'Kemal YAsa', 'Istanbul',85);

select* from ogrenciler;

/*============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/
/*-----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select*from ogrenciler
 where examen_not>80;
 
 /*-----------------------------------------------------------------------------
 ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/
 select name, adress from ogrenciler where adress='Ankara';
 
 /*-----------------------------------------------------------------------------
ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select*from ogrenciler
 where id=124;
 
 select * from ogrenciler 
 where id between 123 and 124; 
 
 /*======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );
    
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);
    
-- not: BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumleri tek komutla yazabilme imkani verir
-- yazdigimiz iki sinir da araliga dahildir

/*===========================================================================
 ===  And (Ve) Operatörü Kullanımı
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
=====Or (Veya) Operatörü Kullanımı=====
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir. =*/
/*
ORNEK4: id’si 10002 ile 10005 arasında olan personelin bilgilerini listele
*/
-- 1. yol
select * from personel where id between '10002' and '10005';
-- 2.yol
select*from personel where id>= '10002' and id <='10005';

/*==========================================================================
ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
listeleyiniz. 
personelin bilgilerini listele
===========================================================================*/

select * from personel where isim between 'Mehmet Yilmaz' and 'Veli Han';
-- sadece isimleri gormek istesek * yerine isim yazariz


/* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
 select * from personel
 where id='10001' or id='10002' or id='10004';
-- kisa yolu
select * from personel
where id in(10001,10002,10004);

/* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
select * from personel 
where maas in(7000, 12000);

select * from personel 
where maas=7000 or isim='meyem ';
/*
select * from personel
where maas in(7000, 'meryem'
boyle yazamayiz iki farkli data!!!!
*/

/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */

/*
ornek 9: Ismi A harfi ile baslayanlari listeleyiniz
*/
select*from personel 
where isim like 'a%';

/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 select*from personel
 where isim like '%n';
 
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel
 where isim like '_e%';
 
 /* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
select * from personel
where isim like '_e%y%';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel
 where isim not like '%a%'; /*%basina da bilmiyorum % sonunu da bilmiyorum demek*/
 
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/  
 select * from personel
 where maas like '_____'; /*bes tane alt tire yaptik*/
 /* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  
 select * from personel
 where isim like 'a_____a%';
