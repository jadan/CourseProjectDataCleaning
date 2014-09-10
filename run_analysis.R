#Course project: "Getting and Cleaning Data" @ Coursera
#José Mendoza 

#Data source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
#Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly 
#Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
#Vitoria-Gasteiz, Spain. Dec 2012

#Require (and load ) the necessary libraries.
require(plyr)
require(dplyr)

###Read relevant files from the UCI HAR Dataset.

#Read general data descriptors, features and activity labels.
features<-read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE, col.names=c("id", "featureNames"))
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, col.names=c("id", "activity"))

#Read training data.
trainData<-read.table("UCI HAR Dataset//train//X_train.txt")
trainActivities<-read.table("UCI HAR Dataset//train//y_train.txt", col.names=c("activity"))
trainSubjects<-read.table("UCI HAR Dataset//train//subject_train.txt", col.names=c("subject"))

#Read test data.
testData<-read.table("UCI HAR Dataset//test//X_test.txt")
testActivities<-read.table("UCI HAR Dataset//test//y_test.txt", col.names=c("activity"))
testSubjects<-read.table("UCI HAR Dataset//test//subject_test.txt", col.names=c("subject"))


###Add columns before merging.

#Add subject and activity columns to each data set(train and test.)
trainData<-cbind(trainSubjects, trainActivities, trainData)
testData<-cbind(testSubjects, testActivities, testData)

#####ASSIGNMENT STEP 1
###Merge train and test data sets.

#With join(x,y,type="full"), all the rows in y (i.e. testData) will be added at the end of trainData(x).
allData<-join(trainData,testData, type="full")

###Data tidying.

#Assign names to columns.
names(allData)<-c("subject", "activity", features$featureNames)


#####ASSIGNMENT STEP 2
#Obtain relevant columns.
relevantCols<-grep("mean\\(\\)|std\\(\\)", features$featureNames)
#Relevant columns needs to be adjusted because "subject" was added as the first column
#and "activity" as the second column.
relevantCols<-c(1, 2, relevantCols+2)

#Extract relevant columns from data set (train and test are merged now).
allData<-allData[,relevantCols]

#####ASSIGNMENT STEP 3
#Clean activity labels, change to lower case and remove underscores.
activityLabels$activity<-tolower(activityLabels$activity)
activityLabels$activity<-gsub("_"," ",activityLabels$activity)

#Add descriptive activity names to name the activities in the data set.
allData$activity <- factor(allData$activity, labels = activityLabels$activity)

#####ASSIGNMENT STEP 4
cleanNames<-names(allData)
#change all to lower case 
cleanNames<-tolower(cleanNames)
#delete parenthesis
cleanNames<-gsub("\\(\\)","",cleanNames)
#change dashes to spaces
cleanNames<-gsub("-"," ", cleanNames)
#perform series of substitutions that make the column names more appropriate.
cleanNames<-gsub("acc", " acceleration", cleanNames)
cleanNames<-gsub("mag", " magnitude", cleanNames)
cleanNames<-gsub("gyro ", " angular velocity ", cleanNames)
cleanNames<-gsub("gyrojerk", " angular jerk", cleanNames)
cleanNames<-gsub("accelerationjerk", "linear jerk", cleanNames)
cleanNames<-gsub("std", "standard deviation", cleanNames)
cleanNames<-gsub("tgravity", "gravity", cleanNames)
cleanNames<-sub("tbody", "body", cleanNames)
cleanNames<-sub("^f", "f ", cleanNames)
cleanNames<-gsub(" x$", " x-axis", cleanNames)
cleanNames<-gsub(" y$", " y-axis", cleanNames)
cleanNames<-gsub(" z$", " z-axis", cleanNames)

#change the col.names to the tidy names
names(allData)<-cleanNames


#####ASSIGNMENT STEP 5
by_subjectandactivity<-group_by(allData, subject, activity)
averageAll<-summarise_each(by_subjectandactivity, funs(mean))
write.table(averageAll, file="tidydata.txt", row.names=FALSE)