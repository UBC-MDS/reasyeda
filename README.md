# reasyeda

<!-- badges: start -->

[![Codecov test coverage](https://codecov.io/gh/UBC-MDS/reasyeda/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/reasyeda?branch=master)
<!-- badges: end -->

Since exploratory data analysis is an imperative part of every analysis, the goal of the `reasyeda` package is to provide efficient data scrubbing and visualization tools to perform preliminary EDA on raw data. The package can be leveraged to clean the dataset and visualize relationships between features to generate insightful trends.

This package is developed by James Kim, Kristin Bunyan, Sukhleen Kaur, and Luming Yang.

## **Functions**

-   `clean_up` - This function takes in a dataframe object and performs initial steps of EDA on unstructured data. It returns a clean dataset by removing null values and identifying potential outliers in numeric variables based on a defined threshold.

-   `birds_eye_view` - This function takes in a dataframe object and visualizes the distributions of variables in the form of histograms and density plots. It also generates a correlation heatmap for numeric variables to study their relationships.

-   `close_up` - This function accepts a dataframe and the number of pairs of variables with strongest correlations. It creates scatterplots with a linear trend for each pair of variables with stronglest correlations.

-   `summary_suggestions` - This function takes in a dataframe object and outputs a list of summary statistics for numeric and categorical variables. In addition, it also returns a list for the count and percentage of unique values in the categorical variables.

Other packages that offer similar functionality are:

-   [edar](https://github.com/UBC-MDS/edar)
-   [DataExplorer](https://www.rdocumentation.org/packages/DataExplorer/versions/0.8.1)
-   [eaziReda](https://github.com/UBC-MDS/eaziReda)

## Installation

You can install the development version of reasyeda from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/reasyeda")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(reasyeda)
## basic example code
toy_data <- data.frame(
    income = c(5, 8, 10, 12, 17, 19),
    house_size = c(700, 600, 900, 1000, 1200, 1500),
    views = c("mountain", "river", "sea", "mountain", "urban", "forest"),
    price = c(65, 50, 80, 98.5, 112, 133),
    doctor_visits = c(6, 8, 4, 5, 3, 2)
  )
 clean_up(toy_data)
 birds_eye_view(toy_data)
 close_up(toy_data)
 summary_suggestions(toy_data)
 
```
