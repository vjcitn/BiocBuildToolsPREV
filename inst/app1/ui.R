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
         tabPanel("Rerr", verbatimTextOutput("error")),
         tabPanel("Rwarn", verbatimTextOutput("warn")),
         tabPanel("Rnote", verbatimTextOutput("notes")),
         tabPanel("BCerr", verbatimTextOutput("bcerror")),
         tabPanel("BCwarn", verbatimTextOutput("bcwarn")),
         tabPanel("BCnote", verbatimTextOutput("bcnotes")),
         tabPanel("covg", DT::dataTableOutput("testcov")),
         tabPanel("pnet", visNetwork::visNetworkOutput("pnet")),
         tabPanel("depwdg", DT::dataTableOutput("depwidg")),
         tabPanel("about", uiOutput("about"))
         )
        )
       )
      )
