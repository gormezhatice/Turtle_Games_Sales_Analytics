# Project Background: Enhancing Sales Performance through Data Analysis at Turtle Games
Turtle Games boasts a diverse product range, including books, board games, video games, and toys, both self-manufactured and sourced from other companies. The company, aiming to enhance overall sales performance by tapping into customer trends, approached us with specific queries.

The investigation delved into understanding how customers accumulate loyalty points, identifying groups within the customer base for targeted marketing, leveraging social data such as customer reviews for informed marketing campaigns, assessing the impact of each product on sales, evaluating data reliability through measures like normal distribution, skewness, or kurtosis, and exploring potential relationships between North American, European, and global sales.

The project unfolds as a strategic pursuit to unravel key insights that will empower Turtle Games in refining their marketing strategies and boosting overall sales performance.

# Data Analysis and Insights:

#### renumeration vs loyalty

<img width="917" alt="Screenshot 2024-01-16 at 14 46 49" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/6fc3b40c-7336-43fd-ad15-3dd030f0682e">

#### spending vs loyalty

<img width="914" alt="Screenshot 2024-01-16 at 14 33 59" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/5172c3ff-ecee-4439-b54c-6878af74f124">

#### age vs loyalty

<img width="921" alt="Screenshot 2024-01-17 at 11 42 32" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/d124ef73-0e51-4e0e-84a9-28bdfab6c05b">

I analysed Turtle Games' datasets using Python and R, ensuring data integrity. The Turtle reviews dataset, covering customer demographics and product-related info, revealed key insights. Customers, aged 17 to 72, showed an average remuneration of £48 and a diverse spending score. Loyalty points correlated positively with age and remuneration, indicating that older customers and those with higher income accumulate more points.

For Turtle Games' objectives, I employed Python libraries (statsmodels, scikit-learn, nltk) and R's tidyverse for machine learning and visualisations. The initial simple linear regression models for age, remuneration, and spending score had low R-squared values. A multiple linear regression model improved to R-squared 0.85 but exhibited heteroscedasticity and moderate errors, necessitating further model refinement.

<img width="706" alt="Screenshot 2024-01-17 at 11 43 41" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/43e977c7-3680-4595-b0ae-41696f53bce7">

Utilizing the elbow and silhouette methods in the k-means clustering process, I identified five distinct customer groups within Turtle Games' customer base. For sentiment analysis, I standardized texts by making them lowercase, removing punctuation, and maintaining stopwords for context. Notably, I opted to remove duplicates from each sentiment column separately to preserve individuality.

<img width="756" alt="Screenshot 2024-01-17 at 12 12 55" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/7ea89611-0a53-43f0-b250-416c5ed01fb9">


In R, a critical step involved grouping data by the product column, aligning with Turtle Games' focus on sales impact per product. The Elbow Method revealed a rapid decrease in Within-Cluster-Sum of Squares up to 5 clusters, indicating it as the optimal number. Silhouette scores affirmed this choice, further supporting 5 clusters as the most suitable grouping for meaningful insights into Turtle Games' customer segments.

<img width="750" alt="Screenshot 2024-01-17 at 11 44 15" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/ae86cd17-03a6-4aa2-ae28-4c50fb1bd438">

# Data Visualization Insights
<img width="756" alt="Screenshot 2024-01-17 at 12 12 55" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/6ab51d05-728c-4790-a0b1-aaa18b2a5f3e">

The analysis indicates that for both 'remuneration' and 'spending_score' features, 5 clusters emerge as the optimal choice. Examining cluster sizes, Cluster 0 stands out as the largest with 1293 observations, while Clusters 1 and 2 are roughly equal, comprising 351 and 356 observations respectively. Noteworthy patterns in remuneration and spending score emerge, revealing that Cluster 0 represents moderate earners with moderate to high spending, Cluster 1 denotes high earners with low spending (potentially conservative), and Cluster 2 signifies affluent individuals with high earnings and spending. These insights provide a clear segmentation of Turtle Games' customer base, aiding targeted marketing and sales strategies.

<img width="448" alt="Screenshot 2024-01-26 at 11 55 47" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/64ebb83a-e325-4089-8955-3cbd1170185b">


<img width="797" alt="Screenshot 2024-01-17 at 12 32 20" src="https://github.com/gormezhatice/Turtle_Games_Sales_Analytics/assets/133010718/c7bdbee5-71e5-4e48-9aa5-8eda9dcc5d38">

