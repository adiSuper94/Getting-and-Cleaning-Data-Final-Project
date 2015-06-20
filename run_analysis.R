run_analysis <- function()
{
        final <-NULL
        library(dplyr)
        ##Loading all the requires files
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        
        ##Binding training set and test set
        data <- rbind(x_train, x_test)
        
        ##Coercing the features data frame into a vector
        feature_vector <- as.vector(features[, 2])
        names(data) <- feature_vector
        
        
        ##Using grep command to find the seperate out feature with mean or std
        subset1 <- grep("mean",names(data))
        subset2 <- grep("std",names(data))
        subset <- c(subset1, subset2)
        subset <- subset[order(subset)]
        subset <- as.numeric(subset)
        req_data <- data[,subset]
        
        ##binding the activity lable and subject vector to the main dataframe
        y <- rbind(y_train,y_test)
        sub <- rbind(subject_train,subject_test)
        req_data <- cbind(y, sub, req_data)
        names(req_data)[1] <- "activityName"
        names(req_data)[2] <- "subjectNo"
        print(dim(req_data)[1])
        
        for(i in 1:dim(req_data)[1])
        {
               activityNo <- req_data[i, 1]
               activityNo <- as.numeric(activityNo)
               req_data[i, 1] <-  as.character(activity_labels[activityNo, 2])
        }
        
        
        final <- tbl_df(req_data)
        final<- arrange(final, activityName, subjectNo)
        final<- group_by(final, activityName, subjectNo)
        final <- summarise_each(final,funs(mean))
   
        
}