# Codebook

## Description
This codebook provides information about the variables used in the R script for analyzing the UCI HAR Dataset.

## Variables

1. `subject_id`: Identifier for the subject participating in the study.
2. `labels`: Activity labels representing different physical activities.
   - 1: Walking
   - 2: Walking Upstairs
   - 3: Walking Downstairs
   - 4: Sitting
   - 5: Standing
   - 6: Laying
3. ... (Other variables): Detailed information about other variables can be found in the features.txt file.

## Transformations
1. Merging test and train datasets.
2. Extracting columns with mean and std.
3. Adding descriptive activity names.
4. Creating a second tidy data set with the average of each variable for each activity and each subject.

## Data Output
The final tidy dataset is saved as 'my_data.txt'.

## Note
Please make sure to set the working directory to the correct path containing the 'UCI HAR Dataset' folder before running the script.
