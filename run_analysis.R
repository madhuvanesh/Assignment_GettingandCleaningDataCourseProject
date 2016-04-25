## This function merges the training and the test sets to create one tidy data set and then writes that data set to tidydatasetavg.csv.
## train: The relative path to the training folder
## test: The relative path to the test folder
##NOTE: The numbered comments in the function below are from the assignment page on Coursera
mergetraintest <- function (train, test){
	## read x_train.txt
	x_train <- read.table(paste0(train,"//X_train.txt"))
	## read x_test.txt
	x_test <- read.table(paste0(test,"//X_test.txt"))

## 1. Merges the training and the test sets to create one data set.
	## assign x_train to x_traintest that will have the merged set
	x_traintest <- x_train
	## append x_test rows at end of x_traintest
	x_traintest[seq(nrow(x_traintest)+1,nrow(x_traintest)+nrow(x_test)),] <- x_test[seq(1,nrow(x_test)),]
	
	## load features table
	features <- read.table("./features.txt")
	
	## from features table extract a table with only mean and std features
	## using grep
	features_meanstd <- features[grep("[Mm]ean|std",features$V2),]

## 2. Extracts only the measurements on the mean and standard deviation for each measurement		
	## now extract from x_traintest only the mean and std columns
	## using featuresmeanstd vector
	x_traintestmeanstd <- x_traintest[,features_meanstd$V1]

## 4. Appropriately labels the data set with descriptive variable names.	
	## set the column headers name using features$V2
	names(x_traintestmeanstd) <- features_meanstd$V2
	
	## load activity_labels table
	activity_labels <- read.table("./activity_labels.txt")
	
	## load y_train with the activities performed
	y_train <- read.table(paste0(train,"//y_train.txt"))
	## load y_test with the activities performed
	y_test <- read.table(paste0(test,"//y_test.txt"))

	## assign y_train to y_traintest that will have the merged set
	y_traintest <- y_train
	## append y_test rows at end of y_traintest
	y_traintest[seq(nrow(y_traintest)+1,nrow(y_traintest)+nrow(y_test)),] <- y_test[seq(1,nrow(y_test)),]
	## Add a column:"Activity" to y_traintest
	y_traintest$Activity <- y_traintest$V1
	## output the y_traintest data frame
	head(y_traintest)


## 3. Uses descriptive activity names to name the activities in the data set
	## Now replace the "Activity" column values with the Activity labels
	for (activity in activity_labels$V1)
	{
		## set the activity name
		activity_name <- as.character(activity_labels[activity_labels$V1 == activity,2])		
		## now assign the activity name
		y_traintest$Activity[y_traintest$Activity == activity] <- activity_name
	}
	## Add Activity column to x_traintestmeanstd
	x_traintestmeanstd$Activity <- y_traintest$Activity
	
	## load subject_train 
	subject_train <- read.table(paste0(train,"//subject_train.txt"))
	## load y_test with the activities performed
	subject_test <- read.table(paste0(test,"//subject_test.txt"))

	## assign subject_train to subject_traintest that will have the merged set
	subject_traintest <- subject_train
	## append subject_test rows at end of subject_traintest
	subject_traintest[seq(nrow(subject_traintest)+1,nrow(subject_traintest)+nrow(subject_test)),] <- subject_test[seq(1,nrow(subject_test)),]
	## Add a subject column to x_traintestmeanstd
	x_traintestmeanstd$Subject <- subject_traintest$V1

	## save the first tidy data frame into tidydataset.csv
	write.table(x_traintestmeanstd,"./tidydataset.txt",row.names=FALSE)

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
	# The aggregate function does the mean on the groupby of Subject,Activity(as represented by the list parameter below)
	tidy_ds <- aggregate(x_traintestmeanstd[,1:86],list(x_traintestmeanstd$Subject,x_traintestmeanstd$Activity),mean)
	# Change the column name from Group.1 to Subject
	names(tidy_ds)[1] = "Subject"
	# Change the column name from Group.2 to Activity
	names(tidy_ds)[2] = "Activity"
	# row.names == false as requested in the assignment submission page
	write.table(tidy_ds,"./tidydatasetavg.txt",row.names=FALSE)
	
	# save the first and second data set into a list 
	list("tidydataset_meanstd" = x_traintestmeanstd, "tidydataset_meanstd_avg" = tidy_ds)
}
