#'
#' file: ui.R
#' loc: /efs/Shiny/ais-ships/app/
#' date: 7.30.21
#' 
#'
#--------------------------/


ui <- semanticPage(
  theme = 'paper',
  margin = "0px",
  suppress_bootstrap = TRUE,
  
  ## React libraries
  # tags$script(src=react_loc0),
  # tags$script(src=react_loc1),
  ###
  html_dependency_react(),
  ###
 
  mod_react_ui('react'),
  
  tags$style(css0),
  
  disconnectMessage(
    text = paste0("Your AIS-ships session has ended, please reload"),
    refresh = "Reload Now",
    background = "#323232",
    colour = "white",
    overlayColour = "grey",
    overlayOpacity = 0.3,
    refreshColour = "white",
    size = 28,
    width = "full",
    top = "center"
  ),
  
  
  div(
    id = 'main_div',
    class='ships',
    
    div(
      id='loading_div',
      class='ships_loading',
      
      div(
        id='init_spinner',
        
        div(icon("massive red sun loading"))
        
      )
      
    ),
    
    div(
      class='ships_title',

      h3('AIS Shipping Data'),
      
      span('Built by Ian E Moore')
      
    ),
    
    div(
      class='ships_stats',
      
      cards(
        class = "two",
        card(
          div(class="content",
            
            div(class="header", "Vessel Type"),
            
            div(
              class="description",
              
              mod_sel_type_ui('type')
              
            )
              
          )
          
        ),
        card(
          div(
            class="content",
              
            div(class="header", 
                
              span("Vessel Name")
                
            ),
            
            div(
              class="description",
             
              mod_sel_vessel_ui('vessel')
              
            )
            
          )
          
        )
        
      )
      
    ),

    div(
      class='ships_map',
        
      mod_mainmap_ui('map'),

      sem_animBtn(
        'search_button',
        icon('search'),
        icon('search plus'),
        'vertical',
        'fade basic black')
    ),
    
    
    div(id='ships_map_react'),
    
    div(id='shiny-react-portal'),
    
    uiOutput("modalInfo"),
    
    uiOutput("modalSearch"),
    
    div(
      id = "info-button",
      icon('fa-info-circle')
    )
    
  )
  
)













































