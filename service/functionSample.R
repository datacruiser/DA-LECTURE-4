#--------------------------------------------------#
# 第4讲: 复杂数据处理和分析                        #
# Author：猴子，
# 社群：大数据社群，微信公众号（猴子聊人物）   #
# 下面的代码对应PPT里的第一部分内容：如何自定义编写函数，控制语句的使用
#--------------------------------------------------#

#函数定义
add <- function(x,y){
  z <- x+y
  return (z)
}

#先编译函数，在使用
a <- add(1,2)

#控制语句：循环语句
print(str_c("第几次吃饭:",1,sep=""))
print(str_c("第几次吃饭:",2,sep=""))
print(str_c("第几次吃饭:",3,sep=""))

data <- c(1,2,3)

for(i in data){
  print(str_c("第几次吃饭",i,sep=""))
}


#while 循环
i <- 10
while(i >0){
  i <- i-1
}

#条件语句

#你钱包有多少钱
money <- 100 

if(money>0){
  #吃饭花了30元
  money <- money-30
  print("钱包还有钱，不需要取钱")
}else{
  print("钱包没有钱，去取款机吧")
}

#定义函数
#功能：每天吃饭
#输入参数：eat吃饭次数，money公司第一次给员工反卡的钱
#输出：给员工提示是否该去银行取钱
everday <- function(eat,money){
  for(i in eat){
    eatNumber <- str_c("今天吃第几次饭：",i,sep="") 
    eatNumber <- eatNumber-5 #每顿饭消费掉5元
    print(eatNumber)
  }
  
  if(money < 5){#饭卡余额<5元，提示
    print("钱包没钱了：去银行取点钱花")
  }else{
    print("钱包还有钱：不用去银行")
  }
}

#调用函数
#王思聪吃饭
everday(3,1000)



