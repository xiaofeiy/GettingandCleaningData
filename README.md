This repo contains my solution to the Getting and Cleaning Data Course Project.
===========================================================
Dataset for the project was downloaded: from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
With the dataset unzipped in the working directory, the included R script “run_analysis.R” will carry out all analyses required in the project and create a tidy dataset “tidydata.txt”.

Here’re detailed descriptions of the script. The part of the script that completes each step of the instructions are marked with **

++ Load training and testing datasets into R and combine them into one dataset (data).
++ Load descriptives variable names into R (features). **step 4 in the project description**
++ Identify variable names that contain “mean” or “std” using grep. For the purpose of this project, “mean” and “std” could appear anywhere in the variable name (both middle and end are included).  This step identifies 79 variables out of the 561variables from the original dataset.
++ A new dataset (data_new) containing only the variables of interest is created. **step 2 in the project description**

++ Load activity labels for training and testing datasets and combine them into one.
++ Convert these labels to factors and use descriptive activity names to replace the levels. **step 3 in the project description**

++ Load subject ID into R and combine training and testing dataset into one. 
++ Convert IDs to factors.

++ Combine subject ID, activity and measurements of interest into one data frame (data_new). **step 1 in the project description**

++  Load library dplyr, and use group_by and summarize_each to calculate the average of each variable for each activity and each subject. Output of this calculation is written to data frame “output”.
++ Write output to a text file “tidydata.txt” using write.table. **step 5 in the project instruction**

