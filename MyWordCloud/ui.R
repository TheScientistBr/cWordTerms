library(shiny)
shinyUI(fluidPage(
  titlePanel("Criando minha Nuvem de Palavras"),
  sidebarLayout(
    sidebarPanel(
            tags$div(class="header", checked=NA,
                     tags$img(src = "http://www.thescientist.com.br/images/logo2t.gif", 
                              width = "130px", height = "100px")),
            tags$p("Delermando Branquinho Filho"),
            tags$hr(),
            fileInput("file1", "Arquivo Excel", multiple = FALSE),
            checkboxInput('auto', 'Tamanho automático', FALSE),
            sliderInput("cores", label = h4("Cores"), min = 1, 
                        max = 8, value = 5),
            actionButton("update", "Reorganizar")
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
                        tags$p("5. Clique em atualizar para mudar a nuvem"),
                        tags$p("6. Clique com o botão direito do mouse >> salvar imagem como"),
                        tags$a(href="http://www.delermando.com.br/portfolio", "The Scientist")
               )
       )
       
    )
  )
))


