# project for "getting and cleanning data" course

# getting the current directory path
#assuming that the data is stored in the current directory with the same format as the original files

directory <- getwd()

# reading data files

file_name_tr <- paste0(directory,"/UCI HAR Dataset/train/X_train.txt")
file_name_tr_y <- paste0(directory,"/UCI HAR Dataset/train/y_train.txt")
file_name_tr_sj <- paste0(directory,"/UCI HAR Dataset/train/subject_train.txt")

file_name_ts <- paste0(directory,"/UCI HAR Dataset/test/X_test.txt")
file_name_ts_y <- paste0(directory,"/UCI HAR Dataset/test/y_test.txt")
file_name_ts_sj <- paste0(directory,"/UCI HAR Dataset/test/subject_test.txt")

file_name_ft <- paste0(directory,"/UCI HAR Dataset/features.txt")
file_name_lbl <- paste0(directory,"/UCI HAR Dataset/activity_labels.txt")

FT <- read.table(file_name_ft)
Lbl_ac <- read.table(file_name_lbl)

trainset_X <- read.table(file_name_tr)
trainset_y <- read.table(file_name_tr_y)
trainset_sj <- read.table(file_name_tr_sj)

testset_X <- read.table(file_name_ts)
testset_y <- read.table(file_name_ts_y)
testset_sj <- read.table(file_name_ts_sj)


# 1- merging training set and test set

DT_X <- rbind(trainset_X,testset_X)
DT_y <- rbind(trainset_y,testset_y)
DT_sj <- rbind(trainset_sj,testset_sj)

dim(trainset_X)
dim(testset_X)
dim(DT_X)


# 2- extracting only the measurements with mean or std

mean_std_DT <- grep("*mean()|std()*",FT[,2])

DT_X_meanstd <- DT_X[,mean_std_DT]

dim(DT_X_meanstd)

# 3- naming the activity names with descriptive names

DT_FT <- factor(DT_y[,1])
levels(DT_FT) <- Lbl_ac[,2]

# 4 - appropriating naming the vaiables and merging the measurements with activities and subjects
DT_X_meanstd <- setNames(DT_X_meanstd,FT[mean_std_DT,2])

DT_FT <- as.data.frame(DT_FT)
DT_FT <- setNames(DT_FT,"activity")

DT_sj <- setNames(DT_sj,"subject_test")

DT <- cbind(DT_X_meanstd,DT_FT,DT_sj)

# DT <- DT[complete.cases(DT),]

# 5 creating new independent data set with the average of each variable for wach activity and test subject

if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}

library(reshape2)

new_DT <- melt.data.frame(DT, id.vars=c("activity","subject_test"))

new_DT$value <- as.numeric(new_DT$value)

new_DT <- new_DT[complete.cases(new_DT),]

new_DT <- dcast(new_DT, activity + subject_test ~ variable, mean)

# writing the new dataset in a text file

write.table(new_DT, "tidy_data.txt", sep = "\t", row.names= FALSE)


