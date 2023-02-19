
print(getwd())
setwd("Downloads")
print(getwd())
library(syuzhet)
library(ggplot2)
library(tm)
library(wordcloud)
texts=readLines(file.choose()) #Read Text Lines from a Connection
print(texts)

#R offers the get_nrc_sentiment() function via the Tidy or Syuzhet packages for...
#analysis of emotion words expressed in text.
sentiment=get_nrc_sentiment(texts)
print(sentiment)

#cbind() combines vectors as columns
#To create a dataframe from vectors, use the data.frame()
text=cbind(texts,sentiment)

#Form Row and Column Sums and Means
TotalSentiment=data.frame(colSums(text[,c(2:11)]))
TotalSentiment

#names() function in R Language is used to get or set the name of... 
# an Object. This function takes object i.e. vector, matrix or data...
# frame as argument along with the value that is to be assigned as ...
#name to the object.
names(TotalSentiment)="count"
TotalSentiment
names(TotalSentiment)="count"

#Naming Rows and Columns of a Matrix
TotalSentiment=cbind("sentiment"=rownames(TotalSentiment), TotalSentiment)
rownames(TotalSentiment)=NULL
ggplot(data=TotalSentiment,aes(x=sentiment,y=count))+geom_bar(aes(fill=sentiment),stat ="identity")
+theme(legend.position="none")+xlab("sentiment")+ylab("Total Count")+ggtitle("Total Sentimental Score")