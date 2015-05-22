#Merges the training and the test sets to create one data set.
X_train <- read.table("./UCI_Dataset/train/X_train.txt")
dim(X_train)#7352*561

y_train <- read.table("./UCI_Dataset/train/y_train.txt")
dim(y_train)#7352*1

subject_train <- read.table("./UCI_Dataset/train/subject_train.txt")
dim(subject_train)#7352*1

X_test <- read.table("./UCI_Dataset/test/X_test.txt")
dim(X_test)#2947*561

y_test <- read.table("./UCI_Dataset/test/y_test.txt")
dim(y_test)#2947*1

subject_test <- read.table("./UCI_Dataset/test/subject_test.txt")
dim(subject_test)#2947*1

combineTrainTest <- rbind(X_train, X_test)
dim(combineTrainTest)#10299*561

combineLabel <- rbind(y_train, y_test)
dim(combineLabel)#10299*1

combineSub <- rbind(subject_train, subject_test)
dim(combineSub)#10299*1

#Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
dim(features)#561*2

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

combineData <- combineTrainTest[, meanStdIndices]
dim(combineData)#10299*66

#Uses descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")

activityLabel <- activity[combineLabel[, 1], 2]
length(activityLabel)#10299

combineLabel[, 1] <- as.character(activityLabel)

#Appropriately labels the data set with descriptive activity names. 
labeleData = cbind(combineData, combineLabel,combineSub)
dim(labeleData)#10299*68


names(labeleData) = c(as.character(features[meanStdIndices,2]),"activity", "subject")

#From the data set in step 4, creates a second, 
#independent tidy data set with the average of 
#each variable for each activity and each subject.
aggregateByActivitySub <- aggregate(labeleData[,1:66], by = list(labeleData$activity,labeleData$subject), mean)

#output
write.table(aggregateByActivitySub, "aggregateByActivitySub.txt", row.name=FALSE)
