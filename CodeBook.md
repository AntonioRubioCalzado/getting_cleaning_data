
## Functions used in the `run_analysis.R` code:

* `download.file()`: To download the files from the URL.
* `read.table()`: To create tables from the downloaded data.
* `unzip()`: To uncompressed the downloaded data.
* `grep()`: Used to detect mean and std measures.
* `gsub()`: To modify the names properly, making them more readable.
* `cbind()` : To join `X`, `y` and `subject`
* `names()` : To get different names of the columns of a dataframe.
* `ddply()` : To do the last part of the project (5th point).
* `write.table()` : To create the `.txt` asked in the 5th point.

## Variables
* `URL`: The Url where our zip data has been obtained.
* `X_train`,`y_train`,`subject_train`,`X_test`,`y_test`,`subject_test` : Has the data of the downloaded (and previously unziped) files.
* `X`,`y`,`subject` : Result of merging the train and test data.
* `features` has the data of the .txt with equal name, and have the name of the columns in `X` (we have called this variable of names `featurenames`).
* `meanstdfeatures` contains only the `featurenames` having `-mean()` or `-std()` in its name.
* `activity` is the variable with the data on .txt with equal name.
* `data` is the union by columns of the data `X`,`y` and `subject`
* The last variable is `df_mean` and it has the required data in the 5th part of the project (i.e., mean of `data` values groupued by `y` and `subject`).
