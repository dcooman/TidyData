##TidyData CodeBook

###This CodeBook explains the files, variables and transformations for the run_analysis 

###The Data Files:

The raw data consists of eight text files with data from the Human Activity Recognition 
Smartphones Dataset [1].  These are:

1.  x_test.txt - The data from the test study group (2947 rows x 561 cols)
2.  y_test.txt - The activity codes for each row of the x_test.txt file (2947 rows x 1 col)
3.  x_train.txt - The data from the training study group (7352 rows x 561 cols)
4.  y_train.txt - The activity codes for each row of the x_train.txt file (7352 rows x 1 col)
5.  activity_labels.txt - The decoded activity values for the activity codes in the 
y_test.txt and y_train.txt tables. (6 rows x 2 cols)
6.  subject_test.txt - The subject numbers for each row of the x_test.txt file (2947 rows x 1 col)
7.  subject_train.txt - The subject numbers for each row of the x_train.txt file (7352 rows x 1 col)
8.  features.txt - the column labels for the x_test.txt and x_train.txt data files (561 rows x 2 cols)

###Assumptions about the Data Files:

1.  The x_test (main file), the y_test (activity codes) and the subject_test (subject IDs) 
are all parallel tables where the first record in each go together and so on until the end of the file.
2.  The x_train (main file), the y_train (activity codes) and the subject_train (subject IDs) 
are all parallel tables where the first record in each go together and so on until the end of the file.
3.  The activity code file contans the code (1-6) and the matching activity description.  These are the
same codes for both the test and trainig datasets.

###Details on Specific Files

*  activity_labels.txt - Contains the six activity codes and their descriptions.  These are:

	*  1 - Walking
	*  2 - Walking Upstairs
	*  3 - Walking Downstairs
	*  4 - Sitting
	*  5 - Standing
	*  6 - Laying

*  subject_test.txt - Contains subject iD references for the nine subjects in the test group; 2, 4, 9, 10, 12, 13, 18, 20, 24

*  subject_train.txt - Contains subject ID references for the twenty-one subjects in the training group;1, 3, 5, 6, 7, 8, 11, 14, 
15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30

###Data Transformations Between Raw Files and Final Dataset

1.  Initially, the column names for the x_train and x_test data sets contained mixed case, dashes, and left and right parenthese.  These were modified
in the script to shift to lower case and replace all dashes and parenthese to single undersccroes.

2.  Only those data columns containing the phrase "mean" or "std" were included in the final dataset

3.  The activity code, initially an integer, was replaced by the full name of the activity

4.  A new column, study_group, was added to reference to which study group each subject belonged.

5.  The final dataset includes only the average for each combination of subject_id and activity.

###Citation

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition 
on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

