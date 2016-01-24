# Getting and Cleaning Data Course Project 

## Introduction
Script based solution for the assignment of the "Getting and Cleaning Data Course" Project.
You should create one R script called "run_analysis.R" that does the following:
	
  (1) Merges the training and the test sets to create one data set.
  (2) Extracts only the measurements on the mean and standard deviation for each measurement.
  (3) Uses descriptive activity names to name the activities in the data set
  (4) Appropriately labels the data set with descriptive variable names.
  (5) From the data set in step 4, creates a second, independent tidy data set with 
      the average of each variable for each #activity and each subject.

## System requirements
The R script is tested on a x64 bit Linux Ubuntu 14 LTS distribution using 4 x Intel I7 cores and 8 GB of memory.

## Installation and execution procedure
1. Download the project data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the contents of the ZIP archive into a directory named "dataset"

3. Download the run_analysis.R script from https://github.com/joffefasser/gettingandcleaningdata.git and save it in the parrent directory of the "dataset" directory

4. Make sure the content of directory setup required by 1-3) is structured as follows:
       ./run_analysis.R
       ./dataset
       ./dataset/test
       ./dataset/train
       ./dataset/activity_labels.txt
       ...

5. Start the "R" programming environment change current direcotry and execute the R run_analysis.R script, i.e. 
	> setwd("~/Projects/UCI-HAR")
	> source("run_analysis.R")

6. The "dataset" directory now contanins the tidy data set files tidyDataSet.csv and tidyDataSet.txt as required by the assignment

