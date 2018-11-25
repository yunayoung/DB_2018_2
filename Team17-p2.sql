
CREATE TABLE CUSTOMER(
   Customer_id   VARCHAR(15)   NOT NULL,
   Password VARCHAR(10)    NOT NULL,
   Address   VARCHAR(20)   NOT NULL,
  Phone_number   VARCHAR(15)   NOT NULL,
   Sex   CHAR,
   Age   int,
   Job   VARCHAR(15),
   Type   CHAR , #(R,W,E) 도매업, 소매업, 기타 표기
   Name   VARCHAR(20),
   PRIMARY KEY(Customer_id)
);


CREATE TABLE BAG(
   Bag_id   int   DEFAULT 0 NOT NULL,
   Total_num   int,
   Ordered CHAR NOT NULL,#N Y
   When_order   DATE,
   Customer_id   VARCHAR(15)   NOT NULL,
   Shipping_id int NOT NULL,
   PRIMARY KEY(Bag_id,Customer_id)
);


CREATE TABLE SHIPPING(
   Shipping_id int NOT NULL,
   Shipping_name   VARCHAR(20),
   Where_shipping VARCHAR(60), #어느지역으로 배송되는지 ex) 경기도, 경상도
   PRIMARY KEY(Shipping_id) 

 );
CREATE TABLE PUT_IN(
   Bag_id int   DEFAULT 0 NOT NULL, -- foreignkey from BAG 
   Item_id VARCHAR(15)   NOT NULL, -- foreignkey from ITEM 아이템번호
   Item_num   int   NOT NULL, # 각 아이템마다 주문수
   Customer_id VARCHAR(15)   NOT NULL,
   PRIMARY KEY(Bag_id,Item_id,Customer_id)
);
 ALTER TABLE BAG ADD FOREIGN KEY (Customer_id) REFERENCES CUSTOMER(Customer_id)
 ON DELETE CASCADE;
 ALTER TABLE PUT_IN ADD FOREIGN KEY (Bag_id,Customer_id) REFERENCES BAG(Bag_id,Customer_id)
 ON DELETE CASCADE;

 ALTER TABLE BAG ADD FOREIGN KEY (Shipping_id) REFERENCES SHIPPING(Shipping_id)
 ON DELETE CASCADE;

ALTER TABLE BAG DROP FOREIGN KEY Customer_id;




INSERT INTO SHIPPING VALUES (1,'Main','Seoul, Gyeonggido');
INSERT INTO SHIPPING VALUES (2,'Right','Gyeongsangdo, Daegu, Jejudo, Busan,Ulsan,Gangwondo');
INSERT INTO SHIPPING VALUES (3,'Left','Jeonlado, Chungcheongbugdo,Daejeon,Gwangju,Incheon');


