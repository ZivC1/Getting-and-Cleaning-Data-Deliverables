## Downloading the  and unzipping
#-----------------------------------
url01 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

library(downloader)
download.file(url = url01, destfile= "dataset.zip",mode = "wb")
unzip( "dataset.zip", exdir = "./")


## Reading files into data frames
#----------------------------
setwd("UCI HAR Dataset")
x_test <- read.table("./test/X_test.txt", na.strings = NA)
y_test <- read.table("./test/y_test.txt", na.strings = NA)
subject_test <- read.table("./test/subject_test.txt", na.strings = NA)



x_train <- read.table("./train/X_train.txt", na.strings = NA)
y_train <- read.table("./train/y_train.txt", na.strings = NA)
subject_train <- read.table("./train/subject_train.txt", na.strings = NA)

## Step 1-  Merge the training and test sets to create one data set
#--------------------------

# add required columns to test set 
unified_test <-cbind(subject_test, x_test) # subect id in the first column
unified_test <- cbind(unified_test, y_test) #  the outcome "y" is in the last column

# add required columns to train set
unified_train <-cbind(subject_train, x_train) # subect id in the first column
unified_train <- cbind(unified_train, (y_train)) #  the outcome "y" is in the last column. charachter b/c of later replacement with labels

# combine the test and train files
unified <- rbind(unified_train, unified_test)
dim(unified)

## Step 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
#-----------------------------------

# add column names to the table
col_names <- read.table("features.txt", stringsAsFactors = FALSE)
col_names[, 1] <- NULL   # omit first column

temp  <- data.frame(V2 = "user_id", stringsAsFactors = FALSE)
col_names <- rbind(temp, col_names)  # attach "user_id to front

temp  <- data.frame(V2 = "activity_code", stringsAsFactors = FALSE)
col_names <- rbind(col_names, temp)  # attach "activity code" to back
col_names <- t(col_names)  # put all names in columns in stead of rows
colnames(unified) <- as.vector(col_names) #"unified" now has all columns

# search of indices of column names that fits the criteria
vec <- grepl("mean()|std()|user_id|activity_code", names(unified)) # find column positions
unified_mean_std <- unified[, vec]  # subset the dataframe with the logial vect


## Step 3- Uses descriptive activity names to name the activities in the data set
#-----------------------------------
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
# perform subsetting to create a new column that hold labels: "sitting" "walking"...
unified_mean_std$activity_label <- activity_labels$V2[unified_mean_std$activity]
# delete the column that holds the activity code
unified_mean_std$activity_code <- NULL


## Step 4- Appropriately labels the data set with descriptive variable names. 
#-----------------------------------
# it was already done in step 2


## Step 5- creates a second, independent tidy data set with the average of each variable for each activity and each subject
#-----------------------------------
library (dplyr)
by_id_activity <- unified_mean_std %>% group_by(user_id, activity_label)
summarized_tidy_data <- by_id_activity %>% summarise_each(funs(mean))

write.csv(summarized_tidy_data, row.names = FALSE,  file = "summ_tidy_data.txt")

bb <- read.table("summ_tidy_data.txt", col.names = TRUE)
  
