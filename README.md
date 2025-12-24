# Consumer-Loan-Credit-Risk-Segmentation-Analysis
![Consumer Loan & Credit Risk Segmentation Analysis](assets/Consumer%20Loan%20Project%20Banner.png)
# Author
[Kazi Rahimu Islam](https://github.com/KaziRahimu123)

# Key Findings
The strongest, lowest-risk growth opportunity comes from balancing income and stability rather than prioritizing a single factor.

# Table of Content
- [Author](#author)
- [Description](#description)
- [Key Findings](#key-findings)

# Business Problem
The core business problem is how to grow consumer lending profitably without increasing default risk by using application data to target and approve the right customers with the right offers. The lender needs to identify which demographic and income segments show strong job stability for standard loans, match housing situation and dependent burden to the correct product (unsecured vs. longer-term home-related loans), design pricing and credit limits that balance income and employment tenure (including gender patterns in the data), and isolate “premium” profiles that combine higher income with low household burden for low-risk, high-value credit products.
The core business problem is broken down into four segments-

1️⃣ Which demographic and income-type segments show the most stable employment among working-age applicants, and should therefore be prioritized for standard personal loan products?

2️⃣ How does the housing situation relate to income and family burden, and which housing segments should be prioritized for unsecured personal loans vs. longer-term mortgage or home-improvement products?

3️⃣ Are there meaningful differences between male and female applicants in income and employment characteristics that could influence how loan products are priced or marketed?

4️⃣ Which applicant profiles combine higher income with lower dependent burden, making them strong candidates for a “premium” credit card or low-risk personal loan offer?

# Data Source
[Kaggle credit card approval prediction](https://www.kaggle.com/datasets/rikdifos/credit-card-approval-prediction)

# Methods
1. Data cleaning & filtering
2. Exploratory Data Analysis
3. Segmentation / cohort grouping
4. Aggregation & KPI analysis
5. Comparative analysis

# Tech Stack
1. SQL 
2. Excel
3. Tableau

# Quick glance at the results

## People with Most Stable Employment Status for Standard Personal Loans

[![People with Most Stable Employment Status (Tableau Preview)](assets/Clients%20with%20Most%20Stable%20Income%20for%20Standard%20Loan%20Products.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/PeoplewithMostStableEmploymentStatusforStandardLoanProducts/Sheet1#1)

For Stability First Approach: house-only applicants

For Income First Approach: car & house and car-only applicants

For a mix of both: Prioratize people who own assets like house or car because people who don't are vulnerable and may be under financial pressure

## Housing, Income & Family Burden: Segment Prioritization for Unsecured Loans vs. Home-Based Products

[![People Who Qualify for Unsecured Loans (Tableau Preview)](assets/People%20Who%20Qualify%20for%20Unsecured%20Loans.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/ClientsforUnsecuredLoansLongerTermMortgage/Dashboard1)

[![People Who Qualify For Longer Term Mortgage (Tableau Preview)](assets/People%20who%20qualify%20for%20long%20term%20mortgage.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/ClientsforUnsecuredLoansLongerTermMortgage/Dashboard1)

Mortgage focus:  We should focus on $100k–$199k clients, because that’s where most mortgage-qualified clients sit.

Unsecured focus: We should focus on $100k–$249k, with a strong extension into $250k – $299k. 

Cross-sell opportunity: We should build a mortgage readiness / pre-approval path targeting $200k–$299k unsecured-qualified clients. For clients 100k-200k within the unsecured loans category, we should approve them for limited unsecured loans based on their income stability and other related factors so that it doesn’t become risky for the bank.

## Gender-Based Differences in Income & Employment for Loan Pricing and Marketing

[![How Many More Years Men Have Worked Than Women in the Same Profession (Tableau Preview)](assets/How%20Many%20More%20Years%20Men%20Have%20Worked%20Than%20Women%20in%20the%20Same%20Profession.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/EarningExperienceGapBetweenGenders/Sheet2#3)

[![Percentage by Which Men Earn More Than Women in the Same Profession (Tableau Preview)](assets/Percentage%20by%20Which%20Men%20Earn%20More%20Than%20Women%20in%20the%20Same%20Profession.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/EarningExperienceGapBetweenGenders/Sheet2#3)

Income gap: men average ~$218k vs women ~$181k, so men earn ~20% more overall.

Stability: women average 7.57 years employed vs men 5.93, so women have 1.6 more years of tenure on average.

So we should focus on both income and stability during product pricing and marketing products.

Also, women should have easier income requirements than men if they have a stable work history.
Men should have a stricter income requirement and a comparatively less strict stability requirement.

## Premium Candidate Profiles: High Income with Low Dependent Burden for Low-Risk Credit Offers

[![Premium Client Insights: Education, Income & Family Status (Tableau Preview)](assets/Premium%20Client%20Insights_%20Education%2C%20Income%20%26%20Family%20Status.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/PremiumClientsforCredit/Dashboard1_1#2)

[![Premium Client Insights: Family Status, Housing & Income (Tableau Preview)](assets/Premium%20Client%20Insights_%20Family%20Status%2C%20Housing%20%26%20Income.png)](https://public.tableau.com/app/profile/kazi.islam5206/viz/PremiumClientsforCredit/Dashboard1_1#2)

Higher education has the top average income $290,966, while Secondary/Secondary Special is slightly lower at $277,463. They also have the highest number of clients.
So we should prioritize clients with higher education as premium clients.

In family status, we don’t have that much difference in income, so it's not a helpful category.

Co-op apartments have the highest average income $306,153, followed by rents $285,092. We can offer those clients premium features related to housing such as premium low interest rates.

Single/ Married people have mixed positions in terms of income in different housing categories.

# Lessons learned and recommendation

Income and Stability Both Matters: It depends on us if we want to prioritize any one specific criteria but both matter in reality.

Asset ownership is a strong signal: People who own a house and/or a car tend to look less financially vulnerable than those with no assets, which supports a risk-first segmentation strategy.

Income bands reflect the product we prefer for customers: People from 100k-250k are the ones that qualify for both Income vs. stability tradeoff shows up clearly by gender (men higher income, women higher work years), which reinforces that pricing/limits should account for both capacity and stability (not just income).

Premium signals are clearer in education & housing than family status: Higher education and certain housing types (like co-ops) show stronger premium-income patterns, while family status doesn’t separate income enough to be a reliable premium filter.

There’s a built-in cross-sell funnel: Unsecured-qualified clients in $200k–$299k look like the best group for a mortgage readiness / pre-approval pathway.

Standard loans (stability-first): Prioritize house-only applicants (and generally asset owners).

Higher-limit Increase for credit cards (income-first): Target car & house and car-only applicants.

Mortgage focus: Concentrate on $100k–$199k or more income clients with no house.

Unsecured focus: Prioritize $100k–$249k, extend into $250k–$299k for strong profiles.

Cross-sell: Create a mortgage readiness / pre-approval path for $200k–$299k unsecured-qualified clients.  
Give $100k–$200k unsecured clients smaller limits unless stability is strong.

Pricing/marketing: Use income + work stability together (apply rules consistently across everyone).

Premium targeting: Prioritize higher education clients and high-income housing segments (like co-ops/high-income renters) with premium rate/benefit offers.

# Limitations and What Could Have Been Improved

1. No real Credit score ( In real life, we have credit scores as a big factor)

2. We don’t have a default dataset which will help us figure out clients (patterns in their record) who defaulted

3. If we had asset values for clients not just their status, it would have been better for calculation.

4. We should have had interest rates, QE (Quantitative Easing), QT (Quantitative Tightening) and more info to do deeper analysis.



