##Getting and Cleaning DataData Science, JHU coursera.org
##Course Project
##Code Book
######2014.08.23

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data set was provided by contains data collected from the accelerometers from the Samsung Galaxy S smartphone.

The dataset zip file contains the txt data files with the accelerometers data divided by 3 type of files  :

######Set files
- 'train/X_train.txt': Training set.
- 'test/X_test.txt': Test set.

######Label files
- 'train/y_train.txt': Training labels.
- 'test/y_test.txt': Test labels.

######The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


From the zip the readme.txt (file describes the experiments) :
>... | experiments [that] have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The data set was provided as a zipped file and the instructions were to unzip the file into the working directory of RStudio - such that a script will assume the appropriate files are in the working directory.

For the purposes of this project the Triaxial Acceleration and Triaxial Angular were not needed - such data was contained in the Inertial Signals directories of the data set.


#####For the purposes of this project we were to merge the test and train data sets, extract only the measurements on the mean and standard deviation for each measurement, modify the variable names for readability and tidiness, modify the activity labels to be descriptive.

######The data set created and written by run_analysis.R contains only the mean of each variable for each subject/activty pair.

Accordingly, after examining the information provided in the UCI dataset, variables which were determined to meet the criteria as measurements of mean and standard deviation based on the descriptions and variable name were extracted and the names were modified to meet with accepted standards.

iw was opted to use lowercase variable names and add a '.' prior to all function decribed in each dataset var.
It was also include a . on all (x,y or z).  
It was used the  [Google R Style Guide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers) to normalize the variables names.



###How run_analysis.R implements the above steps:

** The code in run_analysis.R as all the steps descibed


<ol>
<li>Load test and train data</li>
<li>Load features labels.</li>
<li>Clean up the column name</li>
<li>Add column names to data.fames of step 1</li>
<li>From data.frames of step 1 select only mean and std columns</li>
<li>Join and union all the information in a single data.frame (df_final)</li>
<li>Aggregate the data based on the activity and subject, taking the mean of the columns</li>
<li>Rename activity data</li>
<li>write aggregation data frame final result into a delimited text file</li>
</ol>

###Tidy Data filde column's and data type.


