# Getting and cleaning data course project
### Project
This repository has been created for the final project of the Coursera Course: Getting and Cleaning Data.
### Data
The full explanation of the meaning of the data that is used in this project can be obtained in:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And the data has been taken from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### This repository have three different files:
* The R-Code `run_analysis.R` : With answer to the different questions in the project.
*  The file `df_mean.txt`, having the `.txt` asked in the 5th point of the project.
*  `CodeBook.md`: Where the different variables are explained.

## General idea of the steps of the code `run_analysis.R`
* Creation of a folder where put the data.
* Download the zip data onto this folder and unzip the folder.
* Creation of the tables and merge the corresponding data.
* Selection the mean and std features, to subset the measures.
* Change the names of the columns to make more readable and the name of certain fields asked.
* Create a big dataset, with all the data and mean-std measures.
* For the last part of the script, I load plyr package and the `ddply` function.
* Get a tidy dataset with the mean of each measure in the previous data set, grouped by activity and subject (see CodeBook).
