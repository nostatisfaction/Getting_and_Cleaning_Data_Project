---
title: 'Getting and Cleaning Data: Code Book'
output: html_document
---

## Description

This file provides a description of the tidy data set created from the project entitled "Human Activity Recognition Using Smartphones" (*for further details, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*). Below you will find a description of the variables contained in the tidy data set. Descriptions of the original variables and their meaning are documented in the files provided along with those data. As discussed on the course webpage (*see https://class.coursera.org/getdata-014/forum/thread?thread_id=31*), I have opted to use a wide- as opposed to long-data format.

## Variables

The first two columns in the tidy dataset are ```SubjectID``` and ```Activity```: 
These indicate identifiers unique for each subject and activity, respectively. 
Values corresponding to ```SubjectID``` range from 1 to 30 whereas values for 
```Activity``` include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING and LAYING. 

Each remaining column is named according to a consistent scheme:

    1. Each begins with either time or frequency indicating whether that variable corresponds to the time or frequency domain.
    
    2. The second token will be either Body or Gravity, indicating whether that variable derives from forces arising from the individual's body or the mere force of gravity.
    
    3. The third token will be either Acceleration or Gyroscope and indicates whether the measurement corresponds to an accelerometer or a gyroscope.
    
    4. Sometimes an additional token appears at this point indicating Jerk or Magnitude, when present this indicates that the measurement corresponds to a jerk signal, magnitude signal or a combination of the two.
    
    5. Each variable name will also include a token indicating whether the measurement is a mean (mean) or standard deviation (std).
    
    6. Finally, an additional token is sometimes appended indicating the axis along which the measurement was taken (i.e., X, Y or Z)
    
For example, the variable ```frequencyBodyAccelerationJerkMagnitude_mean``` refers to a measurement in the frequency domain measuring forces arising from body motion as measured by an accelerometer quantifying the mean jerk magnitude. Each variable was normalized and bounded to vary between -1 and 1, making the units arbitrary (*for further details, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones*).

## Summaries Calculated

The summary data frame (referred to as ```summary_data``` in-file) represents 
the mean of each other column (i.e., feature) as a function of the variables 
```Activity``` and ```SubjectID```.

