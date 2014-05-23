test<-read.table("X_test.txt") 
train<-read.table("X_train.txt") 
combinedfile1<-rbind(test,train)

testlabel<-read.table("y_test.txt") 
trainlabel<-read.table("y_train.txt") 
combinedfile2<-rbind(testlabel,trainlabel)

subjectest<-read.table("subject_test.txt")
subjectrain<-read.table("subject_train.txt")
combinedfile3<-rbind(subjectest,subjectrain)

combinedfile<-cbind(combinedfile1,combinedfile2,combinedfile3)

featuresname<-read.table("features.txt")
names(combinedfile)<-featuresname[,2]
combinedfile$Activityname<-combinedfile[,562]
combinedfile$Subjectname<-combinedfile[,563]

newcombinedfile<-combinedfile[,grep("mean|std|Activityname|Subjectname",names(combinedfile))]
newlycombinedfile<-newcombinedfile[,grep("meanFreq",names(newcombinedfile),invert=TRUE)]

Activitylabels<-read.table("activity_labels.txt",colClasses="character")
mergedData<-merge(newlycombinedfile,Activitylabels,by.x="Activityname",by.y="V1")
mergedData$V2<-as.character(mergedData$V2)
colnames(mergedData)[69]<-"activitydescription"

install.packages("reshape2")
library(reshape2)
dataMelt<-melt(mergedData,id=c("Activityname","activitydescription","Subjectname"))
dcastdata<-dcast(dataMelt,activitydescription+Subjectname~variable,mean)

names(dcastdata)<-gsub("[[:punct:]]", "", names(dcastdata))

write.table(dcastdata,file="tidydata.txt")

