ReadMe.md file

# This script is design to obtain a tidy dataset according to the course project
# **Getting and Cleaning Data ** course on Coursera
The five steps are identified below:

## 1.Merges the training and the test sets to create one data set.

### TRAIN SET
The following .txt files for the train set are read and converted to dataframes.
X_train.txt with dimensions 7352, 561.
subject_train.txt with dimensions 7352, 1.
y_train.txt with dimensions 7352, 1.
The subject column is renamed "SUBJECT" and the activity column renamed "ACTIVITY".
Using cbind() the 3 dataframes are combined into one having the following dimensions 7352, 563.

### TEST SET
The following .txt files for the test set are read and converted to dataframes.
X_test.txt with dimensions 2947, 561.
subject_test.txt with dimensions 2947, 1.
y_test.txt with dimensions 2947, 1.
The subject column is renamed "SUBJECT" and the activity column renamed "ACTIVITY".
Using cbind() the 3 dataframes are combined into one having the following dimensions 2947, 563.

### MERGE TRAIN and TEST SETS
**Using rbind the train and test sets are combined providing a dataframe with the following dimensions 10299, 563.**



## 2.Extracts only the measurements on the mean and standard deviation for each measurement.

### OTHER FILES
The activity_labels.txt and features.txt files are read and converted to dataframes having the respective dimensions: 6, 2 and 561, 2.

Using colnames() the columns of the merge dataframe are converted from numbers to the corresponding names from the features.txt files.
**With the use of grepl columns containing the only the following patterns: "SUBJECT|ACTIVITY|[Mm]ean|[Ss]td" are kept in the dataframe.**


# 3.Uses descriptive activity names to name the activities in the data set
In order to better describe the activities, the informations coming from the activity_labels.txt are used to replace the activity numbers in the dataframe, and are placed in a new column name "ACTIVITY.NAME". The R function used is this one:
**df["ACTIVITY.NAME"] <- vector_activity_lbl[df$ACTIVITY]**


# 4.Appropriately labels the data set with descriptive variable names. 
In order to convert column names with a more descriptive one, the following replacements were performed using the sub function on column names.
First, we start by replacing: "^t" with "time.", and since there are the presence of "tBody" we replace it with "time.Body", and we substitute "Body" with "Body." to make the names more readable.
We subtituted "^f" with "frequency." for more clarity, and replaced the following abbreviation by the full names:
"ravity" with "ravity."
"cc" with "ccelerometer"
"yro" with "yroscope"
and, "ag" with "agnitude"

