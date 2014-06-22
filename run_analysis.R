#Loading Lybrary
library(plyr)

#Setting working directort
setwd ("/Users/aldamizaku/Documents/Coursera/Getting_and_Cleaning_Data/UCI_HAR_Dataset")

#Creating tes and train variables
test <- read.csv("./test/subject_test.txt", header = FALSE)
train <- read.csv("./train/subject_train.txt", header = FALSE)
names(test) <- c("subjectid")
names(train) <- c("subjectid")

activityTest <- read.csv("./test/y_test.txt", header = FALSE)
activityTrain <- read.csv("./train/y_train.txt", header = FALSE)
names(activityTest) <- c("activityid")
names(activityTrain) <- c("activityid")

testSet <- cbind(test,activityTest)
trainSet <-cbind(train,activityTrain)

labels <- read.fwf("./activity_labels.txt", c(1,20))
names(labels) <- c("activityid", "activityname")

#combinging the datasets
test_body_acc_x <- read.table("./test/Inertial Signals/body_acc_x_test.txt")
testSet <- cbind(testSet, apply(test_body_acc_x, c(1), mean))
testSet <- cbind(testSet, apply(test_body_acc_x, c(1), sd))

test_body_acc_y <- read.table("./test/Inertial Signals/body_acc_y_test.txt")
testSet <- cbind(testSet, apply(test_body_acc_y, c(1), mean))
testSet <- cbind(testSet, apply(test_body_acc_y, c(1), sd))

test_body_acc_z <- read.table("./test/Inertial Signals/body_acc_z_test.txt")
testSet <- cbind(testSet, apply(test_body_acc_z, c(1), mean))
testSet <- cbind(testSet, apply(test_body_acc_z, c(1), sd))

test_body_gyro_x <- read.table("./test/Inertial Signals/body_gyro_x_test.txt")
testSet <- cbind(testSet, apply(test_body_gyro_x, c(1), mean))
testSet <- cbind(testSet, apply(test_body_gyro_x, c(1), sd))

test_body_gyro_y <- read.table("./test/Inertial Signals/body_gyro_y_test.txt")
testSet <- cbind(testSet, apply(test_body_gyro_y, c(1), mean))
testSet <- cbind(testSet, apply(test_body_gyro_y, c(1), sd))

test_body_gyro_z <- read.table("./test/Inertial Signals/body_gyro_z_test.txt")
testSet <- cbind(testSet, apply(test_body_gyro_z, c(1), mean))
testSet <- cbind(testSet, apply(test_body_gyro_z, c(1), sd))

test_total_acc_x <- read.table("./test/Inertial Signals/total_acc_x_test.txt")
testSet <- cbind(testSet, apply(test_total_acc_x, c(1), mean))
testSet <- cbind(testSet, apply(test_total_acc_x, c(1), sd))

test_total_acc_y <- read.table("./test/Inertial Signals/total_acc_y_test.txt")
testSet <- cbind(testSet, apply(test_total_acc_y, c(1), mean))
testSet <- cbind(testSet, apply(test_total_acc_y, c(1), sd))

test_total_acc_z <- read.table("./test/Inertial Signals/total_acc_z_test.txt")
testSet <- cbind(testSet, apply(test_total_acc_z, c(1), mean))
testSet <- cbind(testSet, apply(test_total_acc_z, c(1), sd))

train_body_acc_x <- read.table("./train/Inertial Signals/body_acc_x_train.txt")
trainSet <- cbind(trainSet, apply(train_body_acc_x, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_acc_x, c(1), sd))

train_body_acc_y <- read.table("./train/Inertial Signals/body_acc_y_train.txt")
trainSet <- cbind(trainSet, apply(train_body_acc_y, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_acc_y, c(1), sd))

train_body_acc_z <- read.table("./train/Inertial Signals/body_acc_z_train.txt")
trainSet <- cbind(trainSet, apply(train_body_acc_z, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_acc_z, c(1), sd))

train_body_gyro_x <- read.table("./train/Inertial Signals/body_gyro_x_train.txt")
trainSet <- cbind(trainSet, apply(train_body_gyro_x, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_gyro_x, c(1), sd))

train_body_gyro_y <- read.table("./train/Inertial Signals/body_gyro_y_train.txt")
trainSet <- cbind(trainSet, apply(train_body_gyro_y, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_gyro_y, c(1), sd))

train_body_gyro_z <- read.table("./train/Inertial Signals/body_gyro_z_train.txt")
trainSet <- cbind(trainSet, apply(train_body_gyro_z, c(1), mean))
trainSet <- cbind(trainSet, apply(train_body_gyro_z, c(1), sd))

train_total_acc_x <- read.table("./train/Inertial Signals/total_acc_x_train.txt")
trainSet <- cbind(trainSet, apply(train_total_acc_x, c(1), mean))
trainSet <- cbind(trainSet, apply(train_total_acc_x, c(1), sd))

train_total_acc_y <- read.table("./train/Inertial Signals/total_acc_y_train.txt")
trainSet <- cbind(trainSet, apply(train_total_acc_y, c(1), mean))
trainSet <- cbind(trainSet, apply(train_total_acc_y, c(1), sd))

train_total_acc_z <- read.table("./train/Inertial Signals/total_acc_z_train.txt")
trainSet <- cbind(trainSet, apply(train_total_acc_z, c(1), mean))
trainSet <- cbind(trainSet, apply(train_total_acc_z, c(1), sd))

#Loading the correct labels
names(testSet) <- c("subjectid", "activityid", "mean_bodyaccx", "sd_bodyaccx",
                    "mean_bodyaccy", "sd_bodyaccy","mean_bodyaccz", "sd_bodyaccz", 
                    "mean_bodygyrox", "sd_bodygyrox","mean_bodygyroy", "sd_bodygyroy",
                    "mean_bodygyroz", "sd_bodgyroz", "mean_totalaccx", "sd_totalaccx",
                    "mean_totalaccy", "sd_totalaccy","mean_totalaccz", "sd_totalaccz")
names(trainSet) <- c("subjectid", "activityid", "mean_bodyaccx", "sd_bodyaccx",
                     "mean_bodyaccy", "sd_bodyaccy","mean_bodyaccz", "sd_bodyaccz",
                     "mean_bodygyrox", "sd_bodygyrox","mean_bodygyroy", 
                     "sd_bodygyroy","mean_bodygyroz", "sd_bodgyroz", 
                     "mean_totalaccx", "sd_totalaccx","mean_totalaccy", 
                     "sd_totalaccy","mean_totalaccz", "sd_totalaccz")

#Creating the clean dataset
dataSet <- rbind(testSet, trainSet)
cleanDataSet <- merge(dataSet, labels,by.x = "activityid")

#Creating the tidy data set
ddply(cleanDataSet, .(activityname, subjectid), summarize, 
      avg_mean_body_acc_x = mean(mean_bodyaccx),
      avg_sd_body_acc_x = mean(sd_bodyaccx))
