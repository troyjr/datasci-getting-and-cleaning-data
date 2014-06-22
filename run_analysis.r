library(plyr)
library(reshape2)

# this function does the reading in, joining and lookups
read_dataset<- function(dir,name, features,labels)
{
        
        print(paste("loading", dir, name, "dataset", sep=" "))
        filename=paste("X_", name, ".txt", sep="")
        # read in as table
        dataset<-read.table(paste(dir,name, filename, sep="\\"))
        
        # set column names
        names(dataset) <- features$V2
        
        print(paste("loading", dir, name, "dataset subjects", sep=" "))
        filename=paste("subject_", name, ".txt", sep="")
        
        # read in as table
        subjects<-read.table(paste(dir,name, filename, sep="\\"))
        names(subjects) <- "Subject"
        
        # add subjects to data frame
        dataset<-cbind(dataset, subjects)
        
        print(paste("loading", dir, name, "dataset activities", sep=" "))
        filename=paste("y_", name, ".txt", sep="")
        
        # read in as table
        activities<-read.table(paste(dir,name, filename, sep="\\"))
        names(activities) <- "ActivityNumber"
        
        # add subjects to data frame
        dataset<-cbind(dataset, activities)
        
        # relabel labels to meaningful names
        names(labels)<-c("ActivityNumber", "Activity")
        
        # join labels
        dataset<-join(dataset, labels, by="ActivityNumber")
        
        return(dataset)
        
}

# filter dataset to include specic fields
filter_dataset<-function(dataset)
{
        # filter out anything but standard deviation and mean values
        filter<-integer()
        # columns like "tBodyAccMag-std()"
        filter<-append(filter, grep("-std\\(\\)$", colnames(dataset)))
               
        #columns like 'tBodyAccJerkMag-mean()"
        filter<-append(filter, grep("-mean\\(\\)$", colnames(dataset)))
               
        #columns like "tBodyAcc-std()-X"
        filter<-append(filter, grep("-std\\(\\)-.*$", colnames(dataset)))
               
        #columns like "fBodyAcc-mean()-X"
        filter<-append(filter, grep("-mean\\(\\)-.*$", colnames(dataset)))
        
        #need subject and activity!
        filter<-append(filter, grep("^Subject$|^Activity$", colnames(dataset)))
        
                
        return(dataset[filter])
}

# renames columns to meaningful names 
rename_columns<-function(dataset)
{
        return
        # new colnames
        newcolnames <- character()
        for (colname in colnames(dataset)) {
                # take care of first part..
                colname<-gsub("^tBody", "Time.Body.", colname)
                colname<-gsub("^tGravity", "Time.Gravity.", colname)
                colname<-gsub("^fBody", "FFT.Body.", colname)
                
                # now accleration, magnitude, jerk and gyroscope
                colname<-gsub("Acc([A-Z-])", "Acceleration.\\1", colname)
                colname<-gsub("Mag([A-Z-])", "Magnitude.\\1", colname)
                colname<-gsub("Jerk([A-Z-])", "Jerk.\\1", colname)
                colname<-gsub("Gyro([A-Z-])", "Gyroscope.\\1", colname)
                colname<-gsub("Body([A-Z-])", "Body.\\1", colname)
                
                # now functions
                colname<-gsub("-std\\(\\)", "STDDEV", colname)
                colname<-gsub("-mean\\(\\)", "MEAN", colname)
                
                # now the -X,-Y,-Z
                
                colname<-gsub("-([XYZ])$", ".\\1", colname)
                
                
                newcolnames<-append(newcolnames, colname)
                
        }
        names(dataset) <-newcolnames
        return(dataset)        
        
}


run_analysis<- function (dir="UCI HAR Dataset", mean=FALSE) {
        
        # location of training and test datasets to merge
        features_file <- "features.txt"
        activity_labels_file <- "activity_labels.txt"
        
        # multiple data sets can be included here
        dataset_list=c("test", "train")
        
        # load in features
        print(paste("loading",features_file, sep=" "))
        features=read.table(paste(dir,features_file, sep="\\"))
        
        # load in activity labels
        print(paste("loading", activity_labels_file, sep=" "))
        activity_labels=read.table(paste(dir,activity_labels_file, sep="\\"))
        
        # create a list of the datasets
        datasets=list()
        for(datasetname in dataset_list) {
                # read in each data set
                df<-read_dataset(dir,datasetname,features,activity_labels)
                df<-filter_dataset(df)
                df<-rename_columns(df)
                
                # add to larger datasets
                datasets[[datasetname]] <- df
                
                
        }
        
        # now merge all datasets into one
        
        finaldataset<-do.call("rbind", datasets)
        rownames(finaldataset) <- NULL
        
        # finally sort column names
        finaldataset<-finaldataset[,order(names(finaldataset))]
        
        # if mean is set to true, return mean by subject and activites
        if(mean) {
                ddply(melt(finaldataset, id.vars=c("Subject", "Activity")), .(Subject, Activity), summarise, MeanSamples=mean(value))
        } else {
                return(finaldataset)
        }
}

