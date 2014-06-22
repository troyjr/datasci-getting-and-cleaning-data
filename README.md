datasci-getting-and-cleaning-data
=================================

A project submission for Data Science MOOC - Getting and cleaning data

Introduction
------------

The scientific discipline of interpreting and analysing data begins here.

Cleaning and tidying data is the first step in the data pipeline, but arguably the most important step and where most time is spent is preparing, cleaning and tidying data which can come in vast or small quantities from a plethora of different sources or from one single source for upstream analysis.

This project submission aims to provide an example of lessons learnt in the art of collecting and presenting tidy, documented, clearly understood and reproducible data from a given source. This will involve a decent amount of tranforming, munging, refactoring and understanding of the source of the data to fulfil the given objectives.

The source
----------

The data source in question is a set of publicly available datasets from the University of California, Irvine (UCI).
from their Center for Machine Learning and Intelligent Systems webpage. Currently, there are approximately 290 data sets available.
http://archive.ics.uci.edu/ml/datasets.html

The data sets
-------------
The specific data sets are the "Human Activity Recognition Using Smartphones Data Set" 

Abstract:

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Università degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition@smartlab.ws 
www.smartlab.ws 

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Citation:

Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.

BiBTeX citation:

@misc{Bache+Lichman:2013 ,
author = "K. Bache and M. Lichman",
year = "2013",
title = "{UCI} Machine Learning Repository",
url = "http://archive.ics.uci.edu/ml",
institution = "University of California, Irvine, School of Information and Computer Sciences" }

Additional data set specific citation:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


The data:
---------
The direct link to this data set in zipped (.zip) form (UCI Link) :

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

File size:  62,556,944 bytes

MD5: d29710c9530a31f303801b6bc34bd895

SHA-1: 566456a9e02a23c2c0144674d9fa42a8b5390e71

Objectives
-----------
1. Create a tidy data set according to best practicies for tidying data ( this will be the result of the analysis)
 
2. Create an  R script called run_analysis.R that does the following:

 1. Merges the training and the test sets to create one data set.
 2. Extract only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

3. Create a a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4. Document how the scripts work in this README.md
5. 

The script
-----------

The script to perform the tranformation is contained within this repository as "run_anaylsis.r".

It includes the "plyr" and "reshape2" libraries.

The main function is "run_anaylsis"

It accepts two arguments:

dir - an absolute or relative path to the unzipped UCI HAR Dataset. By default it is "UCI HAR Dataset".
mean - a boolean value. If TRUE it will generate a summary table of means of all values by Subject and Activity.   Otherwise it will generate a the merged test and training sets, only mean and standard deviaton measures, renaming the columns and labels the dataset activities.

The function does not write a csv to disk, but returns a data.frame variable which can be used to write a csv (eg, with write.csv) or manipulated further.

The code is heavily commented and makes use of several helper functions written for this purpose.

Basic pseudocode for the script is as follows:


begin:  
  read in "activity_labels.txt" from directory  
  read in "features.txt" from directory  
  for all datasets in the list "test", "train"  
    call function "read_dataset" with arguments of directory, datasetname, dataframe of features, dataframe of activities
    call function "filter_dataset" with arguments of dataset
    call function "rename_columns" with arguments of dataset
    add dataset to larger list of datasets
  merge all datasets into single dataset
  sort dataset column names alphabetically
  if mean is true, calculate mean across subject and activity
  if mean is not true, return final dataset
end

begin function "read_dataset":
  read in dataset from directory and file "X_[test|train].txt"
  assign column names from features to dataset
  read in subjects from directory and file "subject_[test|train].txt"
  append subjects as a column to dataset
  read in activities from directory and file "y_[test|train].txt"
  append activities as a column to dataset
  join activity labels to dataset
  return modified dataset
end function

being function "filter_dataset":
  filter out dataset to only "standard deviation" and "mean" columns
  include "subject" and "activity" columns
  return modified dataset
end function

begin function "rename_columns"
  rename columns to tidy names
  return modified dataset
end


  

