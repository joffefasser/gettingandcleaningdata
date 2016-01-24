#
# Script purpose:
#    Script based solution for the assignment of the "Getting and Cleaning Data Course" Project.
#    You should create one R script called "run_analysis.R" that does the following:
#	
#    (1) Merges the training and the test sets to create one data set.
#    (2) Extracts only the measurements on the mean and standard deviation for each measurement.
#    (3) Uses descriptive activity names to name the activities in the data set
#    (4) Appropriately labels the data set with descriptive variable names.
#    (5) From the data set in step 4, creates a second, independent tidy data set with 
#        the average of each variable for each #activity and each subject.
#
#
#  Script prerequisites:
#    A) The "UCI HAR Dataset" needed by this script is downloaded and located in a directory named "dataset". 
#    B) The "dataset" directory must be located in the same directory as the "run_analysis.R" script:
#       ./run_analysis.R
#       ./dataset
#       ./dataset/test
#       ./dataset/train
#       ./dataset/activity_labels.txt
#       ...
#
#
#  Dataset assumptions, interpretations and scope definitions:
#    A) Requirement (2) "... measurements on the mean and standard deviation ..." is assumed to maen any variable included in the test or training data sets that matches one of the following regular expression
#       1) .*mean.*
#       2) .*std.*

#setwd("~/Projects/UCI-HAR")
#source("run_analysis.R")


# -----------------------------
# (1) + (2) : Merge the training and the test sets to create one data set and extract 
# only the measurements on the mean and standard deviation for each measurement
# -----------------------------
# Step A) Load data from data files
trainingData <- read.table("./dataset/train/X_train.txt", header = FALSE)
trainSubjects <- read.table("./dataset/train/subject_train.txt", header = FALSE)
trainingActivities <- read.table("./dataset/train/y_train.txt", header = FALSE)
testData <- read.table("./dataset/test/X_test.txt", header = FALSE)
testSubjects <- read.table("./dataset/test/subject_test.txt", header = FALSE)
testActivities <- read.table("./dataset/test/y_test.txt", header = FALSE)

# Step A) Build combined training and test data set structures
mergedData <- rbind(trainingData, testData)
mergedSubjects <- rbind(trainSubjects, testSubjects)
mergedActivities <- rbind(trainingActivities, testActivities)

# Step B) Load the feature data set descriptions
completeFeatureList <- read.table("./dataset/features.txt", colClasses=c("character"))

# Step B) Filter and extract required variables from the data frame including all variables and observations
requiredFeatureList <- grep(".*mean.*|.*std.*", completeFeatureList[, 2], ignore.case=TRUE)
filteredDataFrame <- mergedData[,requiredFeatureList]
targetDataFrame <- cbind(filteredDataFrame, mergedActivities, mergedSubjects)


# -----------------------------
# (3) + (4) : Add descriptive activity names to name the activities in the data set and 
# appropriately label the data set with descriptive variable names 
# -----------------------------
# Step C) Make the variable names of the target data frame human readable 
colnames(targetDataFrame) <- c(completeFeatureList[requiredFeatureList, 2], "activity", "subject")
colnames(targetDataFrame)  <- gsub("[-()]", "", colnames(targetDataFrame))
colnames(targetDataFrame) <- gsub("mean", "Mean", colnames(targetDataFrame), ignore.case = TRUE)
colnames(targetDataFrame) <- gsub("std", "Std", colnames(targetDataFrame), ignore.case = TRUE)

# Step D) Transform activity numbers included in the target data frame into activity labels
activityLabels <- read.table("./dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE, col.names=c("value", "code"))
targetDataFrame$activity <- as.factor(targetDataFrame$activity)
targetDataFrame$subject <- as.factor(targetDataFrame$subject)
levels(targetDataFrame$activity) <- activityLabels$code


# -----------------------------
# (5) : From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
# -----------------------------
# Step E) Build the tidy data set frame by calculating the mean values using the aggregate function and grouping by the 
# activity and subject variables. The grouping variables are located in the last 2 columns of the targetDataFrame
# and must be excluded from the mean calculations.
tidyDataSet <- aggregate(targetDataFrame [, 1:(ncol(targetDataFrame)-2)], by = list(targetDataFrame$activity, targetDataFrame$subject),FUN = mean, na.rm=TRUE)

# Beautify column names used by the tidy data set
colnames(tidyDataSet) <- gsub("(.*)", "\\1Avg", colnames(tidyDataSet), ignore.case = TRUE)
colnames(tidyDataSet)[1] <- "activity"
colnames(tidyDataSet)[2] <- "subject"

# Save the tidy data set in general purpose formats
write.table(tidyDataSet, "tidyDataSet.txt", row.names=FALSE, col.names = TRUE)
write.csv(tidyDataSet, "tidyDataSet.csv", row.names=FALSE)

