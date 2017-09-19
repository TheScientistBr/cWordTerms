
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
                myDataset <- myTable()
                colnames(myDataset) <- c("Palavra","Valor")
                if(input$auto){
                        myDataset$Valor <- nrow(myDataset):1
                }
                return(head(myDataset))
        })
        
        output$distPlot <- renderPlot({
                myDataset <- myTable()
                colnames(myDataset) <- c("Palavra","Valor")
                if(input$auto){
                        myDataset$Valor <- nrow(myDataset):1
                }
                atualiza <- input$update
                wordcloud(myDataset$Palavra,myDataset$Valor, scale=c(3,.1),min.freq=1,
                                 max.words=nrow(myDataset), random.order=FALSE, rot.per=.35,
                                 colors=brewer.pal(8,"Dark2"))
        })
})


