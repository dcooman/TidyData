#TidyData CodeBook

##This CodeBook explains the files, variables and transformations for the run_analysis 

###The Data Files:

The raw data consists of eight text files with data from the Human Activity Recognition 
Smartphones Dataset.  These are:

1.  x_test.txt - The data from the test study group
2.  y_test.txt - The activity codes for each row of the x_test.txt file
3.  x_train.txt - The data from the training study group
4.  y_train.txt - The activity codes for each row of the x_train.txt file
5.  activity_labels.txt - The decoded activity values for the activity codes in the 
y_test.txt and y_train.txt tables.
6.  subject_test.txt - The subject numbers for each row of the x_test.txt file
7.  subject_train.txt - The subject numbers for each row of the x_train.txt file 
8.  features.txt - the column labels for the x_test.txt and x_train.txt data files

###Assumptions about the Data Files:

1.  The x_test (main file), the y_test (activity codes) and the subject_test (subject IDs) 
are all parallel tables where the first record in each go together and so on until the end of the file.
2.  The x_train (main file), the y_train (activity codes) and the subject_train (subject IDs) 
are all parallel tables where the first record in each go together and so on until the end of the file.
3.  The activity code file contans the code (1-6) and the matching activity description.  These are the
same codes for both the test and trainig datasets.

###Details on Specific Files

*  activity_labels.txt - Contains the six activity codes and their descriptions.  These are:
..*  1 - Walking
..*  2 - Walking Upstairs
..*  3 - Walking Downstairs
..*  4 - Sitting
..*  5 - Standing
..*  6 - Laying

###Data Transformations

###Citation

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

