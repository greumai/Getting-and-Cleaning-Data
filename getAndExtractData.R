getAndExtractData<-function() {
        
        ## AUTOMATIC STEP 0
        
        ## The original file is downloaded in the working directory from the provided address
        ## "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
        
        ## The original file is also dezipped, so that the data are stored in the directory 
        ## "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset".
        
        ## The script uses the package `downloader`.
        
        library(downloader)

        if (file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
                unlink("getdata_projectfiles_UCI HAR Dataset.zip")
        }
        
        if (file.exists("getdata_projectfiles_UCI HAR Dataset")) {
                unlink("getdata_projectfiles_UCI HAR Dataset", recursive=TRUE)
        }
        
        download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                dest="getdata_projectfiles_UCI HAR Dataset.zip", mode="wb")
        
        unzip ("getdata_projectfiles_UCI HAR Dataset.zip", exdir="./getdata_projectfiles_UCI HAR Dataset")
        
}
