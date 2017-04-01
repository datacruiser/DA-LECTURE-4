#--------------------------------------------------#
# 第4讲: 复杂数据处理和分析                        #
# Author：猴子，
# 社群：大数据社群，微信公众号（猴子聊人物）   #
#--------------------------------------------------#


library(dplyr)
library(nycflights13)# for data

#航班航行距离与延误时间的关系
#输入：不需要输入参数
#输出：返回每个目的地的平均航行距离，平均延误时间
disDelay <- function(){
  #选择子集
  myFlights <- select(flights,
                      year,month,day,
                      dep_delay,arr_delay,
                      distance,dest)
  #列名重命名，等号左边是新列名，右边是就列名
  myFlights <- rename(myFlights, destination = dest)
  
  #删除缺失数据，这里的空值NA代表航班取消
  myFlights <- filter(myFlights, 
                      !is.na(dep_delay), 
                      !is.na(arr_delay))
  
  #数据排序
  myFlights <- arrange(myFlights, desc(dep_delay))
  
  #数据计算：航班航行距离与延误时间的关系    
  delay <- myFlights %>% 
    group_by(destination) %>% 
    summarise(
      count = n(),
      dist = mean(distance, na.rm = TRUE),
      delay = mean(arr_delay, na.rm = TRUE)
    ) %>% 
    filter(count > 20)
  
  return(delay)
}