INSERT INTO CUSTOMER VALUES ('admin','admin','Daegu','010-2085-2479',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaeminjj','1234567','Daegu','010-2085-1341',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('aaaabbb','1234567','Daegu','010-2085-2473',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('aaaabbbb','1234567','Seoul',010-2085-2471,NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('ccccbbb','1234567','Seoul','010-2085-1234',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('ddddbbb','1234567','Gangwon-do','010-2085-1235',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin12','1234567','Seoul','010-2085-1231',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin23','1234567','Daegu','010-2085-1982',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin45','1234567','Seoul','010-2083-1984',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin67','1234567','Busan','010-2082-1922',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin89','1234567','Daegu','010-1085-9191',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin10','1234567','Daejeon','010-2985-1010',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin11','1234567','Daejeon','010-2985-7272',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin13','1234567','Daejeon','010-7385-1039',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin14','1234567','Daejeon','010-3235-3129',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin15','1234567','Daejeon','010-1379-1010',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('jaemin16','1234567','Seoul','010-9185-3929',NULL,NULL,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('yunay','1234567','Daejeon','010-9090-1341','m',19,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('yunay1','1234567','Jejudo','010-2085-2473','m',30,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('yunay12','1234567','Jejudo','010-2085-2471','m',40,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('adsffasf','1234567','Seoul','010-2085-1234','m',20,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('adsf231','1234567','Daegu','010-2085-1341','f',19,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('aafsvov','1234567','Daegu','010-2085-2473','f',30,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('boblizer','1234567','Seoul','010-1234-2471','m',40,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('ilikeme','1234567','Seoul','010-2342-1234','m',20,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('youlikeyou','1234567','Daegu','010-3223-1341','m',19,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('totoutm','1234567','Daegu','010-2333-2473','m',30,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('mycute134','1234567','Seoul','010-1234-2471','m',40,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('tokyohigh','1234567','Seoul','010-2233-9822','f',20,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('tougotthe','1234567','Daejeon','010-4323-1341','m',19,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('foxissaying','1234567','Daejeon','010-5323-2473','f',27,NULL,NULL,NULL);

INSERT INTO CUSTOMER VALUES ('iliketogo','1234567','Seoul','010-9191-8999','m',40,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('iwantto','1234567','Jejudo','010-0515-9505','m',20,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('stoppressing','1234567','Jejudo','010-1777-1247','f',20,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('pleasegive','1234567','Daegu','010-2085-1341','m',19,NULL,NULL,NULL);
INSERT INTO CUSTOMER VALUES ('whoaretou','1234567','Daegu','010-2085-2473','f',27,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('whoami','1234567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('thisisis','1234567','Seoul','010-2085-1234','m',20,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('ayounffn','1234567','Daegu','010-2085-2473','f',27,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('jongmang','1234567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('thisistohot','1234567','Seoul','010-2085-1234','m',20,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('iamnotayoung','1234567','Daegu','010-2085-2473','f',27,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('tooldtogo','1234567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('sadm1ego','1234567','Seoul','010-2085-1234','m',20,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('sen1dmego','1234567','Daegu','010-2085-2473','f',27,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('thisisanother','1231567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('levelisgoingto','1234567','Seoul','010-2085-1234','m',20,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('goonamou','1234567','Daegu','010-2085-2473','f',27,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('ntaintisfact','1234567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('notayoungguy','1234567','Seoul','010-2085-1234','m',20,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('aaaa1','1234567','Daegu','010-2085-2473','f',34,'docter','r',NULL);
INSERT INTO CUSTOMER VALUES ('aafabbb','1234567','Seoul','010-2085-2471','m',40,'teacher','e',NULL);
INSERT INTO CUSTOMER VALUES ('cbaby','1234567','Seoul','010-2085-1234','m',28,'police','r',NULL);
INSERT INTO CUSTOMER VALUES ('icobgggba','1234567','Seoul','010-2085-1234','m',20,'police','w',NULL);
INSERT INTO CUSTOMER VALUES ('iaacob','1234567','Seoul','010-2085-1234','m',29,'teacher','w',NULL);
INSERT INTO CUSTOMER VALUES ('lasldflk','1234567','Seoul','010-2085-1234','m',21,'police','w',NULL);
INSERT INTO CUSTOMER VALUES ('iamndfef','1234567','Seoul','010-2085-1234','m',21,'employee','w',NULL);
INSERT INTO CUSTOMER VALUES ('timegotto','1234567','Jeonlado','010-2085-1234','f',22,'employee','w',NULL);
INSERT INTO CUSTOMER VALUES ('beachis','1234567','Jeonlado','010-2085-1234','m',23,'police','w',NULL);
INSERT INTO CUSTOMER VALUES ('itisnotapark','1234567','Jeonlado','010-2085-1234','m',24,'police','w',NULL);
INSERT INTO CUSTOMER VALUES ('neverlandtogo','1234567','Jeonlado','010-2085-1234','m',24,'cashier','r',NULL);
INSERT INTO CUSTOMER VALUES ('dogisgoing','1234567','Jeonlado','010-2085-2473','f',27,'docter','r','JaeminJeon');
INSERT INTO CUSTOMER VALUES ('lionandtiger','1234567','Jeonlado','010-2085-1234','m',20,'police','r','Yoonayyoz');
INSERT INTO CUSTOMER VALUES ('fisherman','1234567','Jeonlado','010-2085-2473','f',27,'docter','r','KIMCHeong');
INSERT INTO CUSTOMER VALUES ('wehavenothing','1234567','Jeonlado','010-2085-1234','m',20,'bank_clerk','r','Kimayyoung');
INSERT INTO CUSTOMER VALUES ('touhavtolove','1234567','Jeonlado','010-2085-2473','f',27,'docter','r','kujinlee');


CREATE TABLE ITEM(
   Item_id   VARCHAR(15)   NOT NULL,
   Iname   VARCHAR(30)   NOT NULL,
   Regulated_price   int   NOT NULL,
   Inum   int  NOT NULL,  
   Soldnum   int DEFAULT 0, 
   Category_id int, #foreignkey of Category_id of CATEGORY
   Brand_id int, #foreignkey of Brand_id of BRAND
   PRIMARY KEY(Item_id)
);

CREATE TABLE CATEGORY(
   Category_id int NOT NULL,
   C_main   VARCHAR(20),
   C_middle   VARCHAR(20),
   C_small   VARCHAR(20),
   PRIMARY KEY(Category_id)
);

CREATE TABLE BRAND(
   Brand_id int NOT NULL,
   Brand_name   VARCHAR(20),
   PRIMARY KEY(Brand_id)
);

CREATE TABLE SUPPLIER(
   Supplier_id int NOT NULL,
   Sp_name VARCHAR(5),
   PRIMARY KEY(Supplier_id)
);

CREATE TABLE SUPPLIED_BY(
   Supplier_id int   NOT NULL,
   Brand_id   int  NOT NULL,
   PRIMARY KEY(Supplier_id, Brand_id)
);


INSERT INTO CATEGORY VALUES(11,'Safetygoods','Faceshield','Goggle');
INSERT INTO CATEGORY VALUES(12,'Safetygoods','Faceshield','Soundproof');
INSERT INTO CATEGORY VALUES(13,'Safetygoods','Faceshield','Glasses');
INSERT INTO CATEGORY VALUES(21,'Safetygoods','Safetyshoes','Wintershoes');
INSERT INTO CATEGORY VALUES(22,'Safetygoods','Safetyshoes','Safetyshoes');
INSERT INTO CATEGORY VALUES(23,'Safetygoods','Safetyshoes','Workshoes');
INSERT INTO CATEGORY VALUES(31,'IndustrialSupply','Light','LEDlamp');
INSERT INTO CATEGORY VALUES(32,'IndustrialSupply','Light','Work_lights');
INSERT INTO CATEGORY VALUES(33,'IndustrialSupply','Light','Emitter');
INSERT INTO CATEGORY VALUES(41,'IndustrialSupply','Hose_rubber','Rubber_plate');
INSERT INTO CATEGORY VALUES(42,'IndustrialSupply','Hose_rubber','Hose');
INSERT INTO CATEGORY VALUES(43,'IndustrialSupply','Hose_rubber','Anti_vibration_ruber');
INSERT INTO CATEGORY VALUES(51,'Business_equipment','Welding','Gaujingbong');
INSERT INTO CATEGORY VALUES(52,'Business_equipment','Welding','Tungsten_robs');
INSERT INTO CATEGORY VALUES(53,'Business_equipment','Welding','Submerged_material');
INSERT INTO CATEGORY VALUES(61,'Business_equipment','Voltage_converter','DC/ACinverter');
INSERT INTO CATEGORY VALUES(62,'Business_equipment','Voltage_converter','Down_trance');
INSERT INTO CATEGORY VALUES(63,'Business_equipment','Voltage_converter','Battery_charger');

INSERT INTO SUPPLIER VALUES(1,'A');
INSERT INTO SUPPLIER VALUES(2,'B');
INSERT INTO SUPPLIER VALUES(3,'C');
INSERT INTO SUPPLIER VALUES(4,'D');
INSERT INTO SUPPLIER VALUES(5,'E');
INSERT INTO SUPPLIER VALUES(6,'F');
INSERT INTO SUPPLIER VALUES(7,'G');

INSERT INTO BRAND VALUES(1,'Otos');
INSERT INTO BRAND VALUES(2,'Myengshin_science');
INSERT INTO BRAND VALUES(3,'3M');
INSERT INTO BRAND VALUES(4,'Tobu_Life_Tech');
INSERT INTO BRAND VALUES(5,'Clean_top');
INSERT INTO BRAND VALUES(6,'Daesin_indoseu');
INSERT INTO BRAND VALUES(7,'Finewell');
INSERT INTO BRAND VALUES(8,'K2');
INSERT INTO BRAND VALUES(9,'Leakap');
INSERT INTO BRAND VALUES(10,'Unican');
INSERT INTO BRAND VALUES(11,'SKroseba');
INSERT INTO BRAND VALUES(12,'HIPO');
INSERT INTO BRAND VALUES(13,'SMATO');
INSERT INTO BRAND VALUES(14,'Sungsam');
INSERT INTO BRAND VALUES(15,'NYkorea');
INSERT INTO BRAND VALUES(16,'Starlight');
INSERT INTO BRAND VALUES(17,'Eidikem');
INSERT INTO BRAND VALUES(18,'Ssyangma');
INSERT INTO BRAND VALUES(19,'Living_Angel');
INSERT INTO BRAND VALUES(20,'Hwaseong_gomu');
INSERT INTO BRAND VALUES(21,'RP');
INSERT INTO BRAND VALUES(22,'Daehankabon');
INSERT INTO BRAND VALUES(23,'CRETOS');
INSERT INTO BRAND VALUES(24,'Wolfram');
INSERT INTO BRAND VALUES(25,'Hyeondae');
INSERT INTO BRAND VALUES(26,'Joseonseonjae');
INSERT INTO BRAND VALUES(27,'Daleuda');
INSERT INTO BRAND VALUES(28,'HanilTrans');
INSERT INTO BRAND VALUES(29,'Harim_electric');
INSERT INTO BRAND VALUES(30,'Geumseong_electric');
INSERT INTO BRAND VALUES(31,'Seong_yeong');

INSERT INTO SUPPLIED_BY VALUES(1,1);
INSERT INTO SUPPLIED_BY VALUES(1,2);
INSERT INTO SUPPLIED_BY VALUES(1,3);
INSERT INTO SUPPLIED_BY VALUES(1,4);
INSERT INTO SUPPLIED_BY VALUES(1,5);
INSERT INTO SUPPLIED_BY VALUES(2,6);
INSERT INTO SUPPLIED_BY VALUES(2,7);
INSERT INTO SUPPLIED_BY VALUES(2,8);
INSERT INTO SUPPLIED_BY VALUES(2,9);
INSERT INTO SUPPLIED_BY VALUES(2,10);
INSERT INTO SUPPLIED_BY VALUES(3,11);
INSERT INTO SUPPLIED_BY VALUES(3,12);
INSERT INTO SUPPLIED_BY VALUES(3,13);
INSERT INTO SUPPLIED_BY VALUES(3,14);
INSERT INTO SUPPLIED_BY VALUES(3,15);
INSERT INTO SUPPLIED_BY VALUES(4,16);
INSERT INTO SUPPLIED_BY VALUES(4,17);
INSERT INTO SUPPLIED_BY VALUES(4,18);
INSERT INTO SUPPLIED_BY VALUES(4,19);
INSERT INTO SUPPLIED_BY VALUES(4,20);
INSERT INTO SUPPLIED_BY VALUES(5,21);
INSERT INTO SUPPLIED_BY VALUES(5,22);
INSERT INTO SUPPLIED_BY VALUES(5,23);
INSERT INTO SUPPLIED_BY VALUES(5,24);
INSERT INTO SUPPLIED_BY VALUES(5,25);
INSERT INTO SUPPLIED_BY VALUES(6,26);
INSERT INTO SUPPLIED_BY VALUES(6,27);
INSERT INTO SUPPLIED_BY VALUES(6,28);
INSERT INTO SUPPLIED_BY VALUES(6,29);
INSERT INTO SUPPLIED_BY VALUES(6,30);
INSERT INTO SUPPLIED_BY VALUES(7,31); 

INSERT INTO ITEM VALUES ('W835-1159','Goggleclip',1300,0,0,11,1);
INSERT INTO ITEM VALUES ('W836-0731','Goggle',3150,15,0,11,2);
INSERT INTO ITEM VALUES ('W835-0512','Goggleglass',2200,18,0,11,1);
INSERT INTO ITEM VALUES ('W836-0768','Goggle',3860,1200,0,11,2);
INSERT INTO ITEM VALUES ('W825-0434','Ear_plug',270,1500,0,12,3);
INSERT INTO ITEM VALUES ('W840-0303','Ear_plug',500,17,0,12,4);
INSERT INTO ITEM VALUES ('W839-1050','Ear_plug',170,10,0,12,5);
INSERT INTO ITEM VALUES ('W836-0316','Ear_plug',170,1110,0,12,5);
INSERT INTO ITEM VALUES ('W835-5784','Spectacle_lens',3800,1900,0,13,1);
INSERT INTO ITEM VALUES ('W836-1749','Spectacle_lens',2250,0,0,13,2);
INSERT INTO ITEM VALUES ('W835-0415','Spectacle_lens',3710,0,0,13,1);
INSERT INTO ITEM VALUES ('W835-2510','Spectacle_lens',7080,1500,0,13,1);
INSERT INTO ITEM VALUES ('W864-4697','Junghwa_boots',33900,1600,0,21,6);
INSERT INTO ITEM VALUES ('W864-4703','Junghwa_boots',33900,1900,0,21,6);
INSERT INTO ITEM VALUES ('W899-2442','Fashioncoldboots',16200,1002,0,21,7);
INSERT INTO ITEM VALUES ('W899-2451','Fashioncoldboots',16200,3,0,21,7);
INSERT INTO ITEM VALUES ('W842-5870','Workboots',104100,1090,0,22,8);
INSERT INTO ITEM VALUES ('W849-5912','Workboots',93000,1090,0,22,8);
INSERT INTO ITEM VALUES ('W846-9607','Workboots',104100,2090,0,22,9);
INSERT INTO ITEM VALUES ('W899-9807','Workboots',206000,1010,0,22,8);
INSERT INTO ITEM VALUES ('W847-1374','Safeboots',69900,1190,0,23,8);
INSERT INTO ITEM VALUES ('W847-0010','Safeboots',69900,1190,0,23,8);
INSERT INTO ITEM VALUES ('W846-0314','Safeboots',61000,2190,0,23,8);
INSERT INTO ITEM VALUES ('W847-2346','Safeboots',69900,1110,0,23,10);
INSERT INTO ITEM VALUES ('W700-0063','Gouging_Bong',380,10,0,31,11);
INSERT INTO ITEM VALUES ('W700-0045','Gouging_Bong',250,18,0,31,11);
INSERT INTO ITEM VALUES ('W719-0056','Gouging_Bong',670,19,0,31,12);
INSERT INTO ITEM VALUES ('W700-0081','Gouging_Bong',560,5,0,31,12);
INSERT INTO ITEM VALUES ('W700-0249','Tungsten_rods',1620,1500,0,32,13);
INSERT INTO ITEM VALUES ('W700-0258','Tungsten_rods',1620,1600,0,32,14);
INSERT INTO ITEM VALUES ('W723-0053','Tungsten_rods',9240,1700,0,32,13);
INSERT INTO ITEM VALUES ('W723-0044','Tungsten_rods',5330,1900,0,32,15);
INSERT INTO ITEM VALUES ('W706-0506','H-14',5390,2000,0,33,16);
INSERT INTO ITEM VALUES ('W702-4948','UC-308',16300,0,0,33,15);
INSERT INTO ITEM VALUES ('W702-2746','UC-36',4990,3000,0,33,11);
INSERT INTO ITEM VALUES ('W706-0348','H-14',4190,2700,0,33,16);
INSERT INTO ITEM VALUES ('W109-4848','DC/ACinverter',56700,2700,0,41,13);
INSERT INTO ITEM VALUES ('W109-4857','DC/ACinverter',119000,3000,0,41,17);
INSERT INTO ITEM VALUES ('W736-1283','DC/ACinverter',485000,2700,0,41,13);
INSERT INTO ITEM VALUES ('W736-1070','DC/ACinverter',761000,4000,0,41,17);
INSERT INTO ITEM VALUES ('W736-1724','Home_trance',27500,10,0,42,14);
INSERT INTO ITEM VALUES ('W736-1733','Home_trance',50400,1900,0,42,19);
INSERT INTO ITEM VALUES ('W736-1168','Trance',47700,1100,0,42,14);
INSERT INTO ITEM VALUES ('W736-2042','Trance',125000,2000,0,42,14);
INSERT INTO ITEM VALUES ('W743-0015','Battery_charger',58800,1000,0,43,20);
INSERT INTO ITEM VALUES ('W743-0024','Battery_charger',165400,90,0,43,20);
INSERT INTO ITEM VALUES ('W736-0062','Battery_charger',142000,4000,0,43,21);
INSERT INTO ITEM VALUES ('W740-0810','Battery_Tester',31800,1000,0,43,21);
INSERT INTO ITEM VALUES ('W879-0303','Incandescent_bulb',2240,12,0,51,23);
INSERT INTO ITEM VALUES ('W879-0297','Incandescent_bulb',910,19,0,51,23);
INSERT INTO ITEM VALUES ('W140-4221','Compact_bulb',1160,16,0,51,22);
INSERT INTO ITEM VALUES ('W140-4142','Fluorescent_lamp',2390,1030,0,51,23);
INSERT INTO ITEM VALUES ('W112-4617','Work_lights',20100,4000,0,52,23);
INSERT INTO ITEM VALUES ('W875-7238','Charging_Work_lights',25500,1600,0,52,23);
INSERT INTO ITEM VALUES ('W102-4496','Bellows_lights',10300,1500,0,52,24);
INSERT INTO ITEM VALUES ('W144-1028','Lamp',1300,1160,0,52,24);
INSERT INTO ITEM VALUES ('W879-4017','Slipemitter',42900,1016,0,53,25);
INSERT INTO ITEM VALUES ('W144-4371','Emitter',93700,937,0,53,26);
INSERT INTO ITEM VALUES ('W879-3841','LEDElectronic_signalrod',5850,3500,0,53,26);
INSERT INTO ITEM VALUES ('W879-4008','Slipemitter',33600,900,0,53,25);
INSERT INTO ITEM VALUES ('W103-9595','Plain_rubber_plate',95300,2900,0,61,13);
INSERT INTO ITEM VALUES ('W801-0340','Fatigue_prevention_Mat',80000,3900,0,61,13);
INSERT INTO ITEM VALUES ('W103-9586','Plain_rubber_plate',95300,900,0,61,27);
INSERT INTO ITEM VALUES ('W801-0775','Antistatic_tape',17700,3900,0,61,27);
INSERT INTO ITEM VALUES ('W802-0082','Pair_hose',19100,1900,0,62,28);
INSERT INTO ITEM VALUES ('W182-4142','Fussa_Hoses',22300,1002,0,62,28);
INSERT INTO ITEM VALUES ('W802-0611','Fussa_Hoses',27400,2002,0,62,29);
INSERT INTO ITEM VALUES ('W802-0480','Power_Hoses',9370,2012,0,62,29);
INSERT INTO ITEM VALUES ('W805-0427','Piece_rubber',450,3040,0,63,30);
INSERT INTO ITEM VALUES ('W805-0056','Bolt_anti_vibrationrubber',2120,11,0,63,30);
INSERT INTO ITEM VALUES ('W805-2063','Bolt_anti_vibrationrubber',920,1001,0,63,28);
INSERT INTO ITEM VALUES ('W805-1329','Circulardust_proof_rubberplate',920,1100,0,63,31);

 ALTER TABLE SUPPLIED_BY ADD FOREIGN KEY (Brand_id) REFERENCES BRAND(Brand_id)
 ON DELETE CASCADE;
ALTER TABLE SUPPLIED_BY ADD FOREIGN KEY (Supplier_id) REFERENCES SUPPLIER(Supplier_id)
 ON DELETE CASCADE;

ALTER TABLE ITEM ADD FOREIGN KEY(Brand_id) REFERENCES BRAND(Brand_id) ON DELETE CASCADE;
ALTER TABLE ITEM ADD FOREIGN KEY(Category_id) REFERENCES CATEGORY(Category_id) ON DELETE CASCADE;


/* item supplier category brand */



INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-24 month),'iliketogo',1);
INSERT INTO PUT_IN VALUES(1,'W836-0768',1,'iliketogo');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES(2,1,'y',date_add(now(),interval-22 month),'iliketogo',1);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'iliketogo');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES(3,1,'y',date_add(now(),interval-20 month),'iliketogo',1);
INSERT INTO PUT_IN VALUES(3,'W836-0768',1,'iliketogo');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-23 month),'iwantto',2);
INSERT INTO PUT_IN VALUES(1,'W835-2510',1,'iwantto');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W835-2510';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-21 month),'stoppressing',2);
INSERT INTO PUT_IN VALUES(1,'W835-2510',1,'stoppressing');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W835-2510';

INSERT INTO BAG VALUES(2,2,'y',date_add(now(),interval-21 month),'stoppressing',2);
INSERT INTO PUT_IN VALUES(2,'W835-2510',2,'stoppressing');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W835-2510';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-19 month),'pleasegive',2);
INSERT INTO PUT_IN VALUES(1,'W836-0768',1,'pleasegive');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES(1,101,'y',date_add(now(),interval-20 month),'whoaretou',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',101,'whoaretou');
UPDATE ITEM
SET Soldnum=Soldnum+101, Inum=Inum-101
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-17 month),'whoami',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'whoami');

UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,49,'y',date_add(now(),interval-21 month),'thisisis',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',49,'thisisis');
UPDATE ITEM
SET Soldnum=Soldnum+49, Inum=Inum-49
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,70,'y',date_add(now(),interval-22 month),'ayounffn',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',70,'ayounffn');
UPDATE ITEM
SET Soldnum=Soldnum+70, Inum=Inum-70
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-23 month),'jongmang',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'jongmang');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,120,'y',date_add(now(),interval-19 month),'thisistohot',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',120,'thisistohot');
UPDATE ITEM
SET Soldnum=Soldnum+120, Inum=Inum-120
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,101,'y',date_add(now(),interval-19 month),'iamnotayoung',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',101,'iamnotayoung');
UPDATE ITEM
SET Soldnum=Soldnum+101, Inum=Inum-101
WHERE ITEM.Item_id='W836-0703';


INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-19 month),'tooldtogo',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'tooldtogo');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,101,'y',date_add(now(),interval-17 month),'sadm1ego',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',101,'sadm1ego');
UPDATE ITEM
SET Soldnum=Soldnum+101, Inum=Inum-101
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,100,'y',date_add(now(),interval-19 month),'sen1dmego',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',100,'sen1dmego');
UPDATE ITEM
SET Soldnum=Soldnum+100, Inum=Inum-100
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-19 month),'thisisanother',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'thisisanother');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,80,'y',date_add(now(),interval-19 month),'levelisgoingto',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',80,'levelisgoingto');
UPDATE ITEM
SET Soldnum=Soldnum+80, Inum=Inum-80
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,100,'y',date_add(now(),interval-19 month),'goonamou',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',100,'goonamou');
UPDATE ITEM
SET Soldnum=Soldnum+100, Inum=Inum-100
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-12 month),'ntaintisfact',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'ntaintisfact');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,41,'y',date_add(now(),interval-7 month),'notayoungguy',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',41,'notayoungguy');
UPDATE ITEM
SET Soldnum=Soldnum+41, Inum=Inum-41
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,91,'y',date_add(now(),interval-0 month),'aaaa1',2);
INSERT INTO PUT_IN VALUES(1,'W864-4703',91,'aaaa1');
UPDATE ITEM
SET Soldnum=Soldnum+91, Inum=Inum-91
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,1,'y',date_add(now(),interval-1 month),'aafabbb',1);
INSERT INTO PUT_IN VALUES(1,'W864-4703',1,'aafabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0703';

INSERT INTO BAG VALUES(1,50,'y',date_add(now(),interval-11 month),'cbaby',1);
INSERT INTO PUT_IN VALUES(1,'W805-1329',1,'cbaby');
UPDATE ITEM
SET Soldnum=Soldnum+50, Inum=Inum-50
WHERE ITEM.Item_id='W805-1329';

INSERT INTO BAG VALUES(1,100,'y',date_add(now(),interval-10 month),'icobgggba',1);
INSERT INTO PUT_IN VALUES(1,'W805-1329',100,'icobgggba');
UPDATE ITEM
SET Soldnum=Soldnum+100, Inum=Inum-100
WHERE ITEM.Item_id='W805-1329';

INSERT INTO BAG VALUES(1,91,'y',date_add(now(),interval-10 month),'iaacob',1);
INSERT INTO PUT_IN VALUES(1,'W805-1329',91,'iaacob');
UPDATE ITEM
SET Soldnum=Soldnum+91, Inum=Inum-91
WHERE ITEM.Item_id='W805-1329';

INSERT INTO BAG VALUES(1,100,'y',date_add(now(),interval-8 month),'lasldflk',1);
INSERT INTO PUT_IN VALUES(1,'W805-1329',100,'lasldflk');
UPDATE ITEM
SET Soldnum=Soldnum+100, Inum=Inum-100
WHERE ITEM.Item_id='W805-1329';

INSERT INTO BAG VALUES(1,17,'y',date_add(now(),interval-7 month),'iamndfef',1);
INSERT INTO PUT_IN VALUES(1,'W805-1329',17,'iamndfef');
UPDATE ITEM
SET Soldnum=Soldnum+17, Inum=Inum-17
WHERE ITEM.Item_id='W805-1329';

INSERT INTO BAG VALUES(1,30,'y',date_add(now(),interval-18 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(1,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(2,30,'y',date_add(now(),interval-15 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(2,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(3,30,'y',date_add(now(),interval-14 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(3,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(4,30,'y',date_add(now(),interval-11 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(4,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(5,30,'y',date_add(now(),interval-8 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(5,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(6,30,'y',date_add(now(),interval-7 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(6,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(7,30,'y',date_add(now(),interval-6 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(7,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(8,30,'y',date_add(now(),interval-5 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(8,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(9,30,'y',date_add(now(),interval-3 month),'timegotto',3);
INSERT INTO PUT_IN VALUES(9,'W802-0480',30,'timegotto');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(1,30,'y',date_add(now(),interval-9 month),'beachis',3);
INSERT INTO PUT_IN VALUES(1,'W802-0480',30,'beachis');
UPDATE ITEM
SET Soldnum=Soldnum+30, Inum=Inum-30
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(1,29,'y',date_add(now(),interval-16 month),'itisnotapark',3);
INSERT INTO PUT_IN VALUES(1,'W802-0480',29,'itisnotapark');
UPDATE ITEM
SET Soldnum=Soldnum+29, Inum=Inum-29
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(1,29,'y',date_add(now(),interval-16 month),'neverlandtogo',3);
INSERT INTO PUT_IN VALUES(1,'W802-0480',29,'neverlandtogo');
UPDATE ITEM
SET Soldnum=Soldnum+29, Inum=Inum-29
WHERE ITEM.Item_id='W802-0480';

INSERT INTO BAG VALUES(1,15,'n',NULL,'dogisgoing',3);
INSERT INTO PUT_IN VALUES(1,'W182-4142',15,'dogisgoing');

INSERT INTO BAG VALUES(1,18,'n',NULL,'fisherman',3);
INSERT INTO PUT_IN VALUES(1,'W835-0512',9,'fisherman');
INSERT INTO PUT_IN VALUES(1,'W836-0768',9,'fisherman');

INSERT INTO BAG VALUES(1,15,'n',NULL,'lionandtiger',3);
INSERT INTO PUT_IN VALUES(1,'W842-5870',15,'lionandtiger');

INSERT INTO BAG VALUES(1,30,'n',NULL,'wehavenothing',3);
INSERT INTO PUT_IN VALUES(1,'W835-2510',15,'wehavenothing');
INSERT INTO PUT_IN VALUES(1,'W847-0010',15,'wehavenothing');


INSERT INTO BAG VALUES(1,30,'n',NULL,'touhavtolove',3);
INSERT INTO PUT_IN VALUES(1,'W835-2510',15,'touhavtolove');
INSERT INTO PUT_IN VALUES(1,'W702-2746',15,'touhavtolove');

INSERT INTO BAG VALUES(2,58,'n',NULL,'neverlandtogo',3);
INSERT INTO PUT_IN VALUES(2,'W802-0480',29,'neverlandtogo');
INSERT INTO PUT_IN VALUES(2,'W736-1168',29,'neverlandtogo');

INSERT INTO BAG VALUES(2,29,'n',NULL,'itisnotapark',3);
INSERT INTO PUT_IN VALUES(2,'W140-4142',29,'itisnotapark');

INSERT INTO BAG VALUES(2,18,'n',NULL,'beachis',3);
INSERT INTO PUT_IN VALUES(2,'W802-0480',10,'beachis');
INSERT INTO PUT_IN VALUES(2,'W836-0731',8,'beachis');

INSERT INTO BAG VALUES(10,17,'n',NULL,'timegotto',3);
INSERT INTO PUT_IN VALUES(10,'W802-0480',17,'timegotto');

INSERT INTO BAG VALUES(2,17,'n',NULL,'iamndfef',1);
INSERT INTO PUT_IN VALUES(2,'W802-0611',17,'iamndfef');

INSERT INTO BAG VALUES(2,30,'n',NULL,'lasldflk',1);
INSERT INTO PUT_IN VALUES(2,'W144-1028',30,'lasldflk');

INSERT INTO BAG VALUES(2,17,'n',NULL,'iaacob',1);
INSERT INTO PUT_IN VALUES(2,'W805-1329',3,'iaacob');
INSERT INTO PUT_IN VALUES(2,'W801-0340',4,'iaacob');
INSERT INTO PUT_IN VALUES(2,'W736-1733',5,'iaacob');
INSERT INTO PUT_IN VALUES(2,'W847-0010',5,'iaacob');

INSERT INTO BAG VALUES(2,18,'n',NULL,'icobgggba',1);
INSERT INTO PUT_IN VALUES(2,'W805-1329',18,'icobgggba');


INSERT INTO BAG VALUES(2,16,'n',NULL,'cbaby',1);
INSERT INTO PUT_IN VALUES(2,'W740-0810',16,'cbaby');

INSERT INTO BAG VALUES(2,20,'n',NULL,'aafabbb',1);
INSERT INTO PUT_IN VALUES(2,'W899-2442',10,'aafabbb');
INSERT INTO PUT_IN VALUES(2,'W849-5912',10,'aafabbb');

INSERT INTO BAG VALUES(2,4,'n',NULL,'aaaa1',2);
INSERT INTO PUT_IN VALUES(2,'W700-0045',4,'aaaa1');


INSERT INTO BAG VALUES(2,11,'n',NULL,'notayoungguy',1);
INSERT INTO PUT_IN VALUES(2,'W835-0415',11,'notayoungguy');

INSERT INTO BAG VALUES(2,1,'n',NULL,'ntaintisfact',1);
INSERT INTO PUT_IN VALUES(2,'W849-5912',1,'ntaintisfact');

INSERT INTO BAG VALUES(2,4,'n',NULL,'goonamou',2);
INSERT INTO PUT_IN VALUES(2,'W864-4703',4,'goonamou');

INSERT INTO BAG VALUES(2,3,'n',NULL,'levelisgoingto',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',3,'levelisgoingto');

INSERT INTO BAG VALUES(2,2,'n',NULL,'thisisanother',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',2,'thisisanother');

INSERT INTO BAG VALUES(2,1,'n',NULL,'sen1dmego',2);
INSERT INTO PUT_IN VALUES(2,'W864-4703',1,'sen1dmego');

INSERT INTO BAG VALUES(2,11,'n',NULL,'sadm1ego',1);
INSERT INTO PUT_IN VALUES(2,'W109-4848',11,'sadm1ego');

INSERT INTO BAG VALUES(2,9,'n',NULL,'tooldtogo',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',9,'tooldtogo');


INSERT INTO BAG VALUES(2,9,'n',NULL,'iamnotayoung',2);
INSERT INTO PUT_IN VALUES(2,'W879-4008',9,'iamnotayoung');

INSERT INTO BAG VALUES(2,3,'n',NULL,'thisistohot',1);
INSERT INTO PUT_IN VALUES(2,'W879-3841',3,'thisistohot');

INSERT INTO BAG VALUES(2,2,'n',NULL,'jongmang',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',2,'jongmang');

INSERT INTO BAG VALUES(2,5,'n',NULL,'ayounffn',2);
INSERT INTO PUT_IN VALUES(2,'W102-4496',5,'ayounffn');

INSERT INTO BAG VALUES(2,8,'n',NULL,'thisisis',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',8,'thisisis');

INSERT INTO BAG VALUES(2,1,'n',NULL,'whoami',1);
INSERT INTO PUT_IN VALUES(2,'W864-4703',1,'whoami');

INSERT INTO BAG VALUES(2,4,'n',NULL,'whoaretou',2);
INSERT INTO PUT_IN VALUES(2,'W864-4703',4,'whoaretou');

INSERT INTO BAG VALUES(2,1,'n',NULL,'pleasegive',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'pleasegive');

INSERT INTO BAG VALUES(3,2,'n',NULL,'stoppressing',2);
INSERT INTO PUT_IN VALUES(3,'W835-2510',2,'stoppressing');

INSERT INTO BAG VALUES(2,1,'n',NULL,'iwantto',2);
INSERT INTO PUT_IN VALUES(2,'W835-2510',1,'iwantto');

INSERT INTO BAG VALUES(4,1,'n',NULL,'iliketogo',1);
INSERT INTO PUT_IN VALUES(4,'W836-0768',1,'iliketogo');

INSERT INTO BAG VALUES(8,0,'n',NULL,'jaeminjj',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'aaaabbb',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'aaaabbbb',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'ccccbbb',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'ddddbbb',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin12',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin23',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin45',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin67',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin89',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin10',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin11',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin13',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin14',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin15',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'jaemin16',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'yunay',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'yunay1',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'yunay12',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'adsffasf',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'adsf231',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'aafsvov',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'boblizer',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'ilikeme',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'youlikeyou',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'totoutm',2);
INSERT INTO BAG VALUES(8,0,'n',NULL,'mycute134',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'tokyohigh',1);
INSERT INTO BAG VALUES(8,0,'n',NULL,'tougotthe',3);
INSERT INTO BAG VALUES(8,0,'n',NULL,'foxissaying',3);


##jaeminjj

INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-23 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(1,'W836-0768',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-22 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaeminjj');
INSERT INTO PUT_IN VALUES(2,'W825-0434',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W825-0434';

INSERT INTO BAG VALUES (3,1,'y',date_add(now(),interval-21 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(3,'W864-4697',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W864-4697';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-20 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(4,'W864-4697',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W864-4697';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-19 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-18 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(6,'W835-5784',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W835-5784';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-17 month), 'jaeminjj',2);
INSERT INTO PUT_IN VALUES(7,'W842-5870',1,'jaeminjj');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W842-5870';

##aaaabbb

INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-16 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(1,'W836-0768',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-15 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'aaaabbb');
INSERT INTO PUT_IN VALUES(2,'W825-0434',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W825-0434';

INSERT INTO BAG VALUES (3,1,'y',date_add(now(),interval-14 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(3,'W864-4697',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W864-4697';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-13 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(4,'W736-2042',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-12 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-11 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(6,'W835-5784',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W835-5784';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-10 month), 'aaaabbb',2);
INSERT INTO PUT_IN VALUES(7,'W842-5870',1,'aaaabbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W842-5870';

##aaaabbbb

INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-16 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-15 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'aaaabbbb');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,1,'y',date_add(now(),interval-14 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(3,'W736-2042',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-13 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-12 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-11 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-10 month), 'aaaabbbb',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'aaaabbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##ccccbbb
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-9 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-8 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'ccccbbb');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,1,'y',date_add(now(),interval-7 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(3,'W736-2042',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-6 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-4 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'ccccbbb',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'ccccbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##ddddbbb
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-24 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-23 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'ddddbbb');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,1,'y',date_add(now(),interval-23 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(3,'W736-2042',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-22 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-21 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-20 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-19 month), 'ddddbbb',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'ddddbbb');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin12
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-18 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-17 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin12');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-16 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(3,'W736-2042',4,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-15 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-14 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-13 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-12 month), 'jaemin12',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin23
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-11 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-10 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin23');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-9 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(3,'W736-2042',4,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-8 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-7 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-6 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-5 month), 'jaemin23',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin23');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin45
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-8 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-7 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin45');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-6 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(3,'W736-2042',4,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W736-2042';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-5 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-4 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'jaemin45',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin45');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin67
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-22 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-21 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin67');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-20 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(3,'W847-0010',4,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-0010';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-19 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-18 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-17 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-16 month), 'jaemin67',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin67');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin89
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-22 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-21 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin89');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-20 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(3,'W847-0010',4,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-0010';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-19 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-18 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-17 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-16 month), 'jaemin89',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin89');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin10
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-22 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(1,'W736-1283',1,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-21 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(2,'W836-0768',1,'jaemin10');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W836-0768';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-20 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(3,'W847-0010',4,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-0010';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-19 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-18 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-17 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-16 month), 'jaemin10',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin10');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin11
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-10 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(1,'W103-9586',1,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W103-9586';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-9 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',1,'jaemin11');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-8 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(3,'W182-4142',4,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W182-4142';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-7 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-6 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-5 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-4 month), 'jaemin11',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin11');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin13
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-21 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(1,'W103-9586',1,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W103-9586';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-16 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',1,'jaemin13');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-15 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(3,'W182-4142',4,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W182-4142';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-14 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-13 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-12 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-11 month), 'jaemin13',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin13');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin14
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-19 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(1,'W103-9586',1,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W103-9586';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-16 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',1,'jaemin14');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-9 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(3,'W182-4142',4,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W182-4142';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-8 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-7 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-6 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-5 month), 'jaemin14',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin14');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin15
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-23 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(1,'W103-9586',1,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W103-9586';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-22 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',1,'jaemin15');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-21 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(3,'W182-4142',4,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W182-4142';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-20 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-19 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-18 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-10 month), 'jaemin15',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin15');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##jaemin16
INSERT INTO BAG VALUES (1,1,'y',date_add(now(),interval-22 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(1,'W103-9586',1,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W103-9586';

INSERT INTO BAG VALUES (2,2,'y',date_add(now(),interval-17 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(2,'W182-4142',1,'jaemin16');
INSERT INTO PUT_IN VALUES(2,'W736-1283',1,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-16 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(3,'W182-4142',4,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W182-4142';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-15 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(4,'W736-1283',1,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-1283';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-11 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-9 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(6,'W112-4617',1,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W112-4617';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-8 month), 'jaemin16',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'jaemin16');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##yunay
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-20 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-17 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'yunay');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-9 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-8 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(4,'W846-0314',1,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-4 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'yunay',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'yunay');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##yunay1
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-10 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-9 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'yunay1');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-8 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-7 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(4,'W846-0314',1,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-6 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-5 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-4 month), 'yunay1',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'yunay1');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##yunay12
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-10 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-9 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'yunay12');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-8 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-7 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(4,'W846-0314',1,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-6 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-5 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-4 month), 'yunay12',3);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'yunay12');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##adsffasf
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-21 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-20 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'adsffasf');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-18 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,1,'y',date_add(now(),interval-17 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(4,'W846-0314',1,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-16 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-15 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-9 month), 'adsffasf',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'adsffasf');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##adsf231
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-21 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-20 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'adsf231');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-18 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-17 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-16 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-15 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-9 month), 'adsf231',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'adsf231');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##aafsvov
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-13 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-12 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'aafsvov');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-9 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-8 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-7 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-6 month), 'aafsvov',2);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'aafsvov');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';


##boblizer
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-13 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-12 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'boblizer');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(3,'W847-1374',4,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W847-1374';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-9 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-8 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(5,'W836-0316',2,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W836-0316';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-7 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-6 month), 'boblizer',1);
INSERT INTO PUT_IN VALUES(7,'W743-0015',1,'boblizer');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W743-0015';

##ilikeme
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-13 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-12 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'ilikeme');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(3,'W723-0044',4,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W723-0044';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-9 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-8 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-7 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-6 month), 'ilikeme',1);
INSERT INTO PUT_IN VALUES(7,'W736-0062',1,'ilikeme');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-0062';

##youlikeyou
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-13 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-12 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'youlikeyou');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(3,'W723-0044',4,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W723-0044';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-9 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-8 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-7 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-6 month), 'youlikeyou',2);
INSERT INTO PUT_IN VALUES(7,'W736-0062',1,'youlikeyou');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-0062';

##totoutm
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-19 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-18 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'totoutm');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-17 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(3,'W723-0044',4,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W723-0044';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-16 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-15 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-14 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-10 month), 'totoutm',2);
INSERT INTO PUT_IN VALUES(7,'W736-0062',1,'totoutm');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-0062';

##mycute134
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-21 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(1,'W700-0249',10,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W700-0249';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-18 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(2,'W182-4142',10,'mycute134');
INSERT INTO PUT_IN VALUES(2,'W875-7238',1,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W182-4142';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W875-7238';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-7 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(3,'W723-0044',4,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W723-0044';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-6 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-4 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(6,'W879-3841',1,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-3841';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'mycute134',1);
INSERT INTO PUT_IN VALUES(7,'W736-0062',1,'mycute134');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W736-0062';

##tokyohigh
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-21 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(1,'W109-4848',10,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W109-4848';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-18 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(2,'W144-1028',10,'tokyohigh');
INSERT INTO PUT_IN VALUES(2,'W702-2746',1,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W144-1028';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W702-2746';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-7 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(3,'W849-5912',4,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W849-5912';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-6 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,1,'y',date_add(now(),interval-4 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(6,'W879-4017',1,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W879-4017';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'tokyohigh',1);
INSERT INTO PUT_IN VALUES(7,'W849-5912',1,'tokyohigh');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W849-5912';

##tougotthe
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-18 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(1,'W109-4848',10,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W109-4848';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-15 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(2,'W144-1028',10,'tougotthe');
INSERT INTO PUT_IN VALUES(2,'W702-2746',1,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W144-1028';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W702-2746';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(3,'W849-5912',4,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W849-5912';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-6 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,5,'y',date_add(now(),interval-4 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(6,'W879-4017',5,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+5, Inum=Inum-5
WHERE ITEM.Item_id='W879-4017';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'tougotthe',3);
INSERT INTO PUT_IN VALUES(7,'W849-5912',1,'tougotthe');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W849-5912';

##foxissaying
INSERT INTO BAG VALUES (1,10,'y',date_add(now(),interval-18 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(1,'W109-4848',10,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W109-4848';

INSERT INTO BAG VALUES (2,11,'y',date_add(now(),interval-15 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(2,'W144-1028',10,'foxissaying');
INSERT INTO PUT_IN VALUES(2,'W702-2746',1,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W144-1028';
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W702-2746';

INSERT INTO BAG VALUES (3,4,'y',date_add(now(),interval-11 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(3,'W849-5912',4,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+4, Inum=Inum-4
WHERE ITEM.Item_id='W849-5912';

INSERT INTO BAG VALUES (4,10,'y',date_add(now(),interval-6 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(4,'W846-0314',10,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+10, Inum=Inum-10
WHERE ITEM.Item_id='W846-0314';

INSERT INTO BAG VALUES (5,2,'y',date_add(now(),interval-5 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(5,'W706-0348',2,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+2, Inum=Inum-2
WHERE ITEM.Item_id='W706-0348';

INSERT INTO BAG VALUES (6,5,'y',date_add(now(),interval-4 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(6,'W879-4017',5,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+5, Inum=Inum-5
WHERE ITEM.Item_id='W879-4017';

INSERT INTO BAG VALUES (7,1,'y',date_add(now(),interval-3 month), 'foxissaying',3);
INSERT INTO PUT_IN VALUES(7,'W849-5912',1,'foxissaying');
UPDATE ITEM
SET Soldnum=Soldnum+1, Inum=Inum-1
WHERE ITEM.Item_id='W849-5912';


##add_index######################################

alter table CUSTOMER add index Customer_idx(Customer_id);
show index from CUSTOMER;

alter table BAG add index Bag_idx(Bag_id);
show index from BAG;

alter table SHIPPING add index Shipping_idx(Shipping_id);
show index from SHIPPING;

alter table ITEM add index Item_idx(Item_id);
show index from ITEM;

alter table CATEGORY add index Category_idx(Category_id);
show index from CATEGORY;

alter table BRAND add index Brand_idx(Brand_id);
show index from BRAND;

alter table SUPPLIER add index Supplier_idx(Supplier_id);
show index from SUPPLIER;