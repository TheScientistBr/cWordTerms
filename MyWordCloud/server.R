
library("shiny")
library("wordcloud2")
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
                auto <- input$auto
                if(auto) {
                        myDataset$Valor <- nrow(myDataset):1
                }
                head(myDataset)
        })
        
        output$wordcloud2 <- renderWordcloud2({
                myDataset <- myTable()
                colnames(myDataset) <- c("Palavra","Valor")
                atualiza <- input$update
                giro <- input$giro
                rota <- input$rota
                giro <- input$giro
                cFundo <- input$cFundo
                forma <- input$forma
                auto <- input$auto
                if(auto) {
                        myDataset$Valor <- nrow(myDataset):1
                }
                wordcloud2(myDataset,backgroundColor = cFundo, 
                           minRotation = -pi/rota[1], maxRotation = -pi/rota[2],
                           rotateRatio = giro,
                           shape = forma, size = 0.5,
                           color = "random-light")
        })
})


