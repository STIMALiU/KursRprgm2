
# test packages used in 732G33 VT2016 in Pc-labs:

doInstall <- FALSE # Change to FALSE if you don't want packages installed.
toInstall <- c("markmyassigment","stringr","lubridate","devtools","downloader","repmis","car","MASS","ggplot2","ggthemes","maptools","rgeos","rgdal","ggmap")
if(doInstall){install.packages(toInstall, repos = "http://cran.us.r-project.org")}
lapply(toInstall, library, character.only = TRUE)




