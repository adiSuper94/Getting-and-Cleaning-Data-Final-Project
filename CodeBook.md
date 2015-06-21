## Code Book for run_analysis 

####x_train
contains the training data set without the labels.
####x_test
contains the test data set without the labels.

####y_train
contains the labels for the training data set.
####y_test
contains the labels for the test data set.

####subject_train
contains the subject id for the training data set.
####subject_test
contains the subject id for the test data set.

####features
contains the names for all the data columns in the dataset.
####activity_lables
contains the activity number and its corresponding activity label.

####data
contains the row bidden values of x_train and x_test.
####feature_vector
contains the activity labels.

####subset1
contains the columns with "mean" in it.
####subset2
contains the columns with "std" in it.
####subset
contains combination of subset1 and subset2 in order.

####req_data
contains the subset of data.The sub-setting is done by the subset vector.
It also has activityName and subjectNo appended to it.
  
####y
contains row binded values of y_train and y_test.
####subject
contains row binded values of subject_train and subject_test.
   
####final
contains the final data.frame wrapped in tbl_df,which has mean
of all the columns.The data ordered by activityName and subjectNo.   
