# File: run_analysis.R
# For Getting and Cleaning Data Course Project, Data Science Specialization, Coursera
# This script will:
    # Merge training and testing data into one dataset
    # Extract only mean and std for each measurement
    # Descriptively name the activities included
    # Appropriately label the dataset
    # End up with a smaller tidy dataset

# All calls for data assume that they are in the same working directory as this script

library(reshape2) # this will et us melt data for easy tidy data formation at the end
# Get auxiliary data
features <- read.table('features.txt', header = FALSE, stringsAsFactors = FALSE) # list of all features
activity_labels <- read.table('activity_labels.txt', header = FALSE, stringsAsFactors = FALSE) # list of activity labels

# Label this data
colnames(activity_labels) <- c('activity_ID', 'activity_type')

# Get only features that include 'mean' and 'std'
feats_mean_std <- grep("-(mean|std)\\(\\)", features[, 2]) # only capture features with 'mean' or 'std'
feats_mean_std_names <- features[feats_mean_std, 2] # get the names of those features


# Get all training data
subj_train <- read.table('train/subject_train.txt', header = FALSE) # identifies the subject who performed the activity
x_train <- read.table('train/X_train.txt', header = FALSE) # training set
colnames(x_train) <- features[,2] # apply feature names to measures
x_train_subbed <- x_train[which(colnames(x_train) %in% feats_mean_std_names)] # only training means and stds
y_train <- read.table('train/y_train.txt', header = FALSE) # training labels

all_train <- cbind(subj_train, y_train, x_train_subbed) # order is specific: subj, label, all measures
colnames(all_train)[1:2] <- c('Subject', 'Activity') # Training data now has only measures we want and is appropriately labelled


# Get all testing data
subj_test <- read.table('test/subject_test.txt', header = FALSE) # identifies the subject who performed the activity
x_test <- read.table('test/X_test.txt', header = FALSE) # testing set
colnames(x_test) <- features[,2] # apply feature names to measures
x_test_subbed <- x_test[which(colnames(x_test) %in% feats_mean_std_names)] # only measures we want
y_test <- read.table('test/y_test.txt', header = FALSE) # testing labels

all_test <- cbind(subj_test, y_test, x_test_subbed) # order is specific
colnames(all_test)[1:2] <- c('Subject', 'Activity') # This now looks the same as training data set

# Merge all data and label properly
all_data <- rbind(all_test, all_train) # merge all data


# All but last objective have been accomplished to this point
# Need to get averages by subject and activity
# We can get a nice output using melt from reshape2

# Factorize subject and activity
all_data$Subject <- as.factor(all_data$Subject) # factor w 30 levels for 30 participants
all_data$Activity <- factor(all_data$Activity, levels = activity_labels$activity_ID, labels = activity_labels$activity_type) # factor w 6 levels describing activities

# Melt the data on the 2 factors we just created
all_data_melted <- melt(all_data, id = c('Subject', 'Activity'))

# Get means by subject and activity
all_data_melted_means <- dcast(all_data_melted, Subject + Activity ~ variable, mean)

# This is the tidy data we are looking for.
# dim(all_data_melted_means) = 180 x 68
# 180 rows = 30 participants x 6 activities
# 68 columns = subject, activity, and 66 mean or std measures

# We can probably clean up these column names a little
colnames(all_data_melted_means)[3:ncol(all_data_melted_means)] <- gsub('[-()]', '', colnames(all_data_melted_means)[3:ncol(all_data_melted_means)])

# Write the data to a .txt file
write.table(all_data_melted_means, file = 'tidy_data.txt', row.names = FALSE, quote = FALSE)
