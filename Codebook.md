Getting and Cleaning Data Course	Week 4 Assignment Madhu Lakshmikanthan, 24th April, 2016
				
Study Design:
This document describes of the week 4 assignment of the Coursera Johns Hopkins course: “Getting and Cleaning Data” background and the code book.
For the assignment description, see:
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
A full description of the data set:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Here is the description of the algorithm developed for the project:
1. The two data frames, train and test are merged by reading train/X_train.txt and test/X_test.txt into respective data frames via the read.table() call and 
then merging the two by appending the test data rows to the train data frame.
2. Next, the features data frame is loaded from features.txt file and then filtered via a grep call to only have rows with mean or standard deviation. 
3. From the merged data in step (1), another data frame is extracted with only the mean and standard deviation columns using the features data frame from 
step (2)
4. The columns headers of the data frame in (3) is updated to have the feature labels using the feature data frame derived in step (2)
5. Next, the activity table is loaded from activity_labels.txt
6. The two activity data frames, train and test are merged by reading train/y_train.txt and test/y_test.txt into respective data frames via the read.table()
 call and then merging the two by appending the test data rows to the train data frame.
7. An “Activity” column is added to data frame from step (6) with the same values as the column 1.
8. The data frame from (5) is iterated through a “for” loop while updating the “Activity” column from step (7) with the descriptive activity label.
9. An “Activity” column is added to the data frame from step (4) with values from the “Activity” column from the data frame of step (8)
10. The two subject data frames, train and test are merged by reading train/subject_train.txt and test/subject_test.txt into respective data frames via 
the read.table() call and then merging the two by appending the test data rows to the train data frame.
11. A “Subject” column is added to the data frame of step (9) using the data frame from step (10). This is the first tidy data set and is written into a 
CSV file “./tidydataset.csv”
12. The second tiny data set is created using the aggregate function on the data frame from step (11) using the mean function and then written into a 
CSV file “./tidydatasetavg.csv”

Data Dictionary:
1st Column
This has no column header and represents the serial # for the rows.
Subject
R data type: “integer”
Each subject (the person performing the activity) is represented by a number 1 to 30
Activity
R data type: “character”
The value is one of the activity labels:
“WALKING”
“WALKING_UPSTAIRS”
“WALKING_DOWNSTAIRS”
“SITTING”
“STANDING”
“LAYING”
NOTE:
1. Prefix 't' in the variables below denotes time domain signals.
2. Prefix 'f' in the variables below denotes frequency domain signals.
3. In the output file tidydataset.csv, each row is a single observation for a subject and activity
4. In the output file tidydatasetavg.csv, the values for each of the variables below in any given row is the average of that variable across multiple observations for a subject and activity. For ex: in y_train.txt, the first 27 rows have the value 5  (STANDING); subject_train.txt, the first 27 rows have value 1( denoting subject 1); and in x_train.txt, the first 27 rows (observations) would have values for each of the variables (columns) for subject 1 and activity 5 (STANDING).  

tBodyAcc-mean()-X
R data type: “double”
The average of mean tBodyAcc values in X direction.
tBodyAcc-mean()-Y
The average of mean tBodyAcc values in Y direction.
tBodyAcc-mean()-Z
The average of mean tBodyAcc values in Z direction.
tBodyAcc-std()-X
The average of Standard deviation tBodyAcc values in X direction.
tBodyAcc-std()-Y
The average of Standard deviation tBodyAcc values in Y direction.
tBodyAcc-std()-Z
The average of Standard deviation tBodyAcc values in Z direction.
tGravityAcc-mean()-X
The average of mean tGravityAcc values in X direction.
tGravityAcc-mean()-Y
The average of mean tGravityAcc values in Y direction.
tGravityAcc-mean()-Z
The average of mean tGravityAcc values in Z direction.
tGravityAcc-std()-X
The average of standard deviation tGravityAcc values in X direction.
tGravityAcc-std()-Y
The average of standard deviation tGravityAcc values in Y direction.
tGravityAcc-std()-Z
The average of standard deviation tGravityAcc values in Z direction.
tBodyAccJerk-mean()-X
The average of mean tBodyAccJerk values in X direction.
tBodyAccJerk-mean()-Y
The average of mean tBodyAccJerk values in Y direction.
tBodyAccJerk-mean()-Z
The average of mean tBodyAccJerk values in Z direction.
tBodyAccJerk-std()-X
The average of standard deviation tBodyAccJerk values in X direction.
tBodyAccJerk-std()-Y
The average of standard deviation tBodyAccJerk values in Y direction.
tBodyAccJerk-std()-Z
The average of standard deviation tBodyAccJerk values in Z direction.
tBodyGyro-mean()-X
The average of mean tBodyGyro values in X direction.
tBodyGyro-mean()-Y
The average of mean tBodyGyro values in Y direction.
tBodyGyro-mean()-Z
The average of mean tBodyGyro values in Z direction.
tBodyGyro-std()-X
The average of standard deviation tBodyGyro values in X direction.
tBodyGyro-std()-Y
The average of standard deviation tBodyGyro values in Y direction.
tBodyGyro-std()-Z
The average of standard deviation tBodyGyro values in Z direction.
tBodyGyroJerk-mean()-X
The average of mean tBodyGyroJerk values in X direction.
tBodyGyroJerk-mean()-Y
The average of mean tBodyGyroJerk values in Y direction.
tBodyGyroJerk-mean()-Z
The average of mean tBodyGyroJerk values in Z direction.
tBodyGyroJerk-std()-X
The average of standard deviation tBodyGyroJerk values in X direction.
tBodyGyroJerk-std()-Y
The average of standard deviation tBodyGyroJerk values in Y direction.
tBodyGyroJerk-std()-Z
The average of standard deviation tBodyGyroJerk values in Z direction.
tBodyAccMag-mean()
The average of mean tBodyAccMag values.
tBodyAccMag-std()
The average of standard deviation tBodyAccMag values.
tGravityAccMag-mean()
The average of mean tGravityAccMag values.
tGravityAccMag-std()
The average of standard deviation tGravityAccMag values.
tBodyAccJerkMag-mean()
The average of mean tBodyAccJerkMag values.
tBodyAccJerkMag-std()
The average of standard deviation tBodyAccJerkMag values.
tBodyGyroMag-mean()
The average of mean tBodyGyroMag values.
tBodyGyroMag-std()
The average of standard deviation tBodyGyroMag values.
tBodyGyroJerkMag-mean()
The average of mean tBodyGyroJerkMag values.
tBodyGyroJerkMag-std()
The average of standard deviation tBodyGyroJerkMag values.
fBodyAcc-mean()-X
The average of mean fBodyAcc values in the X direction.
fBodyAcc-mean()-Y
The average of mean fBodyAcc values in the Y direction.
fBodyAcc-mean()-Z
The average of mean fBodyAcc values in the Z direction.
fBodyAcc-std()-X
The average of standard deviation fBodyAcc values in the X direction.
fBodyAcc-std()-Y
The average of standard deviation fBodyAcc values in the Y direction.
fBodyAcc-std()-Z
The average of standard deviation fBodyAcc values in the Z direction.
fBodyAcc-meanFreq()-X
The average of mean fBodyAcc frequency values in the X direction.
fBodyAcc-meanFreq()-Y
The average of mean fBodyAcc frequency values in the Y direction.
fBodyAcc-meanFreq()-Z
The average of mean fBodyAcc frequency values in the Z direction.
fBodyAccJerk-mean()-X
The average of mean fBodyAccJerk values in the X direction.
fBodyAccJerk-mean()-Y
The average of mean fBodyAccJerk values in the Y direction.
fBodyAccJerk-mean()-Z
The average of mean fBodyAccJerk values in the Z direction.
fBodyAccJerk-std()-X
The average of standard deviation fBodyAccJerk values in the X direction.
fBodyAccJerk-std()-Y
The average of standard deviation fBodyAccJerk values in the Y direction.

