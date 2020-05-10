### Week 4 assignment for "Getting and cleaning data" course
#

All data reading and processing done with a sigle script *run_analysis.R*.

Data are expected to be in the woking directory, as extracted from *getdata_projectfiles_UCI HAR Dataset.zip*.

The **first part** of the script deals with information which is common
for both groups of data: features annotation and activity codes.
Features representing means and standard deviations of mesurements
are selected using pattern search in list of features.

The **second part** is reading and combining datasets. 
As both data folders has similar content, datasets are processed in loop.
In each iteration following steps are done:

1. List files in corresponding directory. Required files (subject..., X_..., y_...)
are selected with corresponding pattern search.

2. Select and read file with subject numeration as a vector

3. Select and read activities from "y_... .txt" as a vector, then tranform to factor
using activity annotations as levels

4. Select and read feature data frim "X_... .txt" as a data frame

5. Subset data with selected features and merge by columns with subject and activity

6. Check if tidy dataset already exist (i.e. if current iteration is not the first). If not, data from step 5 is assigned to be tidy dataset. Otherwise, data is merged with existing tidy data frame by rows.

After the loop all variables in resulting dataset are annotated using data the **first part**.

The **part three** uses `tapply()` function, nested in `sapply()` over variables of
tudy dataset to calculate means by activities and subjects for each feature.



