#Create a folder where put the data

dir.create("C:/Users/arubioca/Desktop/project")

#Change the working directory to this folder

setwd("./project")

#Download the zip data onto this folder
#I dropped the "s" on "https" in order to avoid the "curl" method (Windows version)

URL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,destfile = "./Dataset.zip")

#Now I unzip the folder

unzip("./Dataset.zip")


#Create the tables and merge the corresponding data


setwd("./UCI HAR Dataset/train")

X_train <- read.table("./X_train.txt")
y_train <- read.table("./y_train.txt")
subject_train <- read.table("./subject_train.txt")

setwd("../../UCI HAR Dataset/test")

X_test <- read.table("./X_test.txt")
y_test <- read.table("./y_test.txt")
subject_test <- read.table("./subject_test.txt")


X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)

#Select the mean and std features
setwd("../")
features <- read.table("features.txt")
featuresnames <- features[,2]
#Vector with positions in featuresnames where -mean() or -std() appears.
#Columns of X related to mean and std features.
meanstdfeatures <- grep("-mean()|-std()",featuresnames)

#Select only the std and mean features columns in X
#Change its names by the filtered ones
X <- X[,meanstdfeatures]
names(X) <- featuresnames[meanstdfeatures]

#Create the table of activity_labels
activity <- read.table("activity_labels.txt")
#Change the numbers in y by the labels of the previous table
y[,1] <- activity[y[,1],2]

#Change names in the subject
names(subject) <- "subject"

#Create a big dataset, with all the required data

data <- cbind(X,y,subject)

#We change the name to become them in the same format
names(data)<- tolower(names(data))
names(data)<- gsub("[()]","",names(data))
names(data) <- gsub("[-]","",names(data))
names(data) <- gsub("gyro","gyroscope",names(data))
names(data) <- gsub("acc","accelerator",names(data))
names(data) <- gsub("freq","frequency",names(data))
names(data) <- gsub("^t","time",names(data))
names(data) <- gsub("^f","frequency",names(data))
names(data) <- gsub("mag","magnitude",names(data))


#For the last part of the script, I load plyr package
library(plyr)

#I apply function ddply with this three arguments
  #1. The dataset to apply (data)
  #2. .(subject,activity) : to group by this two fields
  #3. The function we want to act over the dataset in 1, grouped by 2.


df_mean <- ddply(data, .(subject,activity), function(x) colMeans(x[,1:(dim(data)[2]-2)]))
write.table(df_mean, "df_mean.txt", row.names = FALSE, quote = FALSE)
