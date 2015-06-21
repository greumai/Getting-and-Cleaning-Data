# Getting-and-Cleaning-Data
This repository stores the files of my Coursera 'Getting and Cleaning Data' project.

It contains:
  - The script `run_analysis.R`, which creates the requested tidy data set from the original data.
  - The file `CodeBook.md`, which describes the variables and transformations performed to clean up the data.
  - The current file `README.md`, which explains how all this works.  
 
###Data files

Before running the script, the original zip file must be downloaded manually in the working directory from the address: `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.

Then, the original zip file must be dezipped in the working directory (probably using the default values), so that the data files are stored in the directory `./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset`.

###Running the script

From this moment, you can source and run the script `run_analysis.R` in your R environment from the working directory.

The script creates in the working directory a file named `tidy_dataset.txt`, which is the file I uploaded on the Coursera website.

The script also returns the tidy data set. So I recommend you to run it in RStudio with a command like this:

`data<-run_analysis()`

That way, you will have the `data` object in your RStudio environment and you will be able to see its structure and content easily by just clicking on it.

