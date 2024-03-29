#"
#" file: app.R
#" loc: /efs/Shiny/ais-ships/app/
#" date: 7.30.21
#"
#"
#--------------------------/


suppressMessages({
  # UI
  library(shiny)
  library(shiny.semantic)
  library(shinyjs)
  library(shinydisconnect)

  # Data Process
  library(dplyr)
  library(ids)
  library(stringr)

  # Html widgets
  library(leaflet)
  library(leaflet.extras)

  # Advanced
  library(V8)
  library(sass)
  library(reactR)
  library(logger)
  library(config)

})


consts <- config::get(file = "constants/constants.yml")



base_la <- consts$values$base_lat 
base_lo <- consts$values$base_lon
base_z <- consts$values$base_zoom 


source("modules/mod_mainmap.R")

source("modules/mod_sel_type.R")

source("modules/mod_sel_vessel.R")

source("modules/mod_call_react.R")

source("functions.R", local = T)


root_app <- paste0(getwd(), "/")
pripas("current root_app = ", root_app)


loc0 <- "data/ships_clean.rds"
ships <- readRDS(loc0)

# glimpse(ships)



#" Pre-Processed Sass and React code
#--------------------------/

#" Move to server.R in testing for live code editing
###
react_raw <- readLines("ships_react.html") %>%
  rem_comments(.) %>%
  rem_empty_lines(.) %>%
  paste(., collapse = " ")

react1 <- babel_to_js(react_raw)

css0 <- process_scss("ships.scss")
###



pkgs_used <- c(
  "shiny",
  "shiny.semantic",
  "shinyjs",
  "shinydisconnect",
  "dplyr",
  "ids",
  "stringr",
  "leaflet",
  "leaflet.extras",
  "V8",
  "sass",
  "reactR"
)
