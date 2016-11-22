## TidyData

###Prerequities to Running the Code:

1.  The data files are already downloaded and unzipped and are available in the working directory
2.  The dplyr library has been installed into R

###The Data Files:

The raw data consists of eight text files with data from the Human Activity Recognition Smartphones Dataset.  These are:

1.  x_test.txt - The data from the test study group
2.  y_test.txt - The activity codes for each row of the x_test.txt file
3.  x_train.txt - The data from the training study group
4.  y_train.txt - The activity codes for each row of the x_train.txt file
5.  activity_labels.txt - The decoded activity values for the activity codes in the y_test.txt and y_train.txt tables.
6.  subject_test.txt - The subject numbers for each row of the x_test.txt file
7.  subject_train.txt - The subject numbers for each row of the x_train.txt file 
8.  features.txt - the column labels for the x_test.txt and x_train.txt data files

###Assumptions about the Data Files:

1.  The x_test (main file), the y_test (activity codes) and the subject_test (subject IDs) are all parallel tables where the first record in each go together and so on until the end of the file.
2.  The x_train (main file), the y_train (activity codes) and the subject_train (subject IDs) are all parallel tables where the first record in each go together and so on until the end of the file.


###The Process

This explains the entire process from raw, downloaded data files to a tidy dataset ready for analysis.  The code is heaviliy commented, this is a synopsis.

1.  Load the dplyr library as we will need some of the subroutines
2.  Read in the features.txt file and create a vector of column labels for the raw data.
3.  Clean up the column names by forcing all to lower case and changing all dashes, parentheses, and commas to single underscores.
4.  Create three additional vectors to provide column names for the remaining data sets
5.  Read in the remaining data sets and apply the constructed column labels to each in the process
6.  Create a new column, rownum, in the x_test, y_test, x_train, y_train, subject_test, subject_train data frames to store the row number. This will be used as a linking key.
6.  Create a new column in the subject_test data frame with the study group set to "Test"
7.  Create a new column in the subject_train data frame with the study group set to "Training"
8.  Merge the x_test and y_test data frames on rownum.  This adds the activity code to the test data.
9.  Merge the x_train and y_train data frames on rownum.  This adds the activity code to the training data.
10.  Merge the x_test and subject_test data frames on rownum.  This adds the subject ID to the test dataset.
11.  Merge the x_train and subject_train data frames on rownum.  This adds the subject ID to the training dataset.
12.  Merge the x_test and activity_labels data frames by act_code.  This adds the full activity name to the test dataset.
13.  Merge the x_train and activity_labels data frames by act_code.  This adds the full activity name to the training dataset.
14.  Append the x_test and x_train data frames using rbind.
15.  Rearrange and eliminate unneeded columns in the combined dataset.  Move the key columns; subject_id, activity, and study_group, to the front; and remove all but the data columns 
that contain the mean or standard deviations.  These columns contains the phrase "mean" r the phrase "std".




