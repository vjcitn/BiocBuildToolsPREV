    basic = RSQLite::dbReadTable(con, "basic")

    ui = fluidPage(
      sidebarLayout(
       sidebarPanel( 
        helpText("BiocBuildTools browse_checks"),
        selectInput("pkchoice", "Select a package", choices=sort(basic$package), selected=sort(basic$package)[1]),
        actionButton("stopBtn", "Stop app."),
        width=3
         ),
        mainPanel(tabsetPanel(
         tabPanel("description", verbatimTextOutput("desc")),
         tabPanel("error", verbatimTextOutput("error")),
         tabPanel("warnings", verbatimTextOutput("warn")),
         tabPanel("notes", verbatimTextOutput("notes")),
         tabPanel("bcerror", verbatimTextOutput("bcerror")),
         tabPanel("bcwarn", verbatimTextOutput("bcwarn")),
         tabPanel("bcnotes", verbatimTextOutput("bcnotes")),
         tabPanel("testcov", DT::dataTableOutput("testcov")),
         tabPanel("about", uiOutput("about"))
         )
        )
       )
      )
