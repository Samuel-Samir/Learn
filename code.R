#this function to read the file and count the number of yes or no and change the ? to the decision
convertQuestionsValues <- function ()
{
  data         <- read.csv(file="C:\\Users\\samuel\\Desktop\\xxx.txt")
  numOfColumns <- ncol(data)
  numOfRows    <- nrow(data)
  for(i in 2:numOfColumns)
  {
  
    numOfNo  <- 0
    numOfYes <- 0
    for(j in numOfRows)
    {
      if (data[j,i] == 'y')
      {
        numOfYes <- numOfYes + 1
      }
      else if (data[j,i] == 'n')
      {
        numOfNo <- numOfNo + 1
      }
      
    }
    
    if (numOfYes >= numOfNo)
    {
      data <- changeValues (data ,'y' ,i)
    }
    else {
      data <- changeValues (data ,'n',i)
      
    }
    
  }
  
  return(data)
}

#this function to convert the ? to the new decision value
changeValues <- function(data ,decision ,columnNum)
{
  numOfRows <- nrow(data)
  for (x in 1:numOfRows)
  {
    if (data[x,columnNum]=='?')
    {
         data[x,columnNum] <- decision
    }
  }

  return(data)
}

#code sequence start from here
data <- convertQuestionsValues()
