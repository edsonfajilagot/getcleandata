library(dplyr)

# Function to read data set
read_dataset <- function(dtype="test", dataColNames, activityLabels){
  dataFile <- gsub("<dtype>", dtype, "./UCIHARDataset/<dtype>/X_<dtype>.txt")
  dataLabel <- gsub("<dtype>", dtype, "./UCIHARDataset/<dtype>/y_<dtype>.txt")
  dataSubject <- gsub("<dtype>", dtype, "./UCIHARDataset/<dtype>/subject_<dtype>.txt")  
  
  # Read data
  data <- read.table(dataFile)
  # Set columnnames
  colnames(data) <- dataColNames
  # Remove columns other than mean and std measures
  data <- data[grepl("mean|std", colnames(data))] 
  data <- data[!grepl("meanFreq", colnames(data))] 
  
  # Read activity labels
  activity <- read.table(dataLabel)
  colnames(activity) <- c("activity")
  
  # Read subject
  subject <- read.table(dataSubject)
  colnames(subject) <- c("subject")
  
  # Merge activity, data, subject
  data <- cbind(activity, subject, data)
  
  # Use descriptive activity names
  data[["activity"]] <- activityLabels[match(data[["activity"]], activityLabels[["activity"]]), "activity_label"]
  
  data
  
  }



# Get data column names of the measures
features <- read.table("./UCIHARDataset/features.txt")
dataColNames <- features[2]$V2

# Get activity labels
activityLabels <- read.table("./UCIHARDataset/activity_labels.txt")
colnames(activityLabels) <- c("activity", "activity_label")

# Read test data
testData <- read_dataset('test', dataColNames, activityLabels)

# Read training data
trainData <- read_dataset('train', dataColNames, activityLabels)

# Combine test and training data
completeData <- rbind(testData, trainData)

# Convert to data table format
completeData <- tbl_df(completeData)

# Get measure average per activity and per subject
measureAverages <- completeData %>%
  group_by(activity, subject) %>%
  summarize_at(vars(-activity, -subject), funs(mean(., na.rm=TRUE)))   

# Write result
write.table(measureAverages, file="./UCIHARDataset/result.txt", row.names = FALSE)