We then obtained the following column names:
 $ SUBJECT                                                 
 $ ACTIVITY                                                
 $ time.Body.Accelerometer-mean()-X                        
 $ time.Body.Accelerometer-mean()-Y                        
 $ time.Body.Accelerometer-mean()-Z                        
 $ time.Body.Accelerometer-std()-X                         
 $ time.Body.Accelerometer-std()-Y                         
 $ time.Body.Accelerometer-std()-Z                         
 $ time.Gravity.Accelerometer-mean()-X                     
 $ time.Gravity.Accelerometer-mean()-Y                    
 $ time.Gravity.Accelerometer-mean()-Z                     
 $ time.Gravity.Accelerometer-std()-X                      
 $ time.Gravity.Accelerometer-std()-Y                      
 $ time.Gravity.Accelerometer-std()-Z                      
 $ time.Body.AccelerometerJerk-mean()-X                    
 $ time.Body.AccelerometerJerk-mean()-Y                    
 $ time.Body.AccelerometerJerk-mean()-Z                    
 $ time.Body.AccelerometerJerk-std()-X                     
 $ time.Body.AccelerometerJerk-std()-Y                     
 $ time.Body.AccelerometerJerk-std()-Z                     
 $ time.Body.Gyroscope-mean()-X                            
 $ time.Body.Gyroscope-mean()-Y                            
 $ time.Body.Gyroscope-mean()-Z                            
 $ time.Body.Gyroscope-std()-X                             
 $ time.Body.Gyroscope-std()-Y                             
 $ time.Body.Gyroscope-std()-Z                             
 $ time.Body.GyroscopeJerk-mean()-X                        
 $ time.Body.GyroscopeJerk-mean()-Y                        
 $ time.Body.GyroscopeJerk-mean()-Z                        
 $ time.Body.GyroscopeJerk-std()-X                         
 $ time.Body.GyroscopeJerk-std()-Y                         
 $ time.Body.GyroscopeJerk-std()-Z                         
 $ time.Body.AccelerometerMagnitude-mean()                 
 $ time.Body.AccelerometerMagnitude-std()                  
 $ time.Gravity.AccelerometerMagnitude-mean()              
 $ time.Gravity.AccelerometerMagnitude-std()               
 $ time.Body.AccelerometerJerkMagnitude-mean()             
 $ time.Body.AccelerometerJerkMagnitude-std()              
 $ time.Body.GyroscopeMagnitude-mean()                     
 $ time.Body.GyroscopeMagnitude-std()                      
 $ time.Body.GyroscopeJerkMagnitude-mean()                 
 $ time.Body.GyroscopeJerkMagnitude-std()                  
 $ frequency.Body.Accelerometer-mean()-X                   
 $ frequency.Body.Accelerometer-mean()-Y                   
 $ frequency.Body.Accelerometer-mean()-Z                   
 $ frequency.Body.Accelerometer-std()-X                    
 $ frequency.Body.Accelerometer-std()-Y                    
 $ frequency.Body.Accelerometer-std()-Z                    
 $ frequency.Body.Accelerometer-meanFreq()-X               
 $ frequency.Body.Accelerometer-meanFreq()-Y               
 $ frequency.Body.Accelerometer-meanFreq()-Z               
 $ frequency.Body.AccelerometerJerk-mean()-X               
 $ frequency.Body.AccelerometerJerk-mean()-Y               
 $ frequency.Body.AccelerometerJerk-mean()-Z               
 $ frequency.Body.AccelerometerJerk-std()-X                
 $ frequency.Body.AccelerometerJerk-std()-Y                
 $ frequency.Body.AccelerometerJerk-std()-Z                
 $ frequency.Body.AccelerometerJerk-meanFreq()-X           
 $ frequency.Body.AccelerometerJerk-meanFreq()-Y           
 $ frequency.Body.AccelerometerJerk-meanFreq()-Z           
 $ frequency.Body.Gyroscope-mean()-X                       
 $ frequency.Body.Gyroscope-mean()-Y                       
 $ frequency.Body.Gyroscope-mean()-Z                       
 $ frequency.Body.Gyroscope-std()-X                        
 $ frequency.Body.Gyroscope-std()-Y                        
 $ frequency.Body.Gyroscope-std()-Z                        
 $ frequency.Body.Gyroscope-meanFreq()-X                   
 $ frequency.Body.Gyroscope-meanFreq()-Y                   
 $ frequency.Body.Gyroscope-meanFreq()-Z                   
 $ frequency.Body.AccelerometerMagnitude-mean()            
 $ frequency.Body.AccelerometerMagnitude-std()             
 $ frequency.Body.AccelerometerMagnitude-meanFreq()        
 $ frequency.Body.BodyAccelerometerJerkMagnitude-mean()    
 $ frequency.Body.BodyAccelerometerJerkMagnitude-std()     
 $ frequency.Body.BodyAccelerometerJerkMagnitude-meanFreq()
 $ frequency.Body.BodyGyroscopeMagnitude-mean()            
 $ frequency.Body.BodyGyroscopeMagnitude-std()             
 $ frequency.Body.BodyGyroscopeMagnitude-meanFreq()        
 $ frequency.Body.BodyGyroscopeJerkMagnitude-mean()        
 $ frequency.Body.BodyGyroscopeJerkMagnitude-std()         
 $ frequency.Body.BodyGyroscopeJerkMagnitude-meanFreq()    
 $ angle(time.Body.AccelerometerMean,gravity.)             
 $ angle(time.Body.AccelerometerJerkMean),gravity.Mean)    
 $ angle(time.Body.GyroscopeMean,gravity.Mean)             
 $ angle(time.Body.GyroscopeJerkMean,gravity.Mean)         
 $ angle(X,gravity.Mean)                                   
 $ angle(Y,gravity.Mean)                                   
 $ angle(Z,gravity.Mean)                                   
 $ ACTIVITY.NAME               


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Based on the following reference: *Wickham, H. . (2014). Tidy Data. Journal of Statistical Software, 59(10), 1–23. https://doi.org/10.18637/jss.v059.i10*
the Tidy principles are the following:
1. Every column is a variable.
2. Every row is an observation.
3. Every cell is a single value.

With the use of the pipe function %>% a new tidy dataframe is obtained.
First, all the columns (except "ACTIVITY") were transferred to the new dataframe with 'select', and every column is a variable.
The rows are combined by 'SUBJECT' and 'ACTIVITY.NAME' with the use of the group_by function.
Every row becomes one observation, and the results of the group_by function are averaged with the used of summarize_each(mean), so that every cell is a single value. Thus obtaining a tidy dataset.


