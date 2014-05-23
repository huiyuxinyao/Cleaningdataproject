Code Book
========================================================
### The created tidy dataset ("tidydata.txt") contains 180 observations and 68 variables

#### The activitydescription variable contains 6 character values which represents 6 different activities LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
#### The Subjectname variable contains 30 integer values from 1 to 30 which represents 30 volunteers
#### Other 66 variables' class is numeric, each number representing an average signal record by each activity description and by each volunteer
* The prefix "t" denotes time domain signals, the prefix "f" denotes frequency domain signals
* strings of "BodyACC", "BodyACCJerk", "BodyGyro", "BodyAccMag", "GravityAcc", "GravityAccJerk", "GravityAccMag" represents different patterns of signals
* strings of "mean" and "std" represents the mean value and the standard deviation value of these signals
* strings of "X","Y","Z" represents the 3-axial signals in the X, Y, and Z directions


#### Names of 68 variables are as follows

* activitydescription 
* Subjectname 
* tBodyAccmeanX 
* tBodyAccmeanY
* tBodyAccmeanZ
* tBodyAccstdX
* tBodyAccstdY
* tBodyAccstdZ
* tGravityAccmeanX
* tGravityAccmeanY
* tGravityAccmeanZ
* tGravityAccstdX
* tGravityAccstdY
* tGravityAccstdZ
* tBodyAccJerkmeanX
* tBodyAccJerkmeanY
* tBodyAccJerkmeanZ
* tBodyAccJerkstdX
* tBodyAccJerkstdY
* tBodyAccJerkstdZ
* tBodyGyromeanX
* tBodyGyromeanY
* tBodyGyromeanZ
* tBodyGyrostdX
* tBodyGyrostdY
* tBodyGyrostdZ
* tBodyGyroJerkmeanX
* tBodyGyroJerkmeanY
* tBodyGyroJerkmeanZ
* tBodyGyroJerkstdX
* tBodyGyroJerkstdY
* tBodyGyroJerkstdZ
* tBodyAccMagmean
* tBodyAccMagstd
* tGravityAccMagmean
* tGravityAccMagstd
* tBodyAccJerkMagmean
* tBodyAccJerkMagstd
* tBodyGyroMagmean
* tBodyGyroMagstd
* tBodyGyroJerkMagmean
* tBodyGyroJerkMagstd
* fBodyAccmeanX
* fBodyAccmeanY
* fBodyAccmeanZ
* fBodyAccstdX
* fBodyAccstdY
* fBodyAccstdZ
* fBodyAccJerkmeanX
* fBodyAccJerkmeanY
* fBodyAccJerkmeanZ
* fBodyAccJerkstdX
* fBodyAccJerkstdY
* fBodyAccJerkstdZ
* fBodyGyromeanX
* fBodyGyromeanY
* fBodyGyromeanZ
* fBodyGyrostdX
* fBodyGyrostdY
* fBodyGyrostdZ
* fBodyAccMagmean
* fBodyAccMagstd
* fBodyBodyAccJerkMagmean
* fBodyBodyAccJerkMagstd
* fBodyBodyGyroMagmean
* fBodyBodyGyroMagstd
* fBodyBodyGyroJerkMagmean
* fBodyBodyGyroJerkMagstd

#### Data Cleaning Processure Note: 
First of all, several data files are combined together to get a data frame with 564 variables and 10299 observations. Then each variable is appropriately named.
Then the variables with mean and standard deviation are picked, which narrow the variables to 68. After that, through reshaping the data, we can get the average of each variable
for each activity and each subject, which narrows the rows to 180. Finally this tidy data set was written into a text file under the working directory.  

#### Set the working directory and download the data under working directory
#### Read data files and use rbind() and cbind() to combine them together
* combinedfile1 combined Test set and Training set together by rows
* combinedfile2 combined Test labels and Training labels together by rows
* combinedfile3 combined Test subjects and Training subjects together by rows
* combinedfile combined combinedfile1, combinedfile2 and combinedfile3 together by columns

#### Read features file and add it as the column names as combined file
* 561 features are added as the column names as combined file
* add column name Activityname and Subjectname respectively for the 562th and 563th column

#### Extract the measurements with mean and standard deviation
* use greb function to extract from column names which only have strings (mean, std, Activityname and Subjectname)
* also use greb function to get rid of the names with string (meanFreq) as this is not a mean measurement

#### Link descriptive activity name to the variable Activityname
* read the file with descriptive activity names
* use merge function to merge two dataframes together since they share the same activity labels
* give the new variable a column name as "activitydescription" 
* now we have a dataset named "mergedData"

#### Reshape the data set to get the average of each variable for each activity and each subject
* install and load reshape2 package
* use melt funtion to melt all the variables by building id as Activityname,activitydescription and Subjectname
* use dcast function to get the mean ofeach variable by each subject and each Activityname

#### To get appropriate column names by removing special characters
* use gsub function to get rid of special characters such as "-" and "()" in names

#### Use write.table function to write the tidy data set into a txt file named "tidydata.txt" under the working directory




