##################################################
# (1) --- Read and load data into tables
##################################################

######Test
# X_test - measurement data - 2947 Obs of 561 variables
X_test <- read.table("UCI HAR Dataset/test/X_test.txt") 

# Y_test - activity data - 2947 Obs of 1 variables
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt") 

# Subject_test - subject data - 2947 Obs of 1 variables
Subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt") 

######Train
# X_test - measurement data - 7352 Obs of 561 variables
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

# Y_test - activity data - 7352 Obs of 1 variables
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

# subject_test - subject data - 7352 Obs of 1 variables
Subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") 


##################################################
# (2) --- Read and load data into tables regarding column information 
##################################################

# Features - activity data - 561 Obs of 1 variables
Features <- read.table("UCI HAR Dataset/features.txt") 

##################################################
# (3) --- Cleaning up the column names
##################################################
# issues to be resolve 
# repalce () by ""
# repalce - by .
# repalce , by .
# fbodybody to fbody 
# all column names to lower case
Features$V2 <- gsub("[()]","",Features$V2) 
Features$V2 <- gsub("[-]",".",Features$V2) 
Features$V2 <- gsub("[,]",".",Features$V2) 
Features$V2 <- gsub("fBodyBody","fBody",Features$V2)
Features$V2 <- tolower(Features$V2) 


##################################################
# (4) --- adding column names to X_test and X_train
##################################################
colnames(X_test) <- Features$V2
colnames(X_train) <- Features$V2

##################################################
# (5) --- get only the mean and standard deviation for each measurement on X_test and X_train
##################################################
new_X_test<-X_test[,(grepl("\\.mean", Features$V2) | grepl("\\.std", Features$V2)) & !grepl("\\.meanfreq", Features$V2)]
new_X_train<-X_train[,(grepl("\\.mean", Features$V2) | grepl("\\.std", Features$V2)) & !grepl("\\.meanfreq", Features$V2)]


##################################################
# (6) ---  join/bind dataframes  Subject_test+Y_test+new_X_test
##################################################
df_test <- cbind(Subject_test,Y_test,new_X_test)


##################################################
# (6) ---  join/bind dataframes  Subject_train+Y_train+new_X_train
##################################################
df_train <- cbind(Subject_train,Y_train,new_X_train)


##################################################
# (6) ---  union  dataframes  df_test+df_train
##################################################
df_final <- rbind(df_test,df_train)


##################################################
# (6) ---  Rename the first two columns to subject and activity
##################################################
colnames(df_final)[1] <- "subject"
colnames(df_final)[2] <- "activity"

##################################################
# (7) ---  Aggregate the data based on the activity and subject, taking the mean of the columns
##################################################
agg_df_final <-aggregate(df_final, by=list(subject = df_final$subject, activity = df_final$activity), FUN=mean, na.rm=TRUE)

##################################################
# (7) ---  Subset to remove the groups created by the aggregate function
##################################################
agg_df_final <- agg_df_final[,c(3:70)]

##################################################
# (8) ---  Rename activity data: 1(walking),2(walking_upstairs,3(walking_downstairs),
#       4(sitting),5(standing),6(laying)
##################################################
agg_df_final$activity[agg_df_final$activity == 1] <- "walking"
agg_df_final$activity[agg_df_final$activity == 2] <- "walking_upstairs"
agg_df_final$activity[agg_df_final$activity == 3] <- "walking_downstairs"
agg_df_final$activity[agg_df_final$activity == 4] <- "sitting"
agg_df_final$activity[agg_df_final$activity == 5] <- "standing"
agg_df_final$activity[agg_df_final$activity == 6] <- "laying"


##################################################
# (9) ---  write tab delimited text file
##################################################
write.table(agg_df_final, "course-project-tidy-data.txt", sep="\t", row.name=FALSE )
