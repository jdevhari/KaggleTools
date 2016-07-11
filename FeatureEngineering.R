###############################################################################
#
# Feature Engineering uttilities
#
###############################################################################

generateFeature <- function(dataFrame, colName, colNameTitle){
	for (newcol in unique(colName)) {
		feature_name <- colNameTitle
		dataFrame[,paste0(feature_name,"_",newcol)] <- ifelse(dataFrame[,feature_name]==newcol,1,0)
	}
}

Binarize_Features <- function(data_set, features_to_ignore=c(), leave_out_one_leve
l=FALSE) {
text_features <- c(names(data_set[sapply(data_set, is.character)]), names(dat
a_set[sapply(data_set, is.factor)]))
for (feature_name in setdiff(text_features, features_to_ignore)) {
feature_vector <- as.character(data_set[,feature_name])
# check that data has more than one level
if (length(unique(feature_vector)) == 1)
next
# We set any non-data to text
feature_vector[is.na(feature_vector)] <- 'NA'
feature_vector[is.infinite(feature_vector)] <- 'INF'
feature_vector[is.nan(feature_vector)] <- 'NAN'
# loop through each level of a feature and create a new column
first_level=TRUE
for (newcol in unique(feature_vector)) {
if (first_level && leave_out_one_level) {
# avoid dummy trap and skip first level
first_level=FALSE
} else {
data_set[,paste0(feature_name,"_",newcol)] <- ifelse(feature_v
ector==newcol,1,0)
}
}
# remove original feature
data_set <- data_set[,setdiff(names(data_set),feature_name)]
}
return (data_set)
}

