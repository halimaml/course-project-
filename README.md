# course-project-
course project of the coursera class " getting and cleaning data"
first you need to install the zip file that contain the samsung data from this link  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

then you create your working directory 
read the files X_test, y_test, subject_test
combine the three files using th cbind function 
use the function colnames to give the names of the first two columns "subject_id" and "labels"
add variable names to data set from the file "features.txt" using colnames 
follwo steps 7-10 for both test and train data 
merge train and test data using rbind function 
extract columns with mean and std using the function grep 
replace the numbers in the labels columns by the name of the activities using merge function 
use aggregate the group the data based on subject_id and the performed activity 
create a txt file and store the result on it using the write.table function 
