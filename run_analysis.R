run_analysis <- function() {
    
    #==========================================================================================
    #  This is function reads, does the tidying, and produces the required dataset for the
    #  final project of the "Getting and Cleaning Data" Class.  For this function to work
    #  correctly, the data files read in must be in the working directory, as stated in the
    #  project requirements.  It requires the dplyr library.
    #==========================================================================================
   
    #--------------------------
    #  Load required librarys
    #--------------------------
    
    library(dplyr)
    
    #-----------------------------------------------------------------------
    #  Read in the features dataset which stores the column labels for the 
    #  x_test and x_train data files.  Create a vector of just the 
    #  column names stored in column 2
    #-----------------------------------------------------------------------
    
    features <- read.table("features.txt",stringsAsFactors=FALSE)
    labels1 <- features[,2]
    
    #----------------------------------------------------------------------
    #  Tidy up these column labels by forcing to lower case and changing
    #  all dashes, parenthese, and commas to single underscores.  Then 
    #  cleanup any double underscores or trailing underscores
    #----------------------------------------------------------------------
    
    labels1 <- tolower(labels1)
    labels1 <- gsub("-","_",labels1,fixed=TRUE)
    labels1 <- gsub("(","_",labels1,fixed=TRUE)
    labels1 <- gsub(")","_",labels1,fixed=TRUE)
    labels1 <- gsub(",","_",labels1,fixed=TRUE)
    labels1 <- gsub("__","_",labels1,fixed=TRUE)
    labels1 <- gsub("_$","",labels1)
    labels1 <- gsub("__","_",labels1,fixed=TRUE)
    
    #-------------------------------------------------------------------------
    #  Create three more vectors to use for the y_test, y_train, subject_test,
    #  subject_train, and activity_labels datasets.  These contain just the 
    #  column names for each set
    #-------------------------------------------------------------------------
    
    labels2 <- c("act_code")
    labels3 <- c("subject_id")
    labels4 <- c("act_code","activity")
    
    #----------------------------------------------------------------------
    #  Read in all required data sets using read.table.  Use the correct
    #  label vector to name the columns for each dataset.  
    #----------------------------------------------------------------------
    
    x_test <- read.table("X_test.txt",col.names=labels1)
    y_test <- read.table("y_test.txt",col.names=labels2)
    x_train <- read.table("X_train.txt",col.names = labels1)
    y_train <- read.table("y_train.txt",col.names = labels2)
    activity_labels <- read.table("activity_labels.txt",col.names = labels4)
    subject_test <- read.table("subject_test.txt",col.names = labels3)
    subject_train <- read.table("subject_train.txt",col.names = labels3)
    
    #------------------------------------------------------------------------------
    #  Add a new column, rownum, as the row number to all BUT the activity_labels
    #  dataset before we do anything else.  This will be used to merge all the
    #  datasets since there is no common key as of yet.
    #------------------------------------------------------------------------------
    
    x_test$rownum <- 1:nrow(x_test)
    y_test$rownum <- 1:nrow(y_test)
    x_train$rownum <- 1:nrow(x_train)
    y_train$rownum <- 1:nrow(y_train)
    subject_test$rownum <- 1:nrow(subject_test)
    subject_train$rownum <- 1:nrow(subject_train)
    
    #------------------------------------------------------------------------------
    #  Add a group descriptor to the two subject data frames to differentiate the 
    #  test group from the training group.  Call the new column "study_group"
    #-----------------------------------------------------------------------------
    
    groups <- c("Test")
    groups <- rep(groups,nrow(subject_test))
    subject_test[,3] <- groups
    subject_test <- rename(subject_test,study_group=V3)
    groups <- c("Training")
    groups <- rep(groups,nrow(subject_train))
    subject_train[,3] <- groups
    subject_train <- rename(subject_train,study_group=V3)
    
    #--------------------------------------------------------------
    #  Merge the x_test and y_test data frames on rownum.  This adds
    #  the activity code to the x_test data frame.  Do the same for
    #  the x_train and y_train data frames.
    #--------------------------------------------------------------
    
    x_test <- merge(x_test, y_test, by="rownum")
    x_train <- merge(x_train, y_train, by="rownum")
    
    #-------------------------------------------------------------------
    #  Merge x_test with subject_test by rownum to add the subject IDs
    #  to the data frame.  Do the same for the x_train and the 
    #  subject_train data frames.
    #-------------------------------------------------------------------
    
    x_test <- merge(x_test,subject_test, by="rownum")
    x_train <- merge(x_train,subject_train, by="rownum")
     
    #----------------------------------------------------------------
    #  Merge x_test and the activity_labels data frame by Act_Code.   
    #  This adds the Activity column to the x_test data frame.  Do 
    #  the same for the x_train data frame
    #----------------------------------------------------------------
    
    x_test <- merge(x_test, activity_labels, by="act_code")
    x_train <- merge(x_train, activity_labels, by="act_code")
   
    #--------------------------------------------------------------------------
    #  Append the x_test and x_train data frames together into one data frame
    #  called 'final' 
    #--------------------------------------------------------------------------
    
    final <- rbind(x_test,x_train)

    #---------------------------------------------------------------------------
    #  Create a vector with the names of all the key columns at the front and
    #  the mean and std dev data columns after.  Recreate the final data frame  
    #  using the columns in this specific order.  The temporary columns act_code 
    #  and rownum will be dropped during this phase as well an any original
    #  colunmns that are NOT mean or standard deviation columns.
    #---------------------------------------------------------------------------
    
    ColList <- names(final)
    KeyCols <- grep("subject_id|study_group|activity",ColList)
    DataCols <- grep("mean|std",ColList)
    ColNumbers <- c(KeyCols,DataCols)
    final <- select(final,ColNumbers)
    
    #------------------------------------------------------------------
    #  Now summarize the data in the final data set to consist of the
    #  average of each variable for each subject and activity.  The
    #  group_by and summarise_all functions will be used to do this
    #------------------------------------------------------------------
    
    final <- group_by(final, subject_id, activity, study_group)
    final <- summarise_all(final, .funs=(mean))
    
    #----------------------------------------------------
    #  Write the final data frame out using write.table
    #----------------------------------------------------
    
    write.table(final, "final.txt", row.names = FALSE)
    
}