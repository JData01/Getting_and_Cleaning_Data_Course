library(readr)
library(dplyr)

# This script is design to obtain a tidy dataset according to the course project
# Getting and Cleaning Data course on Coursera
# The five steps are identified below:
# 1.Merges the training and the test sets to create one data set.

### TRAIN SET ###
file_X_train <- "./UCI HAR Dataset/train/X_train.txt"
file_subject_train <- "./UCI HAR Dataset/train/subject_train.txt"
file_y_train <- "./UCI HAR Dataset/train/y_train.txt"
df_X_train <- data.frame(read.table(file_X_train))
df_subject_train <- data.frame(read.table(file_subject_train))
df_y_train <- data.frame(read.table(file_y_train))
# RENAME COLUMNS #
names(df_subject_train)[1] <- "SUBJECT"
names(df_y_train)[1] <- "ACTIVITY"
## INFO ON TABLES ##
# df_X_train
# str(df_X_train)
# dim(df_X_train)       #[1] 7352  561
# dim(df_subject_train) #[1] 7352    1
# dim(df_y_train)       #[1] 7352    1
df_train <- cbind(df_subject_train, df_y_train, df_X_train)
# dim(df_train)       #[1] 7352  563

### TEST SET ###
file_X_test <- "./UCI HAR Dataset/test/X_test.txt"
file_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
file_y_test <- "./UCI HAR Dataset/test/y_test.txt"
df_X_test <- data.frame(read.table(file_X_test))
df_subject_test <- data.frame(read.table(file_subject_test))
df_y_test <- data.frame(read.table(file_y_test))
# RENAME COLUMNS #
names(df_subject_test)[1] <- "SUBJECT"
names(df_y_test)[1] <- "ACTIVITY"
## INFO ON TABLES ##
# dim(df_X_test)        #[1] 2947  561
# dim(df_subject_test)  #[1] 2947    1
# dim(df_y_test)        #[1] 2947    1
df_test <- cbind(df_subject_test, df_y_test, df_X_test)
# dim(df_test)       #[1] 2947  563

### MERGE TRAIN and TEST ###
df_total <- rbind(df_train, df_test)
df_total
# dim(df_total)       #[1] 10299   563

### OTHER FILES ###
file_activity_lbl <- "./UCI HAR Dataset/activity_labels.txt"
df_activity_lbl <- data.frame(read.table(file_activity_lbl))
vector_activity_lbl <- as.vector(df_activity_lbl[,2])
file_features <- "./UCI HAR Dataset/features.txt"
df_features <- data.frame(read.table(file_features))
## INFO ON TABLES ##
# df_activity_lbl
# str(df_activity_lbl)
# dim(df_activity_lbl)  #[1] 6 2
# dim(df_features)      #[1] 561   2
# colnames(df_total)
for (i in 1:561) {
  colnames(df_total)[colnames(df_total) == paste("V",i,sep="")] <- df_features[i,2]
}
# colnames(df_total)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
pattern <- "SUBJECT|ACTIVITY|[Mm]ean|[Ss]td"
df_select_total <- df_total[ ,grepl(pattern, colnames(df_total))]
# colnames(df_select_total)


# 3.Uses descriptive activity names to name the activities in the data set
df_select_total["ACTIVITY.NAME"] <- vector_activity_lbl[df_select_total$ACTIVITY]
df_select_total["ACTIVITY.NAME"]
str(df_select_total)

# 4.Appropriately labels the data set with descriptive variable names. 
colnames(df_select_total) <- sub("^t", "time.", colnames(df_select_total))
colnames(df_select_total) <- sub("^f", "frequency.", colnames(df_select_total))
colnames(df_select_total) <- sub("tBody", "time.Body", colnames(df_select_total))
# colnames(df_select_total) <- sub("*[A-Z]", ".[A-Z]", colnames(df_select_total))
colnames(df_select_total) <- sub("Body", "Body.", colnames(df_select_total))
colnames(df_select_total) <- sub("ravity", "ravity.", colnames(df_select_total))
colnames(df_select_total) <- sub("cc", "ccelerometer", colnames(df_select_total))
colnames(df_select_total) <- sub("yro", "yroscope", colnames(df_select_total))
colnames(df_select_total) <- sub("ag", "agnitude", colnames(df_select_total))

str(df_select_total)

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Tidy principles
# Every column is a variable.
# Every row is an observation.
# Every cell is a single value.
new_df <- df_select_total %>%
            select(-ACTIVITY) %>%
            group_by(SUBJECT, ACTIVITY.NAME) %>%
            summarize_each(mean) %>%
            print

write.table(new_df,file="CourseAssignment.txt", row.name=FALSE)