column               | type| data                                       |
---------------------|:----|--------------------------------------------|
subject              | num |1 2 3 4 5 6 7 8 9 10 ... |
activity             | chr |"walking" "walking" "walking" "walking" ... |
tbodyacc.mean.x      | num |0.277 0.276 0.276 0.279 0.278 ... |
tbodyacc.mean.y      | num |-0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ... |
tbodyacc.mean.z      | num |-0.111 -0.106 -0.113 -0.111 -0.108 ... |
tbodyacc.std.x       | num |-0.284 -0.424 -0.36 -0.441 -0.294 ... |
tbodyacc.std.y       | num |0.1145 -0.0781 -0.0699 -0.0788 0.0767 ... |
tbodyacc.std.z       | num |-0.26 -0.425 -0.387 -0.586 -0.457 ... |
tgravityacc.mean.x   | num |0.935 0.913 0.937 0.964 0.973 ... |
tgravityacc.mean.y   | num |-0.2822 -0.3466 -0.262 -0.0859 -0.1004 ... |
tgravityacc.mean.z   | num |-0.0681 0.08473 -0.13811 0.12776 0.00248 ... |
tgravityacc.std.x    | num |-0.977 -0.973 -0.978 -0.984 -0.979 ... |
tgravityacc.std.y    | num |-0.971 -0.972 -0.962 -0.968 -0.962 ... |
tgravityacc.std.z    | num |-0.948 -0.972 -0.952 -0.963 -0.965 ... |
tbodyaccjerk.mean.x  | num |0.074 0.0618 0.0815 0.0784 0.0846 ... |
tbodyaccjerk.mean.y  | num |0.02827 0.01825 0.01006 0.00296 -0.01632 ... |
tbodyaccjerk.mean.z  | num |-4.17e-03 7.90e-03 -5.62e-03 -7.68e-04 8.32e-05 ... |
tbodyaccjerk.std.x   | num |-0.114 -0.278 -0.269 -0.297 -0.303 ... |
tbodyaccjerk.std.y   | num |0.067 -0.0166 -0.045 -0.2212 -0.091 ... |
tbodyaccjerk.std.z   | num |-0.503 -0.586 -0.529 -0.751 -0.613 ... |
tbodygyro.mean.x     | num |-0.0418 -0.053 -0.0256 -0.0318 -0.0489 ... |
tbodygyro.mean.y     | num |-0.0695 -0.0482 -0.0779 -0.0727 -0.069 ... |
tbodygyro.mean.z     | num |0.0849 0.0828 0.0813 0.0806 0.0815 ... |
tbodygyro.std.x      | num |-0.474 -0.562 -0.572 -0.501 -0.491 ... |
tbodygyro.std.y      | num |-0.0546 -0.5385 -0.5638 -0.6654 -0.5046 ... |
tbodygyro.std.z      | num |-0.344 -0.481 -0.477 -0.663 -0.319 ... |
tbodygyrojerk.mean.x | num |-0.09 -0.0819 -0.0952 -0.1153 -0.0888 ... |
tbodygyrojerk.mean.y | num |-0.0398 -0.0538 -0.0388 -0.0393 -0.045 ... |
tbodygyrojerk.mean.z | num |-0.0461 -0.0515 -0.0504 -0.0551 -0.0483 ... |
tbodygyrojerk.std.x  | num |-0.207 -0.39 -0.386 -0.492 -0.358 ... |
tbodygyrojerk.std.y  | num |-0.304 -0.634 -0.639 -0.807 -0.571 ... |
tbodygyrojerk.std.z  | num |-0.404 -0.435 -0.537 -0.64 -0.158 ... |
tbodyaccmag.mean     | num |-0.137 -0.29 -0.255 -0.312 -0.158 ... |
tbodyaccmag.std      | num |-0.22 -0.423 -0.328 -0.528 -0.377 ... |
tgravityaccmag.mean  | num |-0.137 -0.29 -0.255 -0.312 -0.158 ... |
tgravityaccmag.std   | num |-0.22 -0.423 -0.328 -0.528 -0.377 ... |
tbodyaccjerkmag.mean | num |-0.141 -0.281 -0.28 -0.367 -0.288 ... |
tbodyaccjerkmag.std  | num |-0.0745 -0.1642 -0.1399 -0.3169 -0.2822 ... |
tbodygyromag.mean    | num |-0.161 -0.447 -0.466 -0.498 -0.356 ... |
tbodygyromag.std     | num |-0.187 -0.553 -0.562 -0.553 -0.492 ... |
tbodygyrojerkmag.mean| num |-0.299 -0.548 -0.566 -0.681 -0.445 ... |
tbodygyrojerkmag.std | num |-0.325 -0.558 -0.567 -0.73 -0.489 ... |
fbodyacc.mean.x      | num |-0.203 -0.346 -0.317 -0.427 -0.288 ... |
fbodyacc.mean.y      | num |0.08971 -0.0219 -0.0813 -0.1494 0.00946 ... |
fbodyacc.mean.z      | num |-0.332 -0.454 -0.412 -0.631 -0.49 ... |
fbodyacc.std.x       | num |-0.319 -0.458 -0.379 -0.447 -0.298 ... |
fbodyacc.std.y       | num |0.056 -0.1692 -0.124 -0.1018 0.0426 ... |
fbodyacc.std.z       | num |-0.28 -0.455 -0.423 -0.594 -0.483 ... |
fbodyaccjerk.mean.x  | num |-0.171 -0.305 -0.305 -0.359 -0.345 ... |
fbodyaccjerk.mean.y  | num |-0.0352 -0.0788 -0.1405 -0.2796 -0.1811 ... |
fbodyaccjerk.mean.z  | num |-0.469 -0.555 -0.514 -0.729 -0.59 ... |
fbodyaccjerk.std.x   | num |-0.134 -0.314 -0.297 -0.297 -0.321 ... |
fbodyaccjerk.std.y   | num |0.10674 -0.01533 -0.00561 -0.2099 -0.05452 ... |
fbodyaccjerk.std.z   | num |-0.535 -0.616 -0.544 -0.772 -0.633 ... |
fbodygyro.mean.x     | num |-0.339 -0.43 -0.438 -0.373 -0.373 ... |
fbodygyro.mean.y     | num |-0.103 -0.555 -0.562 -0.688 -0.514 ... |
fbodygyro.mean.z     | num |-0.256 -0.397 -0.418 -0.601 -0.213 ... |
fbodygyro.std.x      | num |-0.517 -0.604 -0.615 -0.543 -0.529 ... |
fbodygyro.std.y      | num |-0.0335 -0.533 -0.5689 -0.6547 -0.5027 ... |
fbodygyro.std.z      | num |-0.437 -0.56 -0.546 -0.716 -0.42 ... |
fbodyaccmag.mean     | num |-0.129 -0.324 -0.29 -0.451 -0.305 ... |
fbodyaccmag.std      | num |-0.398 -0.577 -0.456 -0.651 -0.52 ... |
fbodyaccjerkmag.mean | num |-0.0571 -0.1691 -0.1868 -0.3186 -0.2695 ... |
fbodyaccjerkmag.std  | num |-0.1035 -0.1641 -0.0899 -0.3205 -0.3057 ... |
fbodygyromag.mean    | num |-0.199 -0.531 -0.57 -0.609 -0.484 ... |
fbodygyromag.std     | num |-0.321 -0.652 -0.633 -0.594 -0.59 ... |
fbodygyrojerkmag.mean| num |-0.319 -0.583 -0.608 -0.724 -0.548 ... |
fbodygyrojerkmag.std | num |-0.382 -0.558 -0.549 -0.758 -0.456 ... |