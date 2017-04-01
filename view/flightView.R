#--------------------------------------------------#
# 第4讲: 复杂数据处理和分析                        #
# Author：猴子
# 社群：大数据社群，微信公众号（猴子聊人物）   #
#--------------------------------------------------#


#视图模块

library(ggplot2)
library(stringr)

#当前项目运行根路径
#例如：C:/install/workspace/da
projectPath <- getwd()
#service路径
#例如C:/install/workspace/da/service/flight.R
servicePath <- str_c(projectPath,
                     "service",
                     "flight.R",
                     sep="/")

#编译R文件
source(servicePath)

#业务逻辑：航班航行距离与延误时间的关系
delay <- disDelay()

#散点图
view <- ggplot(data = delay) + 
  geom_point(mapping = aes(x = dist, y = delay))+
  geom_smooth(mapping = aes(x = dist, y = delay))

#保存分析结果
outputpath <- str_c(projectPath,"output","delayFlight.jpg",sep="/")

ggsave(filename=outputpath, plot=view)


