SELECT a.UNI_KEY [ Customer KEY ],
       a.ID [ Customer ID ],
       CONCAT(a.F_NAME_ENG,' ', a.L_NAME_ENG)  [ Full Name ],
	   CASE WHEN a.GEND = 'M' THEN 'Male'
	        ELSE 'Female' END AS 'Gender',
	   DATEDIFF(MONTH,a.BRTH_DATE,GETDATE())/12 [ Age ],
	   b.NAME [ Nationality ],
	   ISNULL(c.NAME,'Not Indicated') [ City ],
	   d.NAME [ Addres ],
	   a.INCOM [ Income ],
	   CASE WHEN a.INCOM < 1000 THEN 'Low'
	        WHEN a.INCOM BETWEEN 1000 AND 2000 THEN 'Medium'
			ELSE 'High' END AS 'Income Classes',
       ISNULL(e.USER_NAME,'Not Registered') [ User Name ],
       ISNULL(e.DEVICE,'No Device') [ Device ],
	   ISNULL(e.LOGIN_TP, '-') [ Login Type ]
FROM PPL$ a
LEFT JOIN COUNTR$ b on b.CNTR_KEY = a.NAT_KEY
LEFT JOIN CITY$ c on c.CT_KEY = a.CIT_KEY
LEFT JOIN ADDR$ d on d.ADDR_KEY = a.ADDR
LEFT JOIN USER_PPL$ e on e.OWN_KEY = a.UNI_KEY 