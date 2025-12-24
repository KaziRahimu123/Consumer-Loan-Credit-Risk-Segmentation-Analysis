use `credit_approval`;

select * from credit_approval.credit_card_applications;

SELECT DISTINCT NAME_INCOME_TYPE FROM credit_approval.credit_card_applications;


SELECT 
    CODE_GENDER,
    NAME_INCOME_TYPE,
    OCCUPATION_TYPE,
    ROUND(AVG(AMT_INCOME_TOTAL))   AS avg_income,
    ROUND(AVG(YEARS_EMPLOYED),2)     AS avg_years_employed
FROM credit_approval.credit_card_applications
WHERE 
    NAME_INCOME_TYPE <> 'Pensioner'
    AND NAME_INCOME_TYPE <> 'Student'
    AND YEARS_EMPLOYED < 45
    AND TRIM(OCCUPATION_TYPE) IS NOT NULL
    AND TRIM(OCCUPATION_TYPE) <> ''
GROUP BY 
    CODE_GENDER,
    NAME_INCOME_TYPE,
    OCCUPATION_TYPE
ORDER BY
	OCCUPATION_TYPE, NAME_INCOME_TYPE;
    
    
SELECT 
    CODE_GENDER,
    OCCUPATION_TYPE,
    ROUND(AVG(AMT_INCOME_TOTAL))   AS avg_income,
    ROUND(AVG(YEARS_EMPLOYED),2)     AS avg_years_employed
FROM credit_approval.credit_card_applications
WHERE 
    NAME_INCOME_TYPE <> 'Pensioner'
    AND NAME_INCOME_TYPE <> 'Student'
    AND YEARS_EMPLOYED < 45
    AND TRIM(OCCUPATION_TYPE) IS NOT NULL
    AND TRIM(OCCUPATION_TYPE) <> ''
GROUP BY 
    CODE_GENDER,
    OCCUPATION_TYPE
ORDER BY
	OCCUPATION_TYPE, avg_income desc;


SELECT 
    CODE_GENDER,
    ROUND(AVG(AMT_INCOME_TOTAL))   AS avg_income,
    ROUND(AVG(YEARS_EMPLOYED),2)     AS avg_years_employed
FROM credit_approval.credit_card_applications
WHERE 
    NAME_INCOME_TYPE <> 'Pensioner'
    AND NAME_INCOME_TYPE <> 'Student'
    AND YEARS_EMPLOYED < 45
    AND TRIM(OCCUPATION_TYPE) IS NOT NULL
    AND TRIM(OCCUPATION_TYPE) <> ''
GROUP BY 
    CODE_GENDER;


