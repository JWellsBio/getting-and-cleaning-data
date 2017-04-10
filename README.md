# Getting and Cleaning Data Project
## Course: Getting and Cleaning Data, Johns Hopkins, Coursera
### Jason Wells

## Dataset
This activity uses the [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Data Description
A group of 30 volunteers participated in six activities with a smartphone on their waist.
Data was collected from the phone's accelerometer and gyroscope.
Data was randomly split into a training set (70%) and a testing set (30%).

## Analysis Script
The included *run_analysis.R* script performs the following:
+ Imports all necessary files
+ Uses feature names to ONLY capture features labelled as 'mean' or 'std' (not MeanFreq)
+ Combines all training data (subject ID, activity ID, and pertinent measurements)
+ Combines all testing data (subject ID, activity ID, and pertinent measurements)
+ Combines all data
+ Uses <code>reshape2</code> package to melt the data by subject and activity
+ Outputs a file ('tidy_data.txt') that contains the means of all measures by subject and activity

## Tidy Data  Description
Tidy data set is 180 rows (30 participants x 6 activities) and 68 columns (subject, activity, and 66 measures)

## Variable description
Can be found in Codebook
