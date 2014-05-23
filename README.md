Script Description
===========================================================

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

### Note: created tidy data contains 180 rows and 68 columns
--------------------------------------------------------



