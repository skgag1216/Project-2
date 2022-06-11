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

<br>

## Inside Respository
- Jupyter Notebook for importing, transforming, and loading data using Pandas, OS, CSV, and SQLAlchemy.
- Schema.sql for table creation in Postgresql.
- Query.sql for visualizing the exported tables.
- Resources folder including CSV files and references.

<br>

## Instructions
#### Installation
1. Gather restaurant data and CSV files from <a href="https://www.kaggle.com/datasets/ahmedshahriarsakib/uber-eats-usa-restaurants-menus?resource=download)">Kaggle</a> by selecting Download in top-right corner of page. A zipped file will be downloaded including the CSV files for restaurants and menu information. Select both CSV files and save them in a folder of your choosing.
2. Clone this repository to your machine.
3. Move folder with restaurant CSV files into repository folder.
4. Make sure the libraries that are being used are installed (Pandas, OS, CSV, SQLAlchemy).
5. Open repository in Jupyter Notebook using the appropiate command line interface.
#### Usage
6. All can be done within one Jupyter Notebook. Inside the Jupyter Notebook, import all libraries listed above.
7. For SQLAlchemy dependency, run the following line: 
```Python 
from sqlalchemy import create_engine
```
8. To import CSV data, create a variable and use ``` os.path.join ``` function, listing in quotations your folder path for the CSV files. For example:
```Python
csvpath = os.path.join("Repository", “RestaurantData“, "restaurants.csv”)
```
9. Create a new variable for data frame to be read into. Have this equal to ``` pandas.read_csv() ``` with the previously created variable inside parenthesis.
``` Python
restaurant_data = pd.read_csv(csvpath)
```
10. Repeat steps 8-9 for restaurant menu data and create new variables, so you can easily differentiate the data frames.
#### Data Cleanup
11. We kept a full list of restaurants before any data manipulation by running:
``` Python
original_restaurant_df = restaurant_data.copy()
```
12. We expanded the full address column out to street, city, and state by running:
``` Python
original_restaurant_df[['street', 'city', 'state', 'zip']] = original_restaurant_df['full_address'].str.split(',', 3, expand=True) 
``` 
13. Deleted certain columns (such as ZIP code and position) by running:
``` Python
del original_restaurant_df['zip']
``` 
14. You can reorder columns to your preference, for example:
``` Python
original_restaurant_df = original_restaurant_df.reindex(columns=['id','name', 'score','ratings','category', 'price_range',
                                              'full_address', 'street', 'city', 'state', 'zip_code', 'lat', 'lng'])
```
15. Set the index to the restaurant's IDs by running:
``` Python
original_restaurant_df.set_index("id", inplace = True)
```
16. Repeat steps 11-14 to create new data frame with cleaned data (step 15 will be done after data cleanup). Save cleaned data frame into a new variable.
17. Clean data by removing null values. Drop rows with NULL values in score and rating (using code to keep rows that are not null):
``` Python
restaurant_df = restaurant_df[restaurant_df['score'].notna()]
restaurant_df = restaurant_df[restaurant_df['ratings'].notna()]
```
Drop rows with Nan values in price_range:
```Python
restaurant_df = restaurant_df.dropna(subset = ['price_range'])
```
18. Repeat step 15 to set index to Restaurant IDs.
19. Clean up the menu data. First we will find total rows. We used this code: ```menu_data.isnull()``` in our notebook, but you can also use  ```len(<name_of_menu_df>)```
20. Determine which rows any missing values are in ``` menu_data.isnull().sum() ```
21. Determine whether or not you'd like to keep columns with null values (possibly reinspect CSV file within Excel). 

#### Create Database Connection
22. Create restaurant_db in pgAdmin, then run database connection code:
``` Python
connection_string = "enterprisedb:password@localhost:5444/restaurant_db"
engine = create_engine(f'postgresql://{connection_string}')
```
<i>Note: This line of code might need to be changed depending on your machine</i>
```enterprisedb:password@localhost:5444```

23. Confirm tables by running ```engine.table_names()```

<i>Note: Make sure output returns an empty list</i>

#### Load Data Frames Into Database
24. Run code for each data frame:
``` Python
original_restaurant_df.to_sql(name='original_restaurants', con=engine, if_exists='append', index=True)
```
<i>Note: Make sure to change the variable name in ```original_restaurant_df.to_sql``` and name of Table in ```name='original_restaurants``` depending on data frame. Repeat for each data frame, original restaurant data, and new cleaned data.</i>

25. Run and save code inside Jupyter Notebook.
26. Inside pgAdmin, inspect tables and create query:
``` 
    SELECT * FROM original_restaurants;
    SELECT * FROM restaurants;
    SELECT * FROM menu; 
```




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
- With the original restaurant data, we started with a total of 5,000 rows. We wanted to narrow it down to restaurants with rating scores and pricings, removing the NULL values. After cleaning the data, we were left with 1,907 rows of data. Thus, working with about 38% of the original data. 
- For the restaurant menu data, we had 87,285 rows of NULL values in the description column out of 403,240 total rows. We determined it is useful to keep the description column and all of the rows. Instances where it would be counter productive to delete the entire row for a NULL 'description' could be where 'name' gives us sides like 'fries' or 'okra' and 'description' is blank. If we delete the entire row, we would lose the information of what sides certain restaurants offer and therefore lose valuable data.

<br>

## Future Considerations
- For the restaurant menu data, combining the name column with the description column could be more useful.
- With these particular dataset, it is an additional possibility to use data inside an API (such as google places API) to gather more information of other surrounding restaurants, additional data for the restaurants found in the original dataset, and data for the unrated restaurans.
- Could use the latitude/longitute information in dataset to gather more insights on restaurants (such as open/close times, additional ratings and reviews).
- Could have done comparison analysis using APIs for city population and ratings for listed restaurants.
- Could possibly compare highly-rated restaurants with population and menu items from these restaurants.

<br> 

### Contributors
<b>Stefanie Gagnon</b>
  - Found and chose Restaurant dataset to analyze.
  - Jupyter Notebook data cleanup and coding. 
  - Postsql schema & queries.

<b>Blanca Carretero</b>
- Found and chose Restaurant dataset to analyze.
- Found questions for analysis and description of value the data has in real-world situations.
- Readme formatting and Presentation of final analysis.
