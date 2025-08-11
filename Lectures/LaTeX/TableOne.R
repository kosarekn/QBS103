# QBS 103: Data Analytics II
# In Class Solutions
# Function to Create a Table One


#' Function to define build Table One
#'
#' @param data Data frame
#' @param varList Ordered list of all variable names for the final table
#' @param nonnormVars List of variables from varList that you want median [IQR]
#' @param catVars List of variables from varList that you want n (%)
#'
buildTableOne <- function(data,varList,nonnormVars = '',catVars = '') {
  
  # Define an empty table
  table1 <- matrix(nrow = 0,ncol = 2)
  # Keep track of rows to indent
  indentRows <- c()
  
  # Loop through all variables
  for (var in varList) {
    
    # Define vector of variable values
    x <- data[,var]
    
    # Identify if non-normal
    if (var %in% nonnormVars) {
      
      # Calculate individual values
      myMedian <- round(median(x))
      myIQR1 <- round(quantile(x,1/4),digits = 2)
      myIQR2 <- round(quantile(x,3/4),digits = 2)
      # Combine values
      value <- paste0(myMedian,' [',myIQR1,', ',myIQR2,']')
      
      # Define new row
      newRow <- c(paste0(var,' Median [IQR]'),value)
      
      # Add row to data frame
      table1 <- rbind(table1,newRow)
      
    }
    
    # Identify if categorical
    if (var %in% catVars) {
      
      # Define new row for overall variable
      newRow <- c(paste0(var,' n (%)'),'')
      # Add row to data frame
      table1 <- rbind(table1,newRow)
      
      # Loop through levels of variable
      for (level in levels(x)) {
        # Calculate n and perc
        n <- sum(x == level)
        perc <- round(n/(length(x)) * 100,digits = 2)
        
        # Combine values
        value <- paste0(n,' (',perc,')')
        
        # Define new row
        newRow <- c(level,value)
        # Add row to data frame
        table1 <- rbind(table1,newRow)
        # Add index to indented rows
        indentRows <- c(indentRows,nrow(table1))
        
        
      }
    }
    
    # Otherwise treat as normally distributed
    if (!(var %in% c(nonnormVars,catVars))) {
      
      # Calculate individual values
      myMean <- round(mean(x),2)
      mySD <- round(sd(x),2)
      # Combine values
      value <- paste0(myMean,' (',mySD,')')
      
      # Define new row
      newRow <- c(paste0(var,' Mean (sd)'),value)
      
      # Add row to data frame
      table1 <- rbind(table1,newRow)
      
    }
  }
  
  # Define sample size for heading
  sampleSize <- paste("n =",nrow(data))
  
  # Print formatted table
  kable(x = table1, caption = 'Summary Statistics',format = 'latex',booktabs = T,
        col.names = c("Variable",sampleSize),
        align = c('l','r'),escape = T,row.names = F) %>%
    add_indent(positions = indentRows) %>%
    kable_classic()
    
}