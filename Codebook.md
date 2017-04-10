# Codebook

### This is a description of the data (and its format) in the <code>tidy_data.txt</code> output file.

## Data Format
Output file has 180 rows, with each of the 30 participants having measures from all 6 activities:
+ WALKING
+ WALKING_UPSTAIRS
+ WALKING_DOWNSTAIRS
+ SITTING
+ STANDING
+ LAYING

Output file has 68 rows
+ *Subject*: Subject identifier for each participant (1 to 30)
+ *Activity*: See above

For the following, there are two sets of each. 
If starts with 't' denotes time domain signals.
If starts with 'f' denotes frequency domain signals.
+ *BodyAccMean*: body acceleration mean in X,Y,Z planes
+ *BodyAccStd*: body acceleration std in X,Y,Z planes
+ *GravityAccMean*: gravity acceleration mean in X,Y,Z planes
+ *GravityAccStd*: gravity acceleration std in X,Y,Z planes
+ *BodyAccJerkMean*: body acceleration and angular velocity mean in X,Y,Z planes
+ *BodyAccJerkStd*: body acceleration and angular velocity std in X,Y,Z planes
+ *BodyGyroMean*: body gyroscope mean in X,Y,Z planes
+ *BodyGyroStd*: body gyroscope std in X,Y,Z planes
+ *BodyGyroJerkMean*: body gyro and angular velocity mean in X,Y,Z planes
+ *BodyGyroJerkStd*: body gyro and angular velocity std in X,Y,Z planes
+ *BodyAccMagMean*: body acceleration magnitude mean (using Euclidean norm)
+ *BodyAccMagStd*: body acceleration magnitude std (using Euclidean norm)
+ *GravityAccMagMean*: gravity acceleration magnitude mean (using Euclidean norm)
+ *GravityAccMagStd*: gravity acceleration magnitude std (using Euclidean norm)
+ *BodyAccJerkMagMean*: body acceleration and angular velocity magnitude mean (using Euclidean norm)
+ *BodyAccJerkMagStd*: body acceleration and angular velocity magnitude std (using Euclidean norm)
+ *BodyGyroMagMean*: body gyroscope magnitude mean (using Euclidean norm)
+ *BodyGyroMagStd*: body gyroscope magnitude std (using Euclidean norm)
+ *BodyGyroJerkMagMean*: body gyroscope and angular velocity magnitude mean (using Euclidean norm)
+ *BodyGyroJerkMagStd*: body gyroscope and angular velocity magnitude std (using Euclidean norm)
