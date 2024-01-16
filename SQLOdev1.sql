
--1.soru
SELECT * FROM FLO  

--2.soru 
SELECT COUNT(master_id) AS Müsteri_Sayisi FROM FLO 

--3.soru
SELECT SUM(order_num_total_ever_online) + SUM(order_num_total_ever_offline) AS Adet  FROM FLO
SELECT SUM(customer_value_total_ever_online) + SUM(customer_value_total_ever_offline) AS Ciro  FROM FLO

--4.soru
SELECT (SUM(customer_value_total_ever_online) + SUM(customer_value_total_ever_offline)) / (SUM(order_num_total_ever_online) + SUM(order_num_total_ever_offline)) AS Ort_Ciro  FROM FLO

--5.soru  
SELECT last_order_channel,SUM(order_num_total_ever_online) + SUM(order_num_total_ever_offline) AS Adet  FROM FLO GROUP BY last_order_channel
SELECT last_order_channel,SUM(customer_value_total_ever_online) + SUM(customer_value_total_ever_offline) AS Ciro  FROM FLO GROUP BY last_order_channel 

--6.soru 
SELECT YEAR(first_order_date) AS Yil ,SUM(order_num_total_ever_online) + SUM(order_num_total_ever_offline) AS Adet  FROM FLO GROUP BY  YEAR(first_order_date) ORDER BY Yil

--7.soru 
SELECT last_order_channel,(SUM(customer_value_total_ever_online) + SUM(customer_value_total_ever_offline)) / (SUM(order_num_total_ever_online) + SUM(order_num_total_ever_offline)) AS Ort_Ciro FROM FLO GROUP BY last_order_channel

--8.soru 
SELECT master_id,SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS Ciro FROM FLO GROUP BY master_id 

--9.soru 
SELECT master_id,order_channel FROM FLO 

--10.soru
SELECT * FROM FLO WHERE last_order_channel != 'Offline'

--11.soru
SELECT * FROM FLO WHERE last_order_channel != 'Offline' AND customer_value_total_ever_online > 1000

--12.soru 
SELECT master_id,SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS Ciro FROM FLO WHERE order_channel = 'Mobile' GROUP BY master_id

--13.soru
SELECT interested_in_categories_12 FROM FLO WHERE interested_in_categories_12 LIKE '%SPOR%' 

--14.soru
SELECT * FROM FLO WHERE customer_value_total_ever_offline BETWEEN 0 AND 10000

--15.Soru 
SELECT interested_in_categories_12,order_channel,SUM(order_num_total_ever_online) AS Online_Adet FROM FLO GROUP BY interested_in_categories_12,order_channel

--16.soru 
SELECT last_order_channel,interested_in_categories_12,SUM(order_num_total_ever_online + order_num_total_ever_offline) AS Adet FROM FLO GROUP BY last_order_channel,interested_in_categories_12 ORDER BY Adet DESC

--17.soru 
SELECT TOP 50 master_id,last_order_channel,SUM(order_num_total_ever_online + order_num_total_ever_offline) AS Adet FROM FLO GROUP BY master_id,last_order_channel ORDER BY Adet DESC 

--18.soru 
SELECT YEAR(first_order_date) AS Yil,COUNT(master_id) AS Musteri_Sayisi FROM FLO GROUP BY YEAR(first_order_date) ORDER BY Yil

--19.soru 
SELECT COUNT(master_id) AS Musteri_Sayisi FROM FLO WHERE YEAR(last_order_date) = '2020'

--20.soru
SELECT master_id,order_channel FROM FLO WHERE interested_in_categories_12 = '[AKTIFSPOR]' 

--21.soru 
SELECT master_id,order_channel FROM FLO WHERE interested_in_categories_12 LIKE '%AKTIFSPOR%'  

--22.soru 
SELECT MONTH(first_order_date) AS Ay, YEAR(first_order_date) AS Yil,COUNT(master_id) AS Müsteri_Sayisi FROM FLO  WHERE YEAR(first_order_date) = '2018' OR YEAR(first_order_date) = '2019'  GROUP BY MONTH(first_order_date), YEAR(first_order_date) ORDER BY Yil,Ay

--23.soru
SELECT * FROM FLO WHERE order_channel = 'Mobile' OR order_channel = 'Desktop'   

--24.soru 
--SELECT interested_in_categories_12,* FROM FLO WHERE interested_in_categories_12 NOT LIKE '%AKTIFSPOR%' 
SELECT interested_in_categories_12,order_channel,* FROM FLO WHERE (interested_in_categories_12 NOT LIKE '%AKTIFSPOR%') AND (order_channel = 'Mobile' OR order_channel = 'Desktop')

--25.soru   
SELECT TOP 1 MONTH(last_order_date_online) AS Ay,SUM(order_num_total_ever_online) As Adet ,SUM(customer_value_total_ever_online) AS Ciro FROM FLO GROUP BY MONTH(last_order_date_online) ORDER BY Adet DESC 