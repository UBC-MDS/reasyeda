# reasyeda

<!-- badges: start -->

<!-- badges: end -->

Since exploratory data analysis is an imperative part of every analysis, the goal of the `reasyeda` package is to provide efficient data scrubbing and visualization tools to perform preliminary EDA on raw data. The package can be leveraged to clean the dataset and visualize relationships between features to generate insightful trends.

## **Functions**

-   `clean_up` - This function takes in a dataframe object and performs initial steps of EDA on unstructured data. It returns a clean dataset by removing null values and identifying potential outliers in numeric variables based on a defined threshold.

-   `birds_eye_view` - This function takes in a dataframe object and visualizes the distributions of variables in the form of histograms and density plots. It also generates a correlation heatmap for numeric variables to study their relationships.

-   `close_up` - This function accepts a dataframe and the number of pairs of variables with strongest correlations. It creates scatterplots with a linear trend for each pair of variables with stronglest correlations.

-   `summary_suggestions` - This function takes in a dataframe object and outputs a table of summary statistics for numeric and categorical variables and a table for percentage of unique values in the categorical variables.

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
```
