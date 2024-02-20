
############ install necessary packages 

library(dplyr)

############ set working directory 

directory_path <- "/Users/halimamalal/Downloads/UCI HAR Dataset"

files_in_directory <- list.files(directory_path, full.names = TRUE)

##################### files for the test data set 

file1 <- "test/X_test.txt"
file2 <- "test/subject_test.txt"
file3 <- "test/y_test.txt"
############ read test data 

test <- read.table(file.path(directory_path, file1), header = FALSE)

subject <- read.table(file.path(directory_path, file2), header = FALSE)

testy <- read.table(file.path(directory_path, file3), header = FALSE)

######## merge test data 

testdata <- cbind(subject,testy, test)

######### name the variables for the first two columns 

colnames(testdata)[1] <- "subject_id"

colnames(testdata)[2] <- "labels"

################ add variable names to the data set 

# read features text

file7 <- "features.txt"

features <- read.table(file.path(directory_path, file7), header = FALSE)
#add variable names 
colnames(testdata)[3:ncol(testdata)] <- features$V2

##################### files for the train data set 

file4 <- "train/X_train.txt"
file5 <- "train/subject_train.txt"
file6 <- "train/y_train.txt"
############ read train data 

test2 <- read.table(file.path(directory_path, file4), header = FALSE)

subject2 <- read.table(file.path(directory_path, file5), header = FALSE)

testy2 <- read.table(file.path(directory_path, file6), header = FALSE)

######## merge train data 

traindata <- cbind(subject2,testy2, test2)

######### name the variables for the first two columns 

colnames(traindata)[1] <- "subject_id"

colnames(traindata)[2] <- "labels"

################ add variable names to the data set 
colnames(traindata)[3:ncol(traindata)] <- features$V2

################# merge traindata and testdata

merged_data <- rbind(traindata, testdata)

#################### extract the columns with mean and std 


# Use grep to find column indices with "mean" or "std" in their names
selected_columns <- grep("mean|std", colnames(merged_data))

# Subset your dataset based on the selected columns
filtered_data <- merged_data[, selected_columns]


finaldata <- cbind(merged_data$subject_id, merged_data$labels, filtered_data)

colnames(finaldata)[1] <- "subject_id"

colnames(finaldata)[2] <- "labels"

######################### addtion of descriptive activity names to name the activities in the lables columns

# read the file
file8 <- "activity_labels.txt"

activities <- read.table(file.path(directory_path, file8), header = FALSE)
# name the variables 
colnames(activities)[1] <- "labels_number"

colnames(activities)[2] <- "labels_name"


# Merge data sets based on activity_number
data11 <- merge(finaldata, activities, by.x = "labels", by.y = "labels_number", all.x = TRUE)

# Replace numeric labels with activity names
data11$labels <- data11$labels_name

############################## creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data11 <- data11[, -82]


result <- aggregate(. ~ subject_id + labels, data = data11, FUN = mean)

################### create a tide data set 
file_path <- "/Users/halimamalal/Downloads/UCI HAR Dataset/my_data.txt"

write.table(result, file = file_path, row.names = FALSE)

