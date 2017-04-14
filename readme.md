Getting and Cleaning Data: Course Project

Introduction

This repository contains my work for the Coursera course "Getting and Cleaning data". 



About the raw data

There are 2 datasets. One for test and another for training.

The features  are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

The train dataset also has similar 3 parts.



About the script and the tidy dataset

The script run_analysis.R will 

1. merge the test and training sets together 
2. labels are added and only columns that have to do with mean and standard deviation are kept
3. will create a tidy data set containing the means of all the columns per test subject and per activity

Prerequisites for this script:
This file path should exist  -  C:/UCI_HAR_Dataset_Assignment



About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
