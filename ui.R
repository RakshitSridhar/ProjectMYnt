#UI function
library(shiny)
ui <- fluidPage(
    titlePanel(title = div(img(src = "Marvel.jpg")), windowTitle = 'Marvel'),
    sidebarLayout(
        sidebarPanel(
            
            h1("Marvel Connections"),
            br(), br(),
            p("This application utilizes Marvel APIs to pull information about various characters
               in the Marvel Universe. You can select various comic characters from the dropdown below.
               In case a description of the character is available, the same will be displayed along with it's image."),
            selectInput(
                inputId = 'char_name',
                label = 'Select Character',
                choices = unique(nodes$id[nodes$Type == 'Character']),
                multiple = FALSE,
                selected = 'Rocket Raccoon'
            ),
            br(),
            imageOutput('char_image', height = '250px'),
            h4(textOutput('char_description',inline = TRUE)),
            hr(),
            p('The application also allows you to see how the character is connected to other characters
              by drawing a network graph between characters and the comics that they appear in. Currently the
              data is limited to the last 5 years only.'),
            br(), 
            
            tags$div(HTML("<a href=\"http://marvel.com\">Data provided by Marvel. © 2019 MARVEL</a>")),
            width = 3
        ),
        mainPanel(
            # h2('Know Your Hero'),
            # div(style="display: inline-block;vertical-align:top; width: 300px;",
            # imageOutput('char_image', height = '250px')),
            # #Add  a gap between them
            # div(style="display: inline-block;vertical-align:top; width: 10px;",HTML("<br>")),
            # div(style="display: inline-block;vertical-align:top; width: 500px;",h3(textOutput('char_description',inline = TRUE))),
            
            visNetworkOutput('network',height = '900px',width = '100%')
        )
    )
)