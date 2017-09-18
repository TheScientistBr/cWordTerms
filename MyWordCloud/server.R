
library("shiny")
library("wordcloud")
library("xlsx")

shinyServer(function(input, output, session) {
        myTable  <- reactive({
                req(input$file1)
                myWords <- read.xlsx(input$file1$datapath,sheetIndex = 1,header = FALSE,
                                     encoding = "UTF-8",stringsAsFactors = FALSE)
        })
                
        output$distTable <- renderTable({
                myWords <- myTable()
                colnames(myWords) <- c("Palavra","Valor")
                return(head(myWords))
        })
        
        output$distPlot <- renderPlot({
                myWords <- myTable()
                colnames(myWords) <- c("Palavra","Valor")
                atualiza <- input$update
                wordcloud(myWords$Palavra,myWords$Valor, scale=c(3,.1),min.freq=1,
                                 max.words=nrow(myWords), random.order=FALSE, rot.per=.35,
                                 colors=brewer.pal(8,"Dark2"))
        })
})


