
##1.使用R中的数据读写，文件路径，for循环语句，读入路径“/assignment_idaccuracy/Aminer”总的所有文件，并将数据合并成为一个data.frame输出
setwd("D:/R/bigdata/assignment 2/")

library(readr)
data <- data.frame()
for(i in dir("Aminer")){
  data <- rbind(data,data.frame(read_csv(paste("Aminer/",i,sep = ""))))
}
write_csv(data,"aminerdata.csv")

##2.使用apply家族函数替代上述步骤中的for循环
library("dplyr")
setwd("D:/R/bigdata/assignment 2/Aminer")
data <- bind_rows(lapply(dir(), read.csv))
write_csv(data,"aminerdata.csv")

##3.将2中代码封装成为一个可以在命令行运行的脚本，脚本的唯一一个参数为aminer论文文件所在的路径。
library("dplyr")
read_csv_once_df <- function(filename){
  setwd(filename)
  data <- bind_rows(lapply(dir(), read.csv))
  write_csv(data,"aminerdata.csv")
}