fBodyAccJerk-std()-Z
The average of standard deviation fBodyAccJerk values in the Z direction.
fBodyAccJerk-meanFreq()-X
The average of mean fBodyAccJerk frequency values in the X direction.
fBodyAccJerk-meanFreq()-Y
The average of mean fBodyAccJerk frequency values in the Y direction.
fBodyAccJerk-meanFreq()-Z
The average of mean fBodyAccJerk frequency values in the Z direction.
fBodyGyro-mean()-X
The average of mean fBodyGyro values in the X direction.
fBodyGyro-mean()-Y
The average of mean fBodyGyro values in the Y direction.
fBodyGyro-mean()-Z
The average of mean fBodyGyro values in the Z direction.
fBodyGyro-std()-X
The average of standard deviation fBodyGyro values in the X direction.
fBodyGyro-std()-Y
The average of standard deviation fBodyGyro values in the Y direction.
fBodyGyro-std()-Z
The average of standard deviation fBodyGyro values in the Z direction.
fBodyGyro-meanFreq()-X
The average of mean fBodyGyro frequency values in the X direction.
fBodyGyro-meanFreq()-Y
The average of mean fBodyGyro frequency values in the Y direction.
fBodyGyro-meanFreq()-Z
The average of mean fBodyGyro frequency values in the Z direction.
fBodyAccMag-mean()
The average of mean fBodyAccMag values.
fBodyAccMag-std()
The average of standard deviation fBodyAccMag values.
fBodyAccMag-meanFreq()
The average of mean fBodyAccMag frequency values.
fBodyBodyAccJerkMag-mean()
The average of mean fBodyBodyAccJerkMag values.

fBodyBodyAccJerkMag-std()
The average of standard deviation fBodyBodyAccJerkMag values.
fBodyBodyAccJerkMag-meanFreq()
The average of mean fBodyBodyAccJerkMag frequency values.
fBodyBodyGyroMag-mean()
The average of mean fBodyBodyGyroMag values.
fBodyBodyGyroMag-std()
The average of standard deviation fBodyBodyGyroMag values.
fBodyBodyGyroMag-meanFreq()
The average of mean fBodyBodyGyroMag frequency values.
fBodyBodyGyroJerkMag-mean()
The average of mean fBodyBodyGyroJerkMag values.
fBodyBodyGyroJerkMag-std()
The average of standard deviation fBodyBodyGyroJerkMag values.
fBodyBodyGyroJerkMag-meanFreq()
The average of mean fBodyBodyGyroJerkMag frequency values.
angle(tBodyAccMean,gravity)
The average of angle(tBodyAccMean,gravity) values.
angle(tBodyAccJerkMean),gravityMean)
The average of angle(tBodyAccJerkMean),gravityMean) values.
angle(tBodyGyroMean,gravityMean)
The average of angle(tBodyGyroMean,gravityMean)values.
angle(tBodyGyroJerkMean,gravityMean)
The average of angle(tBodyGyroJerkMean,gravityMean) values.
angle(X,gravityMean)
The average of angle(X,gravityMean) values.
angle(Y,gravityMean)
The average of angle(Y,gravityMean) values.
angle(Z,gravityMean)
The average of angle(Z,gravityMean) values.


