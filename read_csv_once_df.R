library("dplyr")
read_csv_once_df <- function(filename){
  setwd(filename)
  data <- bind_rows(lapply(dir(), read.csv))
  write_csv(data,"aminerdata.csv")
}