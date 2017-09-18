library("wordcloud")
library("xlsx")
myWords <- read.xlsx("mywords.xlsx",sheetIndex = 1,header = FALSE,
                     encoding = "UTF-8",stringsAsFactors = FALSE)
colnames(myWords) <- c("word","mean")
myWords$mean <- length(myWords$word):1
wordcloud(myWords$word,myWords$mean, scale=c(3,.1),min.freq=0.001,
          max.words=50, random.order=FALSE, rot.per=.5,
          colors=brewer.pal(8,"Dark2"))

