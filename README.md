# Project 2 - ETL: Extract, Transform, Load
## Uber Eats USA Restaurants and Menus :hamburger: :pizza: :bento:
![alt text](https://www.jotform.com/blog/wp-content/uploads/2020/04/ubereats-alternatives.jpg)


## Introduction
This project is designed to conduct a presentation of business information by extracting, transforming, and loading data of restaurants and menus in the US that are partnered with Uber Eats.

The purpose of this project was to build a database that demonstrates insights within various restaurants across the US. The database is built on by ingesting, combining, and restructuring data from our main data source into one Postgresql database in order to gain valuable insights.

### Questions Data Can Answer
SQL functions can be used to create queries to join tables and answer questions, such as:
1. How many Restaurants are around the USA?
2. What are the Most Popular/Highly Rated Restaurants and menus?
3. Is there any relationship between the price level and the popularity of a restaurant?
4. Which menus are more expensive?
5. Which menus are very common in the USA?
6. Where are the highest-rated restaurands located?
7. Is there a relationship between ratings and location?

### Contributors
<b>Stefanie Gagnon</b>
  - Found and chose Restaurant dataset to analyze.
  - Jupyter Notebook data cleanup and coding. 
  - Postsql schema & queries.

<b>Blanca Carretero</b>
- Found and chose Restaurant dataset to analyze.
- Found questions for analysis and description of value the data has in real-world situations.
- Readme formatting and Presentation of final analysis.

<br>

## Inside Respository
- Jupyter Notebook for importing, transforming, and loading data using Pandas, OS, CSV, and SQLAlchemy.
- Schema.sql for table creation in Postgresql.
- Query.sql for visualizing the exported tables.
- Resources folder including CSV files and references.

<br>

## Our Process
### Data Import
- Found Uber Eats Restaurant Data from Kaggle.com.
- See our <a href="https://github.com/skgag1216/Project-2/blob/main/Resources/References/reference_page.md#references">Reference Page</a> for link to Kaggle dataset and download-able CSVs.
- Imported CSV files into Jupyter Notebook for data cleanup and transformation.

### Data Transformation
- Used a Pandas functions in Jupyter Notebook to transform all CSV files and cleaned data.
- Reviewed the files and transformed into a dataframes.
- Used python transformation functions for data cleaning and filtering.
- Duplicate rows were removed, and successfully managed.
- Address column was split by street, city, state and zip code.
- Additional "Zip code" and "positions" columns were removed.
- Reordered the columns for a specific, usable order.
- Set index to restaurant IDs.
- Created Restaurant data frame with cleaned data (restaurant_df), and removed NULL values in rows ratings, score, and price range.
- Kept original copy of Restaurant Data CSV (original_restaurant_df) with all restaurant information. 
- Inspected the menu data for NULL values and determined all NULL values were in the "description" column.
- Determined it was valuable to keep NULL values in this column for analysis (see notes in Jupyter Notebook).

### Data Loading
- Inside Jupyter Notebook, we created a database connection using SQLAlchemy.
- Created Restaurant database (restaurant_db) in Postgresql, then ran database connection code.
- A total of three tables were loaded successfully.
- Final tables/collections were stored in the database.
- Loaded data frames into the database using SQLAlchemy coding.

<br>

## Findings
- With the original restaurant data, we started with a total of 5,000 rows. We wanted to narrow it down to restaurs with rating scores and pricings, removing the NULL values. After cleaning the data, we were left with 1,907 rows of data. Thus, working with about 38% of the original data. 
- For the menu data, all NULL values in the description column, we had 87,285 rows of NULL values out of 403,240 total rows. We determined it is useful to keep the description column and all of the rows. Instances where it would be counter productive to delete the entire row for a NULL 'description' are where 'name' gives us sides like 'fries' or 'okra' and 'description' is blank. If we delete the entire row, we would lose the information of what sides certain restaurants offer.

<br>

## Future Considerations
- With these particular dataset, it is an additional possibility to use data inside an API (such as google places API) to gather more information of other surrounding restaurants, additional data for the restaurants found in the original dataset, and data for the unrated restaurans.
- Could use the latitude/longitute information in dataset to gather more insights on restaurants (such as open/close times, additional ratings and reviews).
- Could have done comparison analysis using APIs for city population and ratings for listed restaurants.
- Could possibly compare highly-rated restaurants with population and menu items from these restaurants.

