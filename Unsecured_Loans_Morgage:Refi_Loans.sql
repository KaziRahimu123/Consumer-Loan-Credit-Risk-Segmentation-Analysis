use `credit_approval`;

select * from credit_approval.credit_card_applications;

ALTER TABLE credit_card_applications
DROP COLUMN DAYS_BIRTH;

ALTER TABLE credit_card_applications
DROP COLUMN DAYS_EMPLOYED;

select avg(AMT_INCOME_TOTAL) from credit_card_applications;

Select distinct OCCUPATION_TYPE from credit_approval.credit_card_applications;

-- Which demographic and income-type segments show the most stable employment among working-age applicants, and should therefore be prioritized for standard personal loan products?

SELECT
    -- Demographic class by car/house ownership
    CASE
        WHEN FLAG_OWN_CAR = 'Y' AND FLAG_OWN_REALTY = 'Y' THEN 'Owns car & house'
        WHEN FLAG_OWN_CAR = 'Y' AND FLAG_OWN_REALTY = 'N' THEN 'Owns car only'
        WHEN FLAG_OWN_CAR = 'N' AND FLAG_OWN_REALTY = 'Y' THEN 'Owns house only'
        ELSE 'Owns neither car nor house'
    END AS demographic_class,

    COUNT(*) AS applicant_count,
    ROUND(AVG(Years_Employed), 2) AS avg_years_employed,
    ROUND(AVG(AMT_INCOME_TOTAL), 0) AS avg_income_total
FROM credit_approval.credit_card_applications
WHERE
    NAME_INCOME_TYPE NOT IN ('Pensioner')
    AND Age BETWEEN 21 AND 65
    AND Years_Employed > 2
    AND Years_Employed < 45
    AND AMT_INCOME_TOTAL >= 40000 * CNT_FAM_MEMBERS
GROUP BY
    demographic_class
ORDER BY
    demographic_class;


SELECT
    demographic_class,
    income_segment,
    COUNT(*) AS applicant_count
FROM (
    SELECT
        -- Demographic class by car/house ownership
        CASE
            WHEN FLAG_OWN_CAR = 'Y' AND FLAG_OWN_REALTY = 'Y' THEN 'Owns car & house'
            WHEN FLAG_OWN_CAR = 'Y' AND FLAG_OWN_REALTY = 'N' THEN 'Owns car only'
            WHEN FLAG_OWN_CAR = 'N' AND FLAG_OWN_REALTY = 'Y' THEN 'Owns house only'
            ELSE 'Owns neither car nor house'
        END AS demographic_class,

        -- 50k income band as text: 0-50k, 50-100k, 100-150k, ...
        CONCAT(
            FLOOR(AMT_INCOME_TOTAL / 50000) * 50,        -- start (in k)
            '-',
            (FLOOR(AMT_INCOME_TOTAL / 50000) + 1) * 50,  -- end (in k)
            'k'
        ) AS income_segment
    FROM credit_approval.credit_card_applications
    WHERE
        NAME_INCOME_TYPE NOT IN ('Pensioner')
        AND Age BETWEEN 21 AND 65
        AND Years_Employed > 2
        AND Years_Employed < 45
        AND AMT_INCOME_TOTAL >= 40000 * CNT_FAM_MEMBERS
) AS t
GROUP BY
    demographic_class,
    income_segment
ORDER BY
    demographic_class,
    CAST(SUBSTRING_INDEX(income_segment, '-', 1) AS UNSIGNED);



-- The reason behind Selecting these people is
-- 1. Income must be at such a level which can support all family members properly
-- 2. They must be workable age people
-- 3. If they work for more than 2 years at a certain place, they are stable
-- 4. They have less than 45 years of work because in my dataset, I have weird numbers
-- 5. If they own a car and house, means they are financially disciplined.  


use `credit_approval`;

select * from credit_approval.credit_card_applications;

select max(CNT_CHILDREN), MIN(CNT_CHILDREN), max(CNT_FAM_MEMBERS), MIN(CNT_FAM_MEMBERS),
max(AMT_INCOME_TOTAL), MIN(AMT_INCOME_TOTAL), AVG(AMT_INCOME_TOTAL), NAME_HOUSING_TYPE
FROM credit_approval.credit_card_applications
GROUP BY NAME_HOUSING_TYPE;

Select NAME_HOUSING_TYPE, round(Avg(AMT_INCOME_TOTAL)) as HouseHold_Income, round(AVG(CNT_FAM_MEMBERS),2) as Family_Members
from credit_approval.credit_card_applications
where Age < 100 
and Years_Employed < 65
group by NAME_HOUSING_TYPE
order by Avg(AMT_INCOME_TOTAL) desc, AVG(CNT_FAM_MEMBERS) desc;

-- People who are eligible for unsecured personal loans.
SELECT 
    FLOOR(AMT_INCOME_TOTAL / 50000) AS income_group,
    CONCAT(
        '$', FORMAT(FLOOR(AMT_INCOME_TOTAL / 50000) * 50000, 0),
        ' - ',
        '$', FORMAT(FLOOR(AMT_INCOME_TOTAL / 50000) * 50000 + 49999, 0)
    ) AS income_bracket,
    COUNT(*) AS num_people
FROM credit_approval.credit_card_applications
WHERE 
    NAME_HOUSING_TYPE <> 'Office apartment'
    AND (
        AMT_INCOME_TOTAL >= 50000 * CNT_CHILDREN 
        OR AMT_INCOME_TOTAL >= 45000 * CNT_FAM_MEMBERS
    )
    AND (
        AMT_INCOME_TOTAL <= 250000 * CNT_CHILDREN
        OR AMT_INCOME_TOTAL <= 150000 * CNT_FAM_MEMBERS
    )
    AND CNT_CHILDREN < 7
    AND Years_Employed < 45 
    AND Years_Employed > 2
    AND Age >= 21 
    AND Age < 65
    AND OCCUPATION_TYPE IS NOT NULL
    AND TRIM(OCCUPATION_TYPE) <> ''
GROUP BY 
    income_group, income_bracket
ORDER BY 
    income_group;



-- Who Qualify for long term mortgage one
SELECT 
    FLOOR(AMT_INCOME_TOTAL / 50000) AS income_group,
    CONCAT(
        '$', FORMAT(FLOOR(AMT_INCOME_TOTAL / 50000) * 50000, 0),
        ' - ',
        '$', FORMAT(FLOOR(AMT_INCOME_TOTAL / 50000) * 50000 + 49999, 0)
    ) AS income_bracket,
    COUNT(*) AS num_people
FROM credit_approval.credit_card_applications
WHERE 
    NAME_HOUSING_TYPE <> 'Office apartment'
    AND (
        AMT_INCOME_TOTAL >= 50000 * CNT_CHILDREN 
        OR AMT_INCOME_TOTAL >= 40000 * CNT_FAM_MEMBERS
    )
    AND (
        AMT_INCOME_TOTAL <= 200000 * CNT_CHILDREN
        OR AMT_INCOME_TOTAL <= 100000 * CNT_FAM_MEMBERS
    )
    AND CNT_CHILDREN < 7
    AND Years_Employed < 45 
    AND Years_Employed > 2
    AND Age >= 21 
    AND Age < 65
    AND OCCUPATION_TYPE IS NOT NULL
    AND TRIM(OCCUPATION_TYPE) <> ''
    AND FLAG_OWN_REALTY = 'Y'
GROUP BY 
    income_group, income_bracket
ORDER BY 
    income_group;





