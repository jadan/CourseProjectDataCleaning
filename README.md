README.MD

The script **run_analysis.R** uses the data from the [UCI HAR dataset](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
To run the script in R, download the dataset to your R directory and use the command source("run_analysis.R"). The script will run the appropriate 
commands to end up with the tidy data set. To load the data set use the command tidy<-read.table("tidydata.txt", header = TRUE).
If you are using RStudio you can then call View(tidy) to see the data.
The script follows the instructions in the assigment to achieve the following objectives:
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The output of step 5 is then written as a table to the file tidy.txt.
Please refer to the codebook in this same repository for more details on how the script works and the variables extracted from the original dataset.