
library("shiny")
library("wordcloud2")
library("xlsx")
library("shinyjs")

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
                head(myDataset)
        })

        output$distPlot <- renderWordcloud2({
                myDataset <- myTable()
                colnames(myDataset) <- c("Palavra","Valor")
                if(input$auto){
                        myDataset$Valor <- nrow(myDataset):1
                }
                atualiza <- input$update
                giro <- input$giro
                rota <- input$rota
                giro <- input$giro
                cFundo <- input$cFundo
                forma <- input$forma
                wordcloud2(myDataset,backgroundColor = cFundo, 
                           minRotation = -pi/rota, maxRotation = pi/rota,
                           rotateRatio = giro,
                           shape = forma, size = 0.5,
                           color = "random-light")
                #wordcloud(myDataset$Palavra,myDataset$Valor, scale=c(3,.1),min.freq=1,
                #                max.words=nrow(myDataset), random.order=FALSE, rot.per=.35,
                #               colors=brewer.pal(cores,"Dark2"),minRotation = pi/giro)
        })
})


