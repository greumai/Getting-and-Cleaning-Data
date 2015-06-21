#Code book

##1 - The variables of the tidy data set

The structure and content of the original data set are exlained in the files `features_info.txt` and `README.txt`.
The tidy data set built through the `run_analysis.R` has the following structure.

###1-1 The 68 columns of the tidy data set

          subject
          tBodyAcc-mean-X
          tBodyAcc-mean-Y
          tBodyAcc-mean-Z
          tBodyAcc-dev-X
          tBodyAcc-dev-Y
          tBodyAcc-dev-Z
          tGravityAcc-mean-X
          tGravityAcc-mean-Y
          tGravityAcc-mean-Z
          tGravityAcc-dev-X
          tGravityAcc-dev-Y
          tGravityAcc-dev-Z
          tBodyAccJerk-mean-X
          tBodyAccJerk-mean-Y
          tBodyAccJerk-mean-Z
          tBodyAccJerk-dev-X
          tBodyAccJerk-dev-Y
          tBodyAccJerk-dev-Z
          tBodyGyro-mean-X
          tBodyGyro-mean-Y
          tBodyGyro-mean-Z
          tBodyGyro-dev-X
          tBodyGyro-dev-Y
          tBodyGyro-dev-Z
          tBodyGyroJerk-mean-X
          tBodyGyroJerk-mean-Y
          tBodyGyroJerk-mean-Z
          tBodyGyroJerk-dev-X
          tBodyGyroJerk-dev-Y
          tBodyGyroJerk-dev-Z
          tBodyAccMag-mean
          tBodyAccMag-dev
          tGravityAccMag-mean
          tGravityAccMag-dev
          tBodyAccJerkMag-mean
          tBodyAccJerkMag-dev
          tBodyGyroMag-mean
          tBodyGyroMag-dev
          tBodyGyroJerkMag-mean
          tBodyGyroJerkMag-dev
          fBodyAcc-mean-X
          fBodyAcc-mean-Y
          fBodyAcc-mean-Z
          fBodyAcc-dev-X
          fBodyAcc-dev-Y
          fBodyAcc-dev-Z
          fBodyAccJerk-mean-X
          fBodyAccJerk-mean-Y
          fBodyAccJerk-mean-Z
          fBodyAccJerk-dev-X
          fBodyAccJerk-dev-Y
          fBodyAccJerk-dev-Z
          fBodyGyro-mean-X
          fBodyGyro-mean-Y
          fBodyGyro-mean-Z
          fBodyGyro-dev-X
          fBodyGyro-dev-Y
          fBodyGyro-dev-Z
          fBodyAccMag-mean
          fBodyAccMag-dev
          fBodyAccJerkMag-mean
          fBodyAccJerkMag-dev
          fBodyGyroMag-mean
          fBodyGyroMag-dev
          fBodyGyroJerkMag-mean
          fBodyGyroJerkMag-dev
          activity

###1-2 The 180 rows of the tidy data set

The 180 rows are the combinations of the 30 subjects (numbered from 1 to 30 in the `subject` column) and the 6 activities (labeled `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, and `WALKING_UPSTAIRS` in the `activity` column).


##The data

1. The `subject` column contains the number of the subject being observed.
1. The `activity` column contains the label of the activity that the subject is doing during the observation.
1. All the other columns are numeric values and contain the average of the equivalent variables (means and standard deviations of each physical measurement) of the original dataset. The averages are computed for each `(subject, activity)` couple.


##The transformations  

####Step 1 

The first step merges the training and the test sets, in order to create one data set.

The script merges the total 10299 observations (2947 in test sets and 7352 in training sets) on 563 variables:
  - `subject_test.txt` and `subject_train.txt` (1 variable, the subjects, column 1)
  - `X_test.txt` and `X_train.txt` (561 variables, the features, columns 2:562)
  - `y_test.txt` and `y_train.txt` (1 variable, the labels, column 563)
  
####Step 2

The second step extracts the measurements of the means and standard deviations.

The ranks of the means and standard deviations of the 17 features are given in the `features.txt` file (see comments in the script file to get the numeric values). In our data set, the features have been concatenated after the subjects, the ranks to extract are 1 greater.

The subjects and the labels have also to be extracted.

####Step 3        

The third step uses descriptive activity names to name the activities in the data set. 

Activities are stored in the 68th column. We change their numeric values (1:6) by their corresponding string values according to the `activity_labels.txt` file.

####Step 4

The fourth step labels the data set with the descriptive variable names that are provided by the `features.txt` file.

####Step 5

The fifth step creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In order to do that, we split the data set for each subject (column 1) and activity (column 68) and compute the averages (i.e. means) of the numeric variables of columns 2:67 for these 180 elements. Each element provides 1 row of the final tidy data set.


