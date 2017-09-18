library(shiny)
shinyUI(fluidPage(
  titlePanel("Criando minha Nuvem de Palavras"),
  sidebarLayout(
    sidebarPanel(
            fileInput("file1", "Arquivo Excel", multiple = FALSE),
            actionButton("update", "Reorganizar"),
            tags$div(class="header", checked=NA,
                     tags$br(),tags$br(),tags$br(),
                     tags$p("Delermando Branquinho Filho"),
                     tags$img(src = "http://www.thescientist.com.br/images/logo2t.gif", 
                              width = "130px", height = "100px"))
            ),
    
    # Show a plot of the generated distribution
    mainPanel(
            tableOutput("distTable"),
            plotOutput("distPlot"),
            fluidPage(
               titlePanel("Instruções"),
               tags$div(class="header", checked=NA,
                        tags$p("1. Crie um arquivo no Excel com até 300 palavras."),
                        tags$p("2. Na primeira coluna digite as palavras"),
                        tags$p("3. Na segunda coluna você pode inserir valores para dizer o tamanho das palavras"),
                        tags$p("4. Salve em uma pasta e faça o upload aqui."),
                        tags$a(href="http://www.delermando.com.br/portfolio", "The Scientist")
               )
       )
       
    )
  )
))


