app <- ShinyDriver$new("../../")
app$snapshotInit("mytest")

app$snapshot()
app$setInputs(`vessel-vessel_selected` = "Pola Murom")
app$setInputs(`type-vessel_type` = "Unspecified")
app$setInputs(search_button = "click")
app$setInputs(`vessel-vessel_selected` = "Sound Castor")
app$setInputs(`vessel-vessel_selected` = "Frog Cygnus")
app$setInputs(`type-vessel_type` = "Passenger")
