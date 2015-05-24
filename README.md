---
title: 'Getting and Cleaning Data'
output: html_document
---

## Project Statement

Below is a block quote indicating the stated purpose of this project, as provided on the course webpage:

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  
>
>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
>
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
>
>Here are the data for the project: 
>
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
>
> You should create one R script called run_analysis.R that does the following. 
> Merges the training and the test sets to create one data set.
> Extracts only the measurements on the mean and standard deviation for each measurement. 
> Uses descriptive activity names to name the activities in the data set
> Appropriately labels the data set with descriptive variable names. 
> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
>
>Good luck!

## Instructions to Reproduce the Project Output

1. Download and extract the data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip); this should create a directory entitled ```UCI HAR Dataset``` containing a variety of files and subfolders;
2. Set the working directory to match the location of ```run_analysis.R```; this directory should likewise include the extracted directory structure containing the data files;
3. Run ```run_analysis.R```;

## Goals and Output

The purpose of this exercise was to read, merge, tidy and summarize data from a project in the field of human computer interaction entitled Human Activity Recognition Using Smartphones. Running ```run_analysis.R``` accomplishes this by merging the data into a single, tidy dataset entitled ```combined_data``` and further summarizing these data in an independent dataset entitled ```summary_data```. The latter is further output into a tab-delimited file (entitled ```tidyHumanActivityRecognitionUsingSmartphones.txt```). Details pertaining to the nature and values of each of the variables contained within the datasets are provided in the complementary Code Book (https://github.com/nostatisfaction/Getting_and_Cleaning_Data_Project/blob/master/CodeBook.md). Further, please note that I have opted to keep my data in wide format rather than long format (*for discussion as to how this might be considered tidy, see https://class.coursera.org/getdata-014/forum/thread?thread_id=31*)

