#Course Project 

##Human Activity Recognition Using Smartphones Data Set

Taking the data from this experiment, the script run_analysis.R reshapes the data in to a tidy data set that can be used 
for further analysis.

The R package reshape is required to execut this script. Load this package from CRAN with the command install.Packages("reshape")
  if you have not already installled on your machine.

This packages assumes that the data files are stored in the followning structure and the script is ran from the Working folder:

```  
  WORKING
  script run_analysis.R
    UCI HAR Dataset
    activity_labels.txt
      features.txt
      test
        X_test.txt
        y_test.txt
        subject_test.txt
       
      train
        X_train.txt
        y_train.txt
        subject_train.txt
       
```
Set the default folder to the WORKING folder.

Execute the script 
