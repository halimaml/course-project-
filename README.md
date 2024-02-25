# UCI HAR Dataset Analysis

## Overview
This R script analyzes the UCI Human Activity Recognition (HAR) Dataset. It performs the following steps:
1. Merging test and train datasets.
2. Extracting columns with mean and std.
3. Adding descriptive activity names.
4. Creating a second tidy data set with the average of each variable for each activity and each subject.

## Prerequisites
Ensure that the required R packages (`dplyr`) are installed before running the script.

```R
# Install necessary packages
install.packages("dplyr")
library(dplyr)
