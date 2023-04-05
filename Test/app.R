
# Load libraries
library("shiny")
library("shinydashboard")
library("shinythemes")
library("tidyverse")
library("gridExtra")
library("ggplot2")
library("scales")
library("hrbrthemes")
library("DT")  
library("shinydashboardPlus")
library("hrbrthemes")


load("MentalHealth_Data_RahulSujith.RData")
df <- data.frame(MentalHealth_Data_RahulSujith)

ui <- dashboardPage(
  dashboardHeader(title = "Mental Health In Workplace",
                  titleWidth = 350,
                  tags$li(
                    class = "dropdown",
                    tags$a(href = "https://www.linkedin.com/in/rahul-sujith/",
                           target = "_blank",
                           style = "margin-top: 10px; margin-right: 15px;",
                           tags$i(class = "fab fa-linkedin", style = "font-size: 24px; color: #0077B5;")
                    )
                  ),
                  tags$li(
                    class = "dropdown",
                    style = "margin-top: 18px; text-align: center;",
                    tags$i(class = "fas fa-user-circle", style = "font-size: 25px; margin-right:10px; color: white;"),
                    tags$span("Rahul Sujith", style = "color: white; padding-right:15px;")
                  )
  )
  ,
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      tags$hr(style = "border-color: #fff;"), # Add space
      menuItem("Visualizations", tabName = "visualizations", icon = icon("bar-chart")),
      tags$hr(style = "border-color: #fff;"), # Add space
      menuItem("Conclusions", tabName = "conclusions", icon = icon("file-text")),
      tags$hr(style = "border-color: #fff;"), # Add space
      menuItem("Data", tabName = "data", icon = icon("table")), # New Data tab
      tags$hr(style = "border-color: #fff;") # Add space after Data tab
    )
  ),
  dashboardBody(
    tags$head(
      tags$style(HTML("
        /* General dashboard background */
        body {
          background-color: white;
        }
        
        /* Box backgrounds and header styles */
        .box {
          background-color: #ffffff;
          border: 1px solid #dee2e6;
          border-radius: 5px;
        }
        
        .box .box-header {
          background-color: #343a40;
          color: #ffffff;
          border-radius: 5px 5px 0 0;
        }
        
        /* Info box styling */
        .info-box {
          background: linear-gradient(135deg, #4BC0C8 0%, #C779D0 100%);
          border-radius: 5px;
        }
        
        .info-box-icon {
          background-color: transparent;
          color: #ffffff;
          border-radius: 5px 0 0 5px;
        }
        
        .info-box-content {
          color: #ffffff;
        }
        
        /* Sidebar styling */
        .sidebar {
          background-color: #343a40;
        }
        
        .sidebar-menu {
          background-color: #343a40;
        }
        
        .treeview-menu {
          background-color: #343a40;
        }
        
        /* Other customization options */
       .skin-blue .main-header .navbar {
      background: linear-gradient(135deg, #0F2027 0%, #203A43 50%, #2C5364 100%);
    }
        
        .skin-blue .main-header .logo {
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 50%, #1e528e 100%);
    }
        
        .skin-blue .main-header .logo:hover {
          background-color: green;
        }
      "))
    ),
    tags$style(HTML("
      .info-box-text {
        white-space: normal;
        height: auto;
        font-size: 14px;
        font-weight: bold;
      }
      .info-box-number {
        font-size: 18px;
      }
    ")),
    tabItems(
      tabItem(tabName = "home",
              fluidRow(
                box(title = "Welcome to My Mental Health in Workplace Dashboard !", width = 12, status = "info", 
                    solidHeader = TRUE, collapsible = FALSE, 
                    p("This dashboard provides visualizations and insights into mental health in the tech and non tech  industry based on survey data."),
                    p("You can use the sidebar to explore the visualizations based on age, gender, country, and tech company. The 'Visualizations' tab provides visualizations based on your selections, and the 'Conclusions' tab summarizes the conclusions drawn from the visualizations. "),
                    p("The info boxes below give details of total number of employees paricipated in the survey ,Total no of countries countries analysed,Count of employees seeking help and undergoing treatment  ")
                )
              ),
              fluidRow(
                infoBoxOutput("total_employees", width = 3),
                infoBoxOutput("total_countries", width = 3),
                infoBoxOutput("seek_help", width = 3),
                infoBoxOutput("treatment", width = 3)
              ),
              fluidRow(
                box(
                  title = "Introduction to Mental Health in the Workplace", width = 12, status = "warning", 
                  solidHeader = TRUE, collapsible = FALSE,
                  height = 800,
                  HTML("<p>Mental health in the workplace is an increasingly important issue for both employees and employers. It is essential for companies to create a supportive environment that encourages open conversations about mental health and provides resources for employees who may be struggling.Promoting mental well-being and addressing mental health challenges at work can lead to increased productivity, improved employee engagement, and reduced costs associated with absenteeism and turnover.</p>
          <ol>
           <li> The data provides information on the prevalence of mental health issues in the workplace based on age, gender, and country. This can help employers and employees plan their mental health resources and estimate the potential impact of mental health issues on productivity.</li>
<li> The data provides insights into the differences in mental health issues across age groups, genders, and countries. This can help employers and employees choose mental health interventions that are tailored to the needs of specific groups.</li>
<li> The data provides information on the prevalence of mental health issues in different countries, which can help employers and employees understand the local mental health landscape and avoid stigmatizing or misinterpreting mental health issues.</li>
<li> The data can also help employers and employees negotiate for mental health resources with local vendors or stakeholders, as they will have a better understanding of the mental health needs in different age groups, genders, and countries.</li>
          </ol>
          <p>On conclusion, my analysis of this data set has shown me that mental health is a complex and multifaceted issue, and that it requires a holistic approach to address. By understanding the experiences and perspectives of employees, employers can provide better support for their mental health and well-being, and create a more inclusive and supportive workplace for all.</p>"),
tags$div(
  style="display:flex; justify-content: center",
  tags$img(
    src = "https://media.istockphoto.com/id/1387177009/fr/photo/femme-%C3%A0-la-t%C3%AAte-dune-r%C3%A9union-daffaires.jpg?s=612x612&w=0&k=20&c=j3YwMiTlf39xATXn2xr5DOdv6QmAJcetbtH1InARamU=",
    style="max-width: 50%; max-height: 400px; margin-right: 10px"
  ),
  tags$img(
    src = "https://media.istockphoto.com/id/1412834907/fr/photo/groupe-dhommes-daffaires-multiethniques-discutant-de-la-strat%C3%A9gie-financi%C3%A8re-de-l%C3%A9nergie.jpg?s=612x612&w=0&k=20&c=LyKoZ94_fDlAcXe2XbAXxxz7byg58UCqX62bn518zDI=",
    style="max-width: 50%; max-height: 400px"
  )
)

                ) 

              )


,
fluidRow(
  box(title = "My Analysis Journey", width = 12, status = "warning", 
      solidHeader = TRUE, collapsible = FALSE, 
      p("With this data, I set out on a journey to understand the complexities of mental health in the workplace, and to uncover the underlying factors that contribute to it. I discovered that mental health issues are prevalent not just in the tech industry, but across all industries, and that they can be influenced by a wide range of factors, such as family history, workplace relationships, and access to treatment.

I also found that the COVID-19 pandemic has had a significant impact on the mental health of employees, as many have struggled with isolation, stress, and uncertainty. However, despite these challenges, many employees have found the strength and support to seek help for their mental health issues, and have taken steps to improve their well-being.
")
  )
)
      ),
tabItem(tabName = "visualizations",
        fluidRow(
          column(3, tags$i(class = "fa fa-child"), selectInput("age", "Select Age Category:", choices = c("All", levels(df$Age)), selected = "All")),
          column(3, tags$i(class = "fa fa-venus-mars"), selectInput("gender", "Select Gender:", choices = c("All", as.character(unique(df$Gender))), selected = "All")),
          column(3, tags$i(class = "fa fa-globe"), selectInput("country", "Select Country:", choices = c("All", as.character(unique(df$Country))), selected = "All"))
        ),
        fluidRow(
          box(plotOutput("age_plot"), width = 6),
          box(plotOutput("gender_plot"), width = 6)
        ),
        fluidRow(
          box(plotOutput("tech_company_plot"), width = 6),
          box(plotOutput("family_history_plot"), width = 6)
        )
),
tabItem(tabName = "conclusions",
        tags$div(style="background-color:#F8F9FA; padding:10px 20px;",
                 h2("Conclusions", style="color:#0077B5; font-weight:bold;"),
                 tags$p("Based on the Analysis, the following conclusions can be drawn:", style="color:#444444; font-size:16px;"),
                 tags$p("It can be seen from the data whether the company belongs to the technical field or not, mental health is a big problem. However, from the details, it can be found that the number of companies in the technology field seeking mental health treatment is slightly lower than that without seeking mental health. But the non-technical field is the opposite. I can temporarily think that companies in the field of technology pay more attention to mental health problems.", style="color:#444444; font-size:16px;"),
                 tags$p("Based on the Gender Analysis Although the count of the male is higher than female, the number of male employees with treatment is less than male employees without treatment. However, for female, twice as many people have sought mental health care as have not, which illustrates that women's work and psychological pressure is significantly higher than men's. ", style="color:#444444; font-size:16px;"),
                 tags$p("Based on the Country Anaysis it can be seen that vthe varying work culture of each country is affecting the mental health of employees differently.", style="color:#444444; font-size:16px;"),
                 tags$p("Employees with family therapy history are significantly higher than those without a family history. This is expected, it is a fact that people with family therapy history pay more attention to mental health problems because if family members have experienced the negative pressure brought by mental health, their other family members are more aware of mental health. Even if there is some pressure they can bear, they may choose to relieve the stress through mental health treatment.", style="color:#444444; font-size:16px;"),
                 tags$p("As a Summary :", style="color:#0077B5; font-size:16px; font-weight:bold;"),
                 tags$p("1.Age: The proportion of senior people seeking psychological consultation is the most.", style="color:#444444; font-size:16px;"),
                 tags$p("2.Gender: Female employees' mental health in technology industry should be paid more attention.", style="color:#444444; font-size:16px;"),
                 tags$p("3.Family_history:  Employees with family history of mental health are more likely to seek mental health care.", style="color:#444444; font-size:16px;")
        )
)
,
tabItem(tabName = "data", # Add this new tabItem for displaying the cleaned dataset
        h2("Cleaned Dataset"),
        DTOutput("cleaned_data_table")
)
    )
  )
)



server <- function(input, output) {
  # Dataset
  df_filtered <- reactive({
    data <- df
    
    if (input$age != "All") {
      data <- data[data$Age == input$age, ]
    }
    
    if (input$gender != "All") {
      data <- data[data$Gender == input$gender, ]
    }
    
    if (input$country != "All") {
      data <- data[data$Country == input$country, ]
    }
    
    
    
    data
  })
  
  # Cleaned dataset output
  output$cleaned_data_table <- renderDT({
    datatable(df_filtered(), options = list(pageLength = 10))
  })
  
  # Age plot
  output$age_plot <- renderPlot({
    df_filtered() %>%
      count(Age) %>%
      ggplot(aes(x = Age, y = n, fill = Age)) +
      geom_bar(stat = "identity", alpha = 0.8) +
      scale_fill_brewer(palette = "Dark2") +
      theme_bw() +
      theme(
        plot.title = element_text(color = "navy", face = "bold", size = 14),
        axis.title = element_text(color = "navy", face = "bold", size = 12),
        legend.position = "none"
      ) +
      labs(title = "Employees Seeking help from different Age Group", x = "Age Group", y = "Number of People")
  })
  
  # Gender plot
  output$gender_plot <- renderPlot({
    df_filtered() %>%
      count(Gender) %>%
      ggplot(aes(x = as.character(Gender), y = n, fill = as.character(Gender))) +
      geom_bar(stat = "identity", alpha = 0.8) +
      scale_fill_brewer(palette = "Set2") +
      theme_bw() +
      theme(
        plot.title = element_text(color = "navy", face = "bold", size = 14),
        axis.title = element_text(color = "navy", face = "bold", size = 12),
        legend.position = "none"
      ) +
      labs(title = "Seeking help by Gender ", x = "Gender", y = "Number of People")
  })
  
  # Tech company plot
  output$tech_company_plot <- renderPlot({
    df_filtered() %>%
      ggplot(aes(x = tech_company, fill = (treatment))) +
      geom_bar(position = "fill", alpha = 0.8) +
      scale_fill_manual(values = c("#5DA5DA", "#FAA43A")) + # color combination
      theme_bw() +
      theme(
        plot.title = element_text(color = "navy", face = "bold", size = 14),
        axis.title = element_text(color = "navy", face = "bold", size = 12),
        legend.position = "bottom",
        legend.title = element_blank()
      ) +
      labs(title = "Treatment Ratio by tech and non tech company", x = "Tech Company", y = "Treatment Ratio")
  })
  
  # Family history plot
  output$family_history_plot <- renderPlot({
    df_filtered() %>%
      ggplot(aes(x = family_history, fill = (treatment))) +
      geom_bar(position = "fill", alpha = 0.8) +
      scale_fill_manual(values = c("#619CFF", "#F5A8A8")) + # change color combination
      theme_bw() +
      theme(
        plot.title = element_text(color = "navy", face = "bold", size = 14),
        axis.title = element_text(color = "navy", face = "bold", size = 12),
        legend.position = "bottom",
        legend.title = element_blank()
      ) +
      labs(title = "Family History of Mental Illness and Treatment Ratio", x = "Family History", y = "Treatment Ratio")
  })
  
  
  # Add these to the end of your server code
  output$total_employees <- renderInfoBox({
    infoBox(
      "Total Employees", 
      value = nrow(df),
      icon = icon("users"),
      color = "aqua"
    )
  })
  
  output$total_countries <- renderInfoBox({
    infoBox(
      "Total Countries", 
      value = length(unique(df$Country)),
      icon = icon("globe"),
      color = "yellow"
    )
  })
  
  output$seek_help <- renderInfoBox({
    infoBox(
      "Seeking Help", 
      value = sum(df$seek_help == "Yes"),
      icon = icon("question-circle"),
      color = "green"
    )
  })
  
  output$treatment <- renderInfoBox({
    infoBox(
      "Undergoing Treatment", 
      value = sum(df$treatment == "Yes"),
      icon = icon("medkit"),
      color = "red"
    )
  })
}


shinyApp(ui = ui, server = server)




