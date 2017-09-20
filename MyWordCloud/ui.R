library("shiny")
library("wordcloud2")

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
            checkboxInput("nAuto", "Tamanho automático das palavras", FALSE),
            sliderInput("rota", label = h4("Rotação"), min = 1, 
                        max = 8, value = 2:6),
            sliderInput("giro", label = h4("Giro"), min = .1, 
                        max = 1, value = 1, step = 0.1),
            radioButtons("forma", "Forma da Nuvem",
                         choices = list("circle" = "circle",
                                        "cardioid" = "cardioid",
                                        "diamond" = "diamond",
                                        "triangle-forward" = "triangle-forward",
                                        "triangle" = "triangle",
                                        "pentagon" = "pentagon",
                                        "star" = "star"),
                         selected = "circle"),                           
            radioButtons("cFundo", "Cor de Fundo",
                         choices = list("Branca" = "white",
                                        "Cinza" = "grey",
                                        "Rosa" = "pink",
                                        "Preta" = "black"),
                         selected = "white"),
            actionButton("update", "Reorganizar")
            ),
    
    # Show a plot of the generated distribution
    mainPanel(
            tableOutput("distTable"),
            wordcloud2Output("wordcloud2"),
            fluidPage(
               titlePanel("Instruções"),
               tags$div(class="header", checked=NA,
                        tags$p("1. Crie um arquivo no Excel, quanto mais palavras melhor"),
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


