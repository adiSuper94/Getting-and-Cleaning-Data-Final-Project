# Getting-and-Cleaning-Data-Final-Project

The main part of this project is creating the run_analysis function.
This function does not take any argument, and returns a tidy data set with only mean and sd cols.

The first part of the functions loads the necessary package and loads all the necessary datasets into the memory.
The data sets loaded are
  X_train.txt
  Y_train.txt
  subject_train.txt
  X_test.txt
  Y_test.txt
  subject_test.txt
  features.txt
  activity_labels.txt
  
Then we use rbind row bind the training data set and test data set.
Names to each of the coloumns are assigned using the the names function.

We then use the grep command to seperate out the columns with mean and sd,
and create a vector which we use to subset the original dataset.

We the append the activity lable column and subject coloumn to the original dataset.
We use a for loop to assign descriptive activity names to name the activities in the data set.

The arrange and group_by functions in the dplyr package to group the data set by activity name and subject.
We finally use the summerise_each functions to find the mean of each coloumn grouped by activity name and subject.
