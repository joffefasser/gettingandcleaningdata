# Code book

## Data sources
Original data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data source description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data process documentation
Step A) The Subject, Mesaurement and Activity training and test data sets are loaded from the files:
	X_train.txt, subject_train.txt, y_train.txt, X_test.txt, subject_test.txt, y_test.txt
	respectivly. Next the training and test data sets are merged together into 3 distinct datasets 
	(mergedSubjects, mergedData, mergedActivities) according to the Subject, Mesaurement and Activity categories.

Step B)	A subset (a.k.a. feature set) of the variables include in the Measurement data category are then extracted. 
	The subset contains all variables responsible for measuring mean and standard deviation observations.
	The extracted Measurement data are then jobined with the Activity and Subject categories there by 
	creating a target data frame with 10299 observations and 88 variables. 
	The first 86 of the 88 variables included in the target data frame are the Mesaurement subset 
	variables the last 2 variables are the  Activity and Subject variables.

Step C)	Assigns and Beautifies variable names used by the target data frame

Step D) Transform number encodings used by the Activity variable into human readable activity labels

Step E) Build the tidy data set frame by calculating a number of mean values for each Mesaurement variable. 
	A mean value is calculated for each pair of unique Activity and Subject observations related to 
	given Mesaurement variable.
	The tidy data set hence contanins 188 observations (i.e. mean calculations) and 
	88 variables (86 mean variables and 2 grouping variables). 

 
## Data dictionary
Variable name		Description and Units of measure 
--------------------------------------------------------------------------------------------------------
activity		enumeration: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", LAYING"
subject			person id observed: 1-30
tBodyAccMeanXAvg	The average value of the tBodyAccMeanX Measurement variable calculated on a set of observations identified by unique pair of activity and subject values. No unit of measures is reported as all features are normalized and bounded within [-1,1]
tBodyAccMeanYAvg	Same description as tBodyAccMeanXAvg
tBodyAccMeanZAvg	Same description as tBodyAccMeanXAvg
tBodyAccStdXAvg		Same description as tBodyAccMeanXAvg
tBodyAccStdYAvg		Same description as tBodyAccMeanXAvg
tBodyAccStdZAvg		...
tGravityAccMeanXAvg	...
tGravityAccMeanYAvg	...
tGravityAccMeanZAvg
tGravityAccStdXAvg
tGravityAccStdYAvg
tGravityAccStdZAvg
tBodyAccJerkMeanXAvg
tBodyAccJerkMeanYAvg
tBodyAccJerkMeanZAvg
tBodyAccJerkStdXAvg
tBodyAccJerkStdYAvg
tBodyAccJerkStdZAvg
tBodyGyroMeanXAvg
tBodyGyroMeanYAvg
tBodyGyroMeanZAvg
tBodyGyroStdXAvg
tBodyGyroStdYAvg
tBodyGyroStdZAvg
tBodyGyroJerkMeanXAvg
tBodyGyroJerkMeanYAvg
tBodyGyroJerkMeanZAvg
tBodyGyroJerkStdXAvg
tBodyGyroJerkStdYAvg
tBodyGyroJerkStdZAvg
tBodyAccMagMeanAvg
tBodyAccMagStdAvg
tGravityAccMagMeanAvg
tGravityAccMagStdAvg
tBodyAccJerkMagMeanAvg
tBodyAccJerkMagStdAvg
tBodyGyroMagMeanAvg
tBodyGyroMagStdAvg
tBodyGyroJerkMagMeanAvg
tBodyGyroJerkMagStdAvg
fBodyAccMeanXAvg
fBodyAccMeanYAvg
fBodyAccMeanZAvg
fBodyAccStdXAvg
fBodyAccStdYAvg
fBodyAccStdZAvg
fBodyAccMeanFreqXAvg
fBodyAccMeanFreqYAvg
fBodyAccMeanFreqZAvg
fBodyAccJerkMeanXAvg
fBodyAccJerkMeanYAvg
fBodyAccJerkMeanZAvg
fBodyAccJerkStdXAvg
fBodyAccJerkStdYAvg
fBodyAccJerkStdZAvg
fBodyAccJerkMeanFreqXAvg
fBodyAccJerkMeanFreqYAvg
fBodyAccJerkMeanFreqZAvg
fBodyGyroMeanXAvg
fBodyGyroMeanYAvg
fBodyGyroMeanZAvg
fBodyGyroStdXAvg
fbodyGyroStdYAvg
fBodyGyroStdZAvg
fBodyGyroMeanFreqXAvg
fBodyGyroMeanFreqYAvg
fBodyGyroMeanFreqZAvg
fBodyAccMagMeanAvg
fBodyAccMagStdAvg
fBodyAccMagMeanFreqAvg
fBodyBodyAccJerkMagMeanAvg
fBodyBodyAccJerkMagStdAvg
fBodyBodyAccJerkMagMeanFreqAvg
fBodyBodyGyroMagMeanAvg
fBodyBodyGyroMagStdAvg
fBodyBodyGyroMagMeanFreqAvg
fBodyBodyGyroJerkMagMeanAvg
fBodyBodyGyroJerkMagStdAvg
fBodyBodyGyroJerkMagMeanFreqAvg
angletBodyAccMean,gravityAvg
angletBodyAccJerkMean,gravityMeanAvg
angletBodyGyroMean,gravityMeanAvg
angletBodyGyroJerkMean,gravityMeanAvg	
angleX,gravityMeanAvg
angleY,gravityMeanAvg
angleZ,gravityMeanAvg

