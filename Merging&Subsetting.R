# Challenge 1: Add more Observation
# Add more observation in Structure data
install.packages("readxl")
library(readxl)
house = read_excel("AddObservations.xls", sheet = 1)
house_extra = read_excel("AddObservations.xls", sheet = 2)
MergeData = merge(house, house_extra, all = TRUE, sort = FALSE)
str(MergeData)
# Add the new house "Redwyne" which is present "The Reach" region to house data
MergeData1 = rbind(house, data.frame(House = c("Redwyne"), Region = c("The Reach")))
str(MergeData1)
# Read house_new data which include one more variable Religion
house_new = read_excel("AddObservations.xls", sheet = 4)
# Combine house and house_new data
MergeData2 = merge(house, house_new, all = TRUE, sort = FALSE)
# Challenge 2: Dropping Observation
candidate = read_excel("DropObservations.xls")
# Remove of top 2 rows of the candidates data frame
candidate1 = candidate[-c(1:2),]
# Remove Robb Stark from data set
candidate2 = candidate[-c(2),]
candidate2 = candidate[which(candidate$Name! = "Robb Stark"),]
# Challange 3: Adding columns Horizontally
house1 = read_excel("AddColumn1.xls", sheet = 1)
military = read_excel("AddColumn1.xls", sheet = 2)
# Add military data set to house1 data set
house1 = cbind(house1, military)
# Challenge 4: Add Columns based on common attribute
house = read_excel("AddColumn2.xls", sheet = 1)
candidates = read_excel("AddColumn2.xls", sheet = 2)
# Left joint data
house1 = merge(house, candidates, by = 'House', all.x = T, sort = F)
# Right join data
house2 = merge(house, candidates, by = 'House', all.y = T, sort = F)
# Inner join
house3 = merge(house, candidates, by = 'House', all = F, sort = F)
# Full join
house4 = merge(house, candidates, by = 'House', all = T, sort = F)
# Challange 5: Add Columns based on observation series
candidates = read_excel("AddColumn3.xls", sheet = 1)
house = read_excel("AddColumn3.xls", sheet = 2)
# Left join
house = merge(candidates, house, sort = F, all.x = T)
# Challange 6: Removing duplicate observation
house = read_excel("RmObservations.xls", sheet = 1)
candidates = read_excel("RmObservations.xls", sheet = 2)
heir = merge(house, candidates, by = 'House', all.x = T, sort = F)
# Removing duplicate
candidates = candidates[!duplicated(candidates[,1]),]
heir = merge(house, candidates, by = "House", all.x = T, sort =F )
# Challange 7: Drop Column
MergeData = read_excel("DropColumn.xls")
# Dropping region_right variable
MergeData1 = subset(MergeData, select = -c(Region_right))
MergeData2 = MergeData[,-c(4)]
# Challange 8: Modifying value
Merged = read_excel("modifying.xls")
Merged$Region_left[which(Merged$Name == "Arya Stark")] = "North"
# Challenge 9 : Rename Column
Merged = read_excel("Rename.xls")
colnames(Merged)[which(names(Merged) == "Rigion_left")] = "Region"
