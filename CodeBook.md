This file describes the variables, the data, and any transformations or work that I have performed to clean up the data

1. Source of the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. The run_analysis.R performed following analysis to clean the dataset.

    1. Read X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt and subject_test.txt and store them in X_train, y_train, subject_train, X_test, y_test, y_test and subject_test variables respectively.
    2. Combine X_train, X_test into combineTrainTest data frame, y_train, y_test into combineLabel data frame and subject_train, subject_test into combineSub data frame respectively.
    3. Read features.txt into feature data frame and get list of features which contains “mean” and “std” index numbers, then create combineData data frame by specifying certain column indices in meanStdIndices then we got a data frame with 10299 rows and 66 columns.
    4. Read activity_labels.txt and store it into data frame “activity”. Then attach all labels in combineLabel data frame with corresponding activity names.
    5. Combine combineData, combineLabel,combineSub data frames into labeleData, this data frame has 10299 rows and 68 columns.
    6. Appropriately rename labeleData column names.
    7. Calculate average of each variable for each activity and each subject with aggregate function and store the result in data frame aggregateByActivitySub, then we got a table with 180 rows and 68 columns.
    8. Output the aggregateByActivitySub table as aggregateByActivitySub.txt in the working directory.