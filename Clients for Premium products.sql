use credit_approval;

select * from credit_approval.credit_card_applications;


select NAME_EDUCATION_TYPE, NAME_FAMILY_STATUS, NAME_HOUSING_TYPE,count(*) as Client_Count, round(avg(AMT_INCOME_TOTAL)) as Average_Income from credit_approval.credit_card_applications
where AMT_INCOME_TOTAL >=(Select AVG(AMT_INCOME_TOTAL) from credit_approval.credit_card_applications)
and CNT_CHILDREN <=2
and CNT_FAM_MEMBERS <=4
and Age>=21 and Age <=55
and Years_Employed <=30
and Years_Employed >=3
and NAME_INCOME_TYPE <> 'Pensioner'
AND NAME_INCOME_TYPE <> 'Student'
AND TRIM(OCCUPATION_TYPE) IS NOT NULL
AND TRIM(OCCUPATION_TYPE) <> ''
AND NAME_HOUSING_TYPE <> "Office apartment"
group by NAME_EDUCATION_TYPE, NAME_FAMILY_STATUS, NAME_HOUSING_TYPE
order by Client_Count desc,Average_Income desc;