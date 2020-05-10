# Part 1 --------------
                                                # Clear previous results
if (exists("tidy.data")) remove(tidy.data)      
                                                # Specify data directory
data.path <- "./UCI HAR Dataset"
                                                # Reading variables metadata
features <- read.table(paste(data.path, "features.txt", sep="/"),
                       header=FALSE, as.is=TRUE)
act.code <- read.table(paste(data.path, "activity_labels.txt", sep="/"), 
                    header=FALSE, as.is=TRUE)
                                                
                                                # Selecting required features:
                                                # means and stadard deviations
select <- grepl("mean()", features[,2], fixed=TRUE) | 
          grepl("std()", features[,2], fixed=TRUE)

# Part 2 -------------
                                                # Reading data files by group
                                                # and creating tidy dataset
for (group in list.dirs(data.path, recursive=FALSE))
{
        files <- list.files(group)
        subjects <- read.table(paste(group, grep("subject", files, value=TRUE), 
                                     sep="/"))[[1]]
        activity <- read.table(paste(group, grep("y_", files, value=TRUE), 
                                     sep="/"))[[1]]
        activity <- as.factor(activity) ; levels(activity) <- act.code[,2]
        
        data <- read.table(paste(group, grep("X_", files, value=TRUE), 
                                 sep="/"))
        data <- data[,select]
        data <- cbind(subjects, activity, data)
        if (! exists("tidy.data")) tidy.data <- data
        else tidy.data <- rbind(tidy.data, data)
        remove(files, subjects, activity, data)
} ; remove(group)
                                                # Giving names to variables
colnames(tidy.data)[-c(1,2)] <- features[select,2]

# Part 3 -------------
                                                # Creating dataset with mean data
                                                # by activity and subject
tidy.data.2 <- sapply(tidy.data[,-c(1,2)], function(x) 
        with(tidy.data, 
             c(tapply(x, activity, mean), tapply(x, subjects, mean)))
)
write.table(tidy.data.2, "tidy_data_output.txt", sep="\t",
            row.name=FALSE, quote=FALSE)







