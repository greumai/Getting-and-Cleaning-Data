run_analysis<-function() {
        
        ## STEP 0
        
        ## The original file must have been downloaded manually in the working directory from the address
        ## "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
        
        ## The original file must also have been dezipped (probably using the default values), so that  
        ## the data are stored in the directory "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset".
 
        ## The script uses data tables.
        
        library(data.table)
        
        
        ## STEP 1 
        ## The first step merges the training and the test sets, in order to create one data set.
        
        ## The script merges the total 10299 observations using cbind():
        ##    - "subject_test.txt" and "subject_train.txt" (1 variable, the subjects)
        ##    - "X_test.txt" and "X_train.txt" (561 variables, the features)
        ##    - "y_test.txt" and "y_train.txt" (1 variable, the labels)
                
        ## The subjects (rank 1)
        
        test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
        train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
        data<-rbind(test, train)
        
        ## The features (rank 2:562)
        
        test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
        train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
        data<-cbind(data, rbind(test, train))
        
        ## The labels (rank 563)
        
        test<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
        train<-read.table("getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
        data<-cbind(data, rbind(test, train))
        
        
        ## STEP 2
        ## The second step extracts the measurements on the mean and standard deviation.

        ## We can read in the "features.txt" file the ranks of the means and standard deviations
        ## of the 17 features:
        ## tBodyAcc-XYZ         columns 1:6 
        ## tGravityAcc-XYZ      columns 41:46
        ## tBodyAccJerk-XYZ     columns 81:86
        ## tBodyGyro-XYZ        columns 121:126
        ## tBodyGyroJerk-XYZ    columns 161:166
        ## tBodyAccMag          columns 201:202
        ## tGravityAccMag       columns 214:215
        ## tBodyAccJerkMag      columns 227:228
        ## tBodyGyroMag         columns 240:241
        ## tBodyGyroJerkMag     columns 253:254
        ## fBodyAcc-XYZ         columns 266:271
        ## fBodyAccJerk-XYZ     columns 345:350
        ## fBodyGyro-XYZ        columns 424:429
        ## fBodyAccMag          columns 503:504
        ## fBodyAccJerkMag      columns 516:517
        ## fBodyGyroMag         columns 529:530
        ## fBodyGyroJerkMag     columns 542:543
        
        extract<-c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 
                   227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 
                   503:504, 516:517, 529:530, 542:543)

        ## Insofar as the features have been concatenated after the subjects,
        ## the ranks to extract are 1 greater.

        extract<-1+extract

        ## We have also to extract the subjects and the labels.

        extract<-c(1, extract, 563)

        ## Extraction: we have now 10299 obs. of 68 variables.

        data<-data[,extract]

        
        ## STEP 3        
        ## The third step uses descriptive activity names to name the activities in the data set.

        ## Activities are stored in the 68th column.
        ## We change their numeric values (1:6) by their correspon ding string values 
        ## according to the "activity_labels.txt" file.
        
        data[data$V1.2==1,68]<-"WALKING"
        data[data$V1.2==2,68]<-"WALKING_UPSTAIRS"
        data[data$V1.2==3,68]<-"WALKING_DOWNSTAIRS"
        data[data$V1.2==4,68]<-"SITTING"
        data[data$V1.2==5,68]<-"STANDING"
        data[data$V1.2==6,68]<-"LAYING"


        ## STEP 4
        ## The fourth step appropriately labels the data set with descriptive variable names.

        ## The data set has 68 columns.
        
        colnames(data)<-c("subject",
                          "tBodyAcc-mean-X",
                          "tBodyAcc-mean-Y",
                          "tBodyAcc-mean-Z",
                          "tBodyAcc-dev-X",
                          "tBodyAcc-dev-Y",
                          "tBodyAcc-dev-Z",
                          "tGravityAcc-mean-X",
                          "tGravityAcc-mean-Y",
                          "tGravityAcc-mean-Z",
                          "tGravityAcc-dev-X",
                          "tGravityAcc-dev-Y",
                          "tGravityAcc-dev-Z",
                          "tBodyAccJerk-mean-X",
                          "tBodyAccJerk-mean-Y",
                          "tBodyAccJerk-mean-Z",
                          "tBodyAccJerk-dev-X",
                          "tBodyAccJerk-dev-Y",
                          "tBodyAccJerk-dev-Z",
                          "tBodyGyro-mean-X",
                          "tBodyGyro-mean-Y",
                          "tBodyGyro-mean-Z",
                          "tBodyGyro-dev-X",
                          "tBodyGyro-dev-Y",
                          "tBodyGyro-dev-Z",
                          "tBodyGyroJerk-mean-X",
                          "tBodyGyroJerk-mean-Y",
                          "tBodyGyroJerk-mean-Z",
                          "tBodyGyroJerk-dev-X",
                          "tBodyGyroJerk-dev-Y",
                          "tBodyGyroJerk-dev-Z",
                          "tBodyAccMag-mean",
                          "tBodyAccMag-dev",
                          "tGravityAccMag-mean",
                          "tGravityAccMag-dev",
                          "tBodyAccJerkMag-mean",
                          "tBodyAccJerkMag-dev",
                          "tBodyGyroMag-mean",
                          "tBodyGyroMag-dev",
                          "tBodyGyroJerkMag-mean",
                          "tBodyGyroJerkMag-dev",
                          "fBodyAcc-mean-X",
                          "fBodyAcc-mean-Y",
                          "fBodyAcc-mean-Z",
                          "fBodyAcc-dev-X",
                          "fBodyAcc-dev-Y",
                          "fBodyAcc-dev-Z",
                          "fBodyAccJerk-mean-X",
                          "fBodyAccJerk-mean-Y",
                          "fBodyAccJerk-mean-Z",
                          "fBodyAccJerk-dev-X",
                          "fBodyAccJerk-dev-Y",
                          "fBodyAccJerk-dev-Z",
                          "fBodyGyro-mean-X",
                          "fBodyGyro-mean-Y",
                          "fBodyGyro-mean-Z",
                          "fBodyGyro-dev-X",
                          "fBodyGyro-dev-Y",
                          "fBodyGyro-dev-Z",
                          "fBodyAccMag-mean", 
                          "fBodyAccMag-dev",
                          "fBodyAccJerkMag-mean",
                          "fBodyAccJerkMag-dev",
                          "fBodyGyroMag-mean",
                          "fBodyGyroMag-dev",
                          "fBodyGyroJerkMag-mean",
                          "fBodyGyroJerkMag-dev",
                          "activity")

        
        ## STEP 5
        ## The fifth step creates a second, independent tidy data set with the average 
        ## of each variable for each activity and each subject.

        ## Using the interaction() function, We combine the factors of the activity variable
        ## with the factors of the subject variable.
        
        factors<-interaction(factor(data$activity), factor(data$subject))
 
        ## Then, we split the data set according to these factors.
        ## We obtain a list of 180 elements (6 activities times 30 subjects).
        ## Each element of this list is a data table with the same structure than the "data" table,
        ## i.e. 68 columns.

        splitData<-split(data, factors)

        ## We loop over the splitData list.
        ## At each iteration, we compute the means of the numeric variables (columns 2:67) 
        ## using sapply().
        ## Then, we concatenate the subject, the means, and the activity into a row, which we add
        ## to the "SecondSet" data set using rbind().
        
        secondSet<-NULL
        for (i in 1:length(splitData)) {
                e<-splitData[[i]]   
                means<-sapply(e[,2:67], mean)
                secondSet<-rbind(secondSet, c(subject=e[1,1], means, activity=e[1,68]))
        }
        
        ## Finally, we write the new tidy data set into the "tidy_dataset.txt" file in the working
        ## directory.
        
        if (file.exists("tidy_dataset.txt")) {
                unlink("tidy_dataset.txt")
        }
        
        write.table(secondSet, file="tidy_dataset.txt", quote=FALSE, sep=" ", row.names=FALSE)
        
        ## We return also the secondSet from he function.
        
        secondSet

}
