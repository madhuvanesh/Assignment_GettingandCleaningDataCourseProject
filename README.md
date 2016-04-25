"# Assignment_GettingandCleaningDataCourseProject" 

This document describes of the week 4 assignment of the Coursera Johns Hopkins course: “Getting and Cleaning Data” background and the code book.
For the assignment description, see:
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
A full description of the data set:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Instructions for running the R script and viewing the tidy data set:
1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract to a folder.
2. From the github repository for this assignment, download all the files into the "UCI HAR Dataset" sub-folder of the folder of step (1)
3. Open the R console and set the current working directory to the "UCI HAR Dataset" sub-folder.
4. Load "run_analysis.R" using the command:source("./run_analysis.R")
5. In the R console run the function to get the two tidy data sets into a list: list_tidydatasets <- mergetraintest("train","test").
The parameters "train" and "test" refer to the sub-folders that have the training and test data.
6. The command in (5) will create files "tidydataset.txt" and "tidydatasetavg.txt" in the current working directory. 
list_tidydatasets$tidydataset_meanstd is the tidy data set with the training and test data set merged.
list_tidydatasets$tidydataset_meanstd_avg is the tidy data set with each row representing the average accross observations for a subject and activity.
7. Review CodeBook.md to understand the algorithm developed for cleaning up the data and generating the tidy data sets. 

