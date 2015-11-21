library(reshape)


# Read in Activity Labels
ActivityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt",header=FALSE,sep="")
colnames(ActivityLabels)<-c("ActivityID","Activity")

# Read in Data
Test <-read.table('UCI HAR Dataset\\test\\X_test.txt',header=FALSE,sep="")
Train <-read.table('UCI HAR Dataset\\train\\X_train.txt',header=FALSE,sep="")

#Read in Test Key
YTest  <-read.table('UCI HAR Dataset\\test\\y_test.txt',header=FALSE,sep="")
colnames(YTest)<-c("ActivityID")

YTrain <-read.table('UCI HAR Dataset\\train\\y_train.txt',header=FALSE,sep="")
colnames(YTrain)<-c("ActivityID")

# Read in Column Names
ColumnNames <- read.table("UCI HAR Dataset\\features.txt",header=FALSE,sep="")

# Read in Subjects
Stest <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header=FALSE,sep="")
colnames(Stest)<-c("Subject")

Strain <-read.table('UCI HAR Dataset\\train\\subject_train.txt',header=FALSE,sep="")
colnames(Strain)<-c("Subject")

# Add Column Names to Dataframes
colnames(Test) <- ColumnNames[["V2"]]
colnames(Train) <- ColumnNames[["V2"]]




#Add subject numbers to data
TestS <- cbind(Stest,YTest, Test)
TrainS <- cbind(Strain,YTrain,Train)


# Merge Dataframes
Merged <-rbind(TrainS,TestS)

 Merge.Melt <- melt(Merged,id=c("Subject","ActivityID"),measure.vars=3:562)
 

 
 # define pattern to subselect the measures required of mean() and std()
 pattern <- "-mean\\(\\)|-std\\(\\)"
Merged.Melt.s <- Merge.Melt[grep(pattern,Merge.Melt$variable),]


#calculate the mean  by Subject,Activity,variable  
M <- aggregate(Merged.Melt.s["value"],by=Merged.Melt.s[c("Subject","ActivityID","variable")],FUN=mean) 

# Merge the names of activity to the activities list 
M.named = merge(ActivityLabels,M,by="ActivityID") 
M.named$ActivityID <- NULL

colnames(M.named) <- c("Activity", "Subject","Measurment","MeanValue")
write.table(M.named, "tidy.txt", sep="\t",row.name=FALSE)
 
 
