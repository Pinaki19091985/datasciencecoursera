### Checking filepath and source file existence

filesPath <- "C:/UCI_HAR_Dataset_Assignment"
setwd(filesPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

###Unzip DataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


###Load required packages
library(dplyr)
if (!require("data.table")) {
  install.packages("data.table")
}

library(tidyr)



### Load: activity labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]

### Load: data column names
features <- read.table("./data/UCI HAR Dataset/features.txt")[,2]

### Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

### Load and process X_test & y_test data.
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

### Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extract_features]

### Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

### Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)



### Load and process X_train & y_train data.
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

### Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

### Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)




# Merge test and train data
data = rbind(test_data, train_data)


### Appropriately labels the data set with descriptive variable names.

names(data)<-gsub("std()", "SD", names(data))
names(data)<-gsub("mean()", "MEAN", names(data))
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(. ~subject + Activity_Label, data, mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$Activity_Label),]
write.table(tidyData, file = "Tidy.txt", row.name = FALSE)