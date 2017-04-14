This is a code book that describes the variables, the data, and any transformations or work  performed to clean up the data.

The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Transformation details

There are 5 parts:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How run_analysis.R implements the above steps:

1. Check for file existence in the mentioned path.If not available , then download from the respective URL as per problem statement and unzip that.
2. Load both test and train data
3. Load the features and activity labels.
4. Extract the mean and standard deviation column names and data.
5. Process the data. There are two parts processing test and train data respectively. And descriptive activity names used to name the activities in the data set
6. Merge data set.
7. Appropriately labels the data set with descriptive variable names.
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Variables used in script:

filespath - Location where the zip file should exist or needs to be downloaded.
activity_labels - Here activity_labels.txt is loaded.
features - Here features.txt is loaded.
extract_features - Here only the measurements on the mean and standard deviation is loaded.
X_test  - Here X_test.txt is loaded.
y_test  - Here y_test.txt is loaded.
subject_test  - Here subject_test.txt is loaded.
test_data - column binding done where with proper activity labels.
X_train  - Here X_train.txt is loaded.
y_train  - Here y_train.txt is loaded.
subject_train  - Here subject_train.txt is loaded.
test_data - column binding done where with proper activity labels.
tidyData - final dataset with the average of each variable for each activity and each subject.