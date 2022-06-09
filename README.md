# Project-2

# Introduction
This project is designed to conduct a presentation of business information or Business Intelligence by extracting, transforming, and loading data of restaurants and menus in the US that are partnered with Uber Eats.
The purpose of this project was to build a database that demonstrates insights within various restaurants across the US. The database is built on by ingesting, combining, and restructuring data from our main data source into a conformed one Postgresql database. 

## Some questions that we want to answer would be:
1. How many Restaurants are around the USA?
2. What are the Most Popular/Highly Rated Restaurants and menus?
3. Is there any relationship between the price level and the popularity of a restaurant?
4. Which menus are more expensive?
5. Which menus are very common in the USA?
6. Where are the highest-rated restaurands located?
7. Is there a relationship between ratings and location?


# Data Transformation
- We used a Pandas functions in Jupyter Notebook to transform all CSV files, scraped and cleaned data.
- We reviewed the files and transformed into a dataframes.
- We used a python transformation functions for data cleaning, joining, and filtering.
- Duplicate rows was removed, and successfully managed.
- Zip code and positions columns were removed.
- Address column was split by street, city, state and zip code.

# Data Load
- Finally, we used a relational database called Postgresql. In a total of three tables the data loaded successfully.
- Final tables/collections are stored in the database.
