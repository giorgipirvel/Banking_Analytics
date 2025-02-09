With Total_Amount As ( SELECT UNI_KEY ,
                              SUM(APP_AMT) [ Total ]
                              FROM APP$ 
                              GROUP BY UNI_KEY 
)

SELECT a.UNI_KEY [ Customer ID ],
       a.APP_ID [ Application ID ],
	   CONVERT(DATE, a.APP_DATE, 101) [ Application Date ],
	   a.APP_AMT [Application Amount ] ,
	   a.APP_INT [Application Interest Rate ],
	   a.APP_PER [ Application Period ],
	   b.NAME [ Product ],
	   c.NAME [ Status ],
	   CONVERT(DATE, d.CONTR_DATE) [ Contract Date ],
	   CONVERT(DATE, d.CONTR_CLOSE_DATE,101) [ Close Date ],
	   CONVERT(DATE, d.CONTR_MAT_DATE, 101) [ Maturity Date ],
	   CASE WHEN d.CONTR_CLOSE_DATE = d.CONTR_MAT_DATE THEN 'Closed Loan'
	        WHEN d.CONTR_CLOSE_DATE IS NULL AND d.CONTR_DATE IS NOT NULL THEN 'Active Loan'
			ELSE 'Others' END [ Loans Status ],
	   e.[ Total ] as [ Total Demand ],
	   SUM(a.APP_AMT) OVER (PARTITION BY b.NAME) [ Total Demand through Product ] 
FROM APP$ a
LEFT JOIN APP_TP$ b on b.PROD_KEY = a.APP_TP_KEY
LEFT JOIN APP_STAT$ c on c.STAT_KEY = a.APP_TP_KEY
LEFT JOIN LOAN$ d on d.CONTR_ID = a.APP_ID
LEFT JOIN Total_Amount e on e.UNI_KEY = a.UNI_KEY
WHERE a.APP_ID IS NOT NULL