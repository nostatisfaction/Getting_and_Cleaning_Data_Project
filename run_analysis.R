
# Read in libraries -------------------------------------------------------

library(dplyr)
library(reshape2)

# Read in the training and test data sets ---------------------------------
# NOTE: This script assumes that the data has already been downloaded and
# is in the present working directory; the data was downloaded and prepared
# for analysis May 23rd, 2015 from the link:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Parent directory containing the data
dat_path <- 'UCI HAR Dataset'

# Read in the training and test datasets
train_dat <- read.table(file.path(dat_path, "train", "subject_train.txt"))
train_x_dat <- read.table(file.path(dat_path, "train", "X_train.txt"))
train_y_dat <- read.table(file.path(dat_path, "train", "y_train.txt"))

test_dat <- read.table(file.path(dat_path, "test", "subject_test.txt"))
test_x_dat <- read.table(file.path(dat_path, "test", "X_test.txt"))
test_y_dat <- read.table(file.path(dat_path, "test", "y_test.txt"))

# Read in the features file, containing the name of each feature
feat_dat <- read.table(file.path(dat_path, "features.txt"))

# Use feat_dat to rename the columns in the training and test datasets
names(train_x_dat) <- feat_dat[[2]]
names(test_x_dat) <- feat_dat[[2]]

# Read in the activity labels
activity_dat <- read.table(file.path(dat_path, "activity_labels.txt"))


# Use descriptive activity names ------------------------------------------
# Use this file to convert the activities contained in the training and test
# data sets into a factor with levels assigned according to the values in
# activity_dat; also rename the column in those data sets to activity
train_y_dat <- rename(train_y_dat, Activity=V1) %>% 
    mutate(Activity=factor(Activity, labels=unique(activity_dat$V2)))
test_y_dat <- rename(test_y_dat, Activity=V1) %>% 
    mutate(Activity=factor(Activity, labels=unique(activity_dat$V2)))

# Merge the training and the test sets to create one data set -------------
# Combine all of the data frames together; to permit this, rename the column
# in each of the subject files into SubjID
train_dat <- rename(train_dat, SubjectID=V1)
test_dat <- rename(test_dat, SubjectID=V1)

combined_train <- cbind(train_dat, train_y_dat, train_x_dat)
combined_test <- cbind(test_dat, test_y_dat, test_x_dat)
combined_data <- rbind(combined_train, combined_test)

# Extract the measurements on the mean and sd for each measurement --------
# Also, retain the columns for SubjID and activity
col_to_keep <- sort(grep("mean\\(\\)|std()", names(combined_data)))

# This will keep only columns identified as containing mean or std by the grep
# command above, while also retaining SubjectID and Activity (columns 1 and 2)
# Note that I have explicitly modified my grep to exclude meanFreq() columns 
# from this calculation; reading the description of these data in the provided
# files, they do not appear to me to constitute a standard mean
combined_data <- subset(combined_data, select=c(1,2,col_to_keep))

# Use descriptive variable names ------------------------------------------
# The variable names are a little cryptic in the current data, and also contain
# illegal characters; so I next undertake some manipulations to clarify them.

col_names <- names(combined_data)

# First, convert the letters at the start of the variables to more descriptive
# labels: t to time and f to frequency; apologies for these commands being so 
# long
col_names[substr(col_names,1,1)=='t'] <- paste('time'
                                               , substring(col_names[substr(col_names,1,1)=='t']
                                                           , 2), sep='')
col_names[substr(col_names,1,1)=='f'] <- paste('frequency'
                                               , substring(col_names[substr(col_names,1,1)=='f']
                                                           , 2), sep='')

# Replace '-' with an underscore and remove (); this code is a little clumsy
# but it works
col_names <- gsub('-', '_', col_names)
col_names <- gsub('[()]', '', col_names)

# Fix typo (i.e., 'BodyBody' should be simply 'Body')
col_names <- gsub('BodyBody', 'Body', col_names)

# Expand Acc to Acceleration, Mag to Magnitude and Gyro to Gyroscope
col_names <- gsub('Acc', 'Acceleration', col_names)
col_names <- gsub('Mag', 'Magnitude', col_names)
col_names <- gsub('Gyro', 'Gyroscope', col_names)

# I left std as an abbreviation rather than the more descriptive Standard
# Deviation, because std is fairly standard notation

# Set the new column names
names(combined_data) <- col_names

# Create a tidy data set containing averages ------------------------------

summary_data <- summarise_each(group_by(combined_data, Activity, SubjectID), funs(mean))

# Output the tidy data set ------------------------------------------------

write.table(summary_data, file = "tidyHumanActivityRecognitionUsingSmartphones.txt", row.names=FALSE, sep='\t')
