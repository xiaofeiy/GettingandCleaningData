
## data are downloaded to the working directory and unzipped.
## load trianing and testing datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
## combine training and testing datasets
data <- rbind(train, test)
## load feature names
features <- read.table("UCI HAR Dataset/features.txt")
## label the dataset with descriptive variable names
names(data) <- features$V2
## identify the indices of the mean and standard deviation for each measurement 
idx_mean <- grep("mean",names(data))
idx_std <- grep("std",names(data))
## extract only the mean and standard deviations
data_new <- data[sort(c(idx_mean,idx_std))]


## load activity labels
train_label <- read.table("UCI HAR Dataset/train/y_train.txt")
test_label <- read.table("UCI HAR Dataset/test/y_test.txt")
## combine activity labels for training and testing
labels <- rbind(train_label,test_label)
## convert labels to factor and Uses descriptive activity names to name the activities
labels$V1 <- as.factor(labels$V1)
levels(labels$V1)[levels(labels$V1)=="1"] <- "WALKING"
levels(labels$V1)[levels(labels$V1)=="2"] <- "WALKING_UPSTAIRS"
levels(labels$V1)[levels(labels$V1)=="3"] <- "WALKING_DOWNSTAIRS"
levels(labels$V1)[levels(labels$V1)=="4"] <- "SITTING"
levels(labels$V1)[levels(labels$V1)=="5"] <- "STANDING"
levels(labels$V1)[levels(labels$V1)=="6"] <- "LAYING"

## load subject IDs
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(train_subject,test_subject)
subject$Subject <- as.factor(subject$Subject)


## combined subject ID, activity label and measurements of choice into one dataframe
data_new <- cbind(subject,labels,data_new)

library(dplyr)
## calculate the average of each variable for each activity and each subject
output <- data_new %>% group_by(Subject,Activity) %>%  summarise_each(funs(mean))
## write the new tidy dataset to text file tidydata.txt
write.table(output, "tidydata.txt", sep="\t", row.names = FALSE)


