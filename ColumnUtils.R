###############################################################################
#
# Columnar utilities
#
###############################################################################

#Column name change
changeColumnName <- function(dataFrame, oldColName, newColName){
	colnames(dataFrame)[which(names(dataFrame) == oldColName)] <- newColName
}
