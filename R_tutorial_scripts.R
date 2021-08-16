# what is R?

# Object
# Main classes of data object are: 
# vector: a row of column of items of the same type.向量
# matrix: a 2-way layout of items of the samle type.矩阵
# factor: a vector of categorical itmes.分类变量
# data.frame: a collection of columns, possibly of different types.数据库
# list: a collection of any object.任何object的集合（最高等级）
# create a vector
v1 <- c(1,2,4)
v2 <- sample(1:10, 50, replace = TRUE)
?sample
v3 <- c("Apple","Grape","Cherry")
1:5 # integer steps
5.5:-5
seq(0,1, by = 0.1)
seq(0,1,length = 64)
rnorm (50)#标准正态数
rep(v3, times = 3)
rep(v3, each = 3)

# class of a vector
class(v1)
class(v2)
class(v3)
# three main classes, numeric, character, logical.

# index a vector
length(v1) # show the length of vectors
length(v2)
v1[1]
v2[5:10]

# logical determinants
v2>10
sum(v2>10)
v2>6
sum(v2>6)
table(v2)#做一个频数表
table(v2>6)#每种有多少，v2>6本身就是逻辑2种值
class(v2>6)

# descriptive parameters
mean(v2) #mean
sd(v2) # standard deviation
round(sd(v2),2) # round to 2 decimals，取位，只要2位小数
summary(v2)#简单统计，最小、大
max(v2)
min(v2)
median(v2)
var(v2)
range(v2)

# let's insert some NAs and run again，缺失值
v4 = sample(c(1:10,NA),50,replace = T)
mean(v4)#有缺失值，无法算出来，需要处理NA
# it gave us a NA, hence we need another argument here, -na.rm (i.e., remove all NA values)
mean(v4, na.rm=T)#处理：去掉NA，remove=T
summary(v4,na.rm=T)

# vector by ascentding or decending order
v2
order(v2)#按从小到大排序，给出从小到大每一位它所在的序数，
v2[c(4,5,1)]
v2[order(v2)]#从小到大排序，给出从小到大的本身的数
v2[order(v2,decreasing = T)]
order(v4)
v4[order(v4)]
v4[order(v4,decreasing = T)]

# arithmetic functions
exp(v2)#算OR值需要用，逻辑回归时
log(v2)#默认以e为底
log(v2, base = 10)
log10(v2)
log2(v2)

# Functions
# Functions are organised into libraries or packages
# R base distribution
sessionInfo() #现有的包 what packages are loaded into memory
help(package = "stats")#会给出包里面所有函数的说明文档
help(package = "graphics")
library() # packages on disk
# install packages
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)#处理数据
library(tidyr)
library(ggplot2)#画图

# how to use a function
# every function has a name
# brackets contain arguments, (input values).
# The function returns a value, (output)
# To run a function type its names followed by arguments in brackets.
sqrt(4)#开方
2+2
2/3
2^3
2/(3+1)
8^(1/3)
sqrt(9) - sqrt(25)
sqrt(abs(-2))#根号2，abs是绝对值函数

# vector assignment赋值
# assignment saves a value and gives it a name so you can retrieve it.
# Names can contain letters, numbers, and ".", but they cannot begin with a number, and they are case-sensitive
x <- 2+2
x = 2+2
x
# assignments saves an independent copy of the value
y = x
y = 0
y = x+1 # y become x+1, x unchanged
x = x+1 # x become x+1, its previous value is lost
sqrt(x) # x is not changed by this
x = sqrt(x) # x becomes it square root

# making lists and data frames 解释list
x = c(0,1,3,4.5)
y = c("apple","apple","orange","apple")
li<- list(a=x, b=y)#好处:可以放任何，且不用一样长
li
li$a
da<- data.frame(x=x, y=y) #以数据帧的形式存放，所有列必须一样长，list不需要。 The columns must have the same length
da$x

# reading data frame

getwd() # get working directory显示现在的工作路径
dir() # what files in the wd现在路径下所有文件名
setwd() # set working directory to any folder改变路径

read.table() # 读取数据reads a plain text file and returns it in a df(data.frame)
# The first argument is the filename and its extension in quotes.
# The two most useful options(arguments) are:
# header, is the first line the column names?第一行是不是变量名（T：是变量名，FALSE不是，自动给你用V1,V2```补上）
# sep, how are the columns separated?列和列是怎么分割的
# sep = "", sep = ",", sep = "\t"（tab）
# another factor, stringsAsFactors导入的时候是字符还是
hsb2 = read.table("hsb2.txt",header=TRUE,sep="")#
class(hsb2)
dim(hsb2) # number of rows and columns显示多少行，列
head(hsb2)#显示前6行数据
hsb2[,4]#显示第4列所有值
hsb2[1:6,]#显示1-6行的所有列数据
hsb2[1:6,"ses"]#显示1-6行的所有“ses”变量列的数据
hsb2["id","ses">50]
v2>6
v2[v2>6]
#逻辑判断：第一个arguments是比较判断的条件，第二个是要的变量数据
hsb2["ses">50,"id"]#想要ses>50的所有id
hsb2[hsb2$science>50,c("id","science")]
#|代表或，&和
#==是逻辑判别，等于；！=是不等于；a%in%b：a是不是在b里面(a中的每一个值都会判断1次)
c(1:4) %in% c(2:5)
c(1:4) %in% c(1:5)

dim(hsb2)#多少行和列
nrow(hsb2) # number of rows行的数量
ncol(hsb2) # number of columns列的数量
names(hsb2) # column names of data frame显示所有列变量的名字
summary(hsb2) # summary of each column每个变量都统计：最大值/最小值，4个百分位数
# rowSums(), colSums()每列加和, sum of each row and column
?rowSums
# rowMeans(), colMeans(), mean of each row and column
summary(hsb2$science)
cov(hsb2) # covariance matrices协方差矩阵
cor(hsb2) # correlation matrices
rowSums(hsb2)
colSums(hsb2)

# Factors is a kind of vector used to represent categorical variables and grouping indicators.
# It is a numeric vector with an associated vector of lables for the categories called levels.
# The order of the levels determines how the categories are coded: the first level is coded 1, the second is coded 2, and so on.
# function factor() makes factor variables
class(hsb2$female)#回归必须要用factor而不是int，更改reference level
hsb2$female = factor(hsb2$female, levels=0:1, labels=c("male","female"))
hsb2$ses = factor(hsb2$ses, levels=1:3, labels=c("low","medium","high"))
nlevels(hsb2$female) # number of levels
levels(hsb2$female) # Levels
as.numeric(hsb2$female) # Internal code numbers
c("blue","red")[hsb2$female] # indexing by category[hsb2$female]是1，2，即抽哪一个
# how do we redefine factor levels, e.g., specify the new reference level
levels(hsb2$ses)
hsb2$ses2 = factor(hsb2$ses,levels = c("medium","low","high"))#用于替换level
levels(hsb2$ses2)
class(hsb2$ses)
head(hsb2$ses)
head(hsb2$ses2)
as.numeric(hsb2$ses)
as.numeric(hsb2$ses2) 
# another way is to use the reorder() function to specify the reference level

# Missing data
# In R, missing values are codes as NA (not available)
# NA is a special value that can appear in any type of object.
# arithmeic and conditional operations propagate NA.
# descriptive function have a option na.rm
# function is.na() tests for NA.
x = c(NA,2,4,6,NA,10)
mean(x)
mean(x, na.rm=TRUE)

sum(x==NA)#有几个缺失值不能用==
sum(is.na(x))
sum(!is.na(x))
x=x[!is.na(x)]
x#删除缺失值

# Tabels
table(hsb2$female)
x = table(hsb2$ses, hsb2$female)
x
table(hsb2$ses, hsb2$female,hsb2$prog)
#算比例
prop.table(x, margin=1) * 100 # percentage of row sums横着加100%
prop.table(x, margin=2) * 100 # percentage of column sums竖着加100%
# sapply(), applies a function to data frame columns
#处理缺失值
mean(hsb2$read, na.rm=TRUE)
sapply(hsb2[7:11], mean, na.rm=TRUE)
sapply(hsb2[7:11], sd, na.rm=TRUE)#对7-11行进行运算

# self-defined function，名字不能有特殊字符、中文，加上.sd
mean.sd = function(x, ...) {
  #  Return a list containing the mean and sd of x
  m = mean(x,...)
  s = sd(x,...)
  list(Mean=m, SD=s)
}

mean.sd(hsb2$read, na.rm=TRUE)
sapply(hsb2[7:11], mean.sd, na.rm=TRUE)#整洁一点
lapply(hsb2[7:11], mean.sd, na.rm=TRUE)
x = sapply(hsb2[7:11], mean.sd, na.rm=TRUE)
x
class(x)  
sapply(hsb2[7:11], function(x) list(Mean=mean(x), SD=sd(x))) # same as above
install.packages("psych")
library(psych)
describe(hsb2[7:11])#用包生成均值、标准差、最大/小值、范围等

# tapply applies a given function to a vector grouped by factors by applied a given function to a data frame with rows grouped by factors
?with
with(hsb2, tapply(science, female, mean))  # Cell means，按照开始定义的factor“female”的类别（male,female）算均值
with(hsb2, tapply(science, list(ses,female), mean))#，按factor"ses"和"female"分层产生均值(男女&low,medium,high)
with(hsb2, by(hsb2[7:11], list(ses,female), describe))#按分层产均值、标准差、最大/小值、范围等
# saving tables
x = with(hsb2, tapply(science, list(female,ses), mean))
x = round(x, 2)#去后两位小数
x
#保存数据的办法！
# sink diverts output to a text file//.table或.csv也可
sink("mytable.txt") # turning saving保存，注意文件名，不然会默认覆盖
x                   # all output here is diverted把要保存的变量名全放进来，可以写很多
sink()              # turn off saving结束保存（必须写）
# can also use write.table or write.csv
#保存的第2法
write.table(x, "mytable2.txt", quote=FALSE, sep="\t")

#逻辑回归前必须：处理数据（数据清理）
# data cleaning and visulization with R，确保每一个数据点都是干净可信的
# 1. inspect outliers and missing values
# let's make a scatter plot for hsb2, science
x = 1:nrow(hsb2)#生成多少行的数
x
plot(x,hsb2$science)#画图，看有没有outlier
?plot()
?par
plot(x,hsb2$science, pch = 16, col = "blue") #pch形状contors shape of points, col controls color of points
# let's make a logical judgement
m = mean(hsb2$science,na.rm=T)
s = sd(hsb2$science,na.rm=T)
sum(hsb2$science<m-3*s|hsb2$science>m+3*s)#sum=0代表没有数超出正常值范围
# let's insert a definite outlier
x = hsb2$science # make sure orginal vector won't be changed
x[sample(1:200,2,replace = F)] = 5#抽200行中2个，不放回，替换为5
x[sample(1:200,3,replace = F)] = 140#抽200行中3个，不放回，替换为140
x
summary(x)
plot(1:nrow(hsb2),x,pch = 1, col = "blue")#可看出有5个outlier
m = mean(x,na.rm=T)
s = sd(x,na.rm=T)
sum(x<m-3*s|x>m+3*s)#算共有几个outlier
x[x<m-3*s|x>m+3*s]#显示出具体那几个outlier
# how do we index them?
i = x<m-3*s|x>m+3*s#逻辑判断，若为outlier则为TRUE
i
x[i]#TRUE会被展示出来
# what we do with this values?
# check with original questionnaire and revise value or mark them as NA
#将outlier标记为NA
x[i] = NA
sum(is.na(x))
summary(x)
# For do we deal with missing values in a dataframe?
# Although we can do imputation, I recommend doing nothing we them最好不做缺失值填补
# readings: https://www.r-bloggers.com/missing-data-in-r/
# 如何cleaning数据，一个课：readings: https://www.datacamp.com/courses/cleaning-data-in-r
# repeat this process of every variables you plan to use in your study
# And make good records of everything you did

# Now we got data prepared, let's do some hypothesis test and regression
# hypothesis test 假设检验

#T-test独立样本检验
x = with(hsb2, science[female=="male"])
#等同于x=hsb2[hsb2$female=='male',"science"]
y = with(hsb2, science[female=="female"])
t.test(x,y)
# a single formula argument: y~x, where y contains both samples and x is a grouping indicator
t.test(science~female, data=hsb2)
t.test(hsb2$science~hsb2$female)
# Objects returned by testing and modelling functions contain multiple values that can be extracted by name using $
#用$提取检验或建模后想要的结果
fit = t.test(science~female, hsb2)
names(fit) # what are the component names ?
fit$p.value # Get component "p.value" by name

#卡方检验，频率分布有没有差别(x,y变量的位置对结果无影响)
table(hsb2$female,hsb2$ses)
chisq.test(hsb2$female,hsb2$ses)

#数小的时候，fisher's exact test(n<40或E<1理论频数)
fisher.test(hsb2$female,hsb2$ses)

#One-way ANOVA卫统课件6


# linear regression
# function lm fits a linear regression model by ordinary least squares.
# Its first argument is a formula that specifies the model: y~model
# y is the dependent variable
# x is the independet variables, seperated by +
data(hills, package="MASS")
head(hills)
# before we run regression, we may want to eyeball the independent variables with dependent variables first
plot(hills$dist,hills$time)#看一下线性关系，有没有outlier
plot(hills$climb, hills$time)
plot(1:nrow(hills),hills$dist)
plot(1:nrow(hills),hills$climb)#等同于plot(hills$climb)
m1 = mean(hills$dist)
s1 = sd(hills$dist)
sum(hills$dist<m1-3*s1|hills$dist+3*s1)#outlier的数量
m2 = mean(hills$climb)
s2 = sd(hills$climb)
sum(hills$climb < m2-3*s2|hills$climb > m2+3*s2)
# we do not necessarily delete all outliers, case by case
# run models
fit0 = lm(time~1, hills) # intercept only  lm(y值~所有x，)
fit1 = lm(time~dist, hills) # simple regression
fit2 = lm(time~dist+climb, hills)  # Multiple regression
fit3 = lm(time~dist+climb+dist:climb, hills) # Interaction “：”交互项
fit4 = lm(time~dist*climb, hills) # shorthand, same as fit3
# coef get the model coefficients
fit1
summary(fit1)#Rsquare决定系数:解释了多少y的variance总变异是由x贡献的

coef(fit0)
coef(fit2)
coef(fit4)
summary(fit4)
fit4
# testing the parameter estimates
# summary.lm tests the estimates and the model goodness of fit.
# confint provides confidence intervals arount the estimates.
# vcov provides the estimates variance-covariance matrix.
# anova provides sums of squares and mean suqares.
summary.lm(fit4)#检验拟合优度
confint(fit4)#报95%置信区间
vcov(fit4)#方差-协方差矩阵
anova(fit4)#输出方差检验
# extracting information from the fit summary提取信息
names(summary.lm(fit4))
summary.lm(fit4)$coef
summary.lm(fit4)$r.squared
# r squared measures the proportion of outcome variation explained by our model as a whole
# goodness of fit, dignostic plots
par(mfrow=c(2,2))#分成4块
plot(fit2)#画出4个图

fit1 = lm(dist~speed, cars)
fit2 = glm(dist~speed, cars, family=gaussian(link="identity"))
summary.lm(fit1)
summary.glm(fit2)
?glm

# Logistic regression：分类变量。若分类和连续变量都有，那都可以
fit1 = glm(female ~ science, data=hsb2, family=binomial(link="logit"))
#只改前两个， family=binomial(link="logit")被设定好了，不要动
summary(fit1)
coef(fit1) 
exp(coef(fit1))
confint(fit1)
exp(confint(fit1))
# control for some factors矫正变量影响，一直往上加即可
fit2 = glm(female ~ science+ses+race+read+write, data=hsb2, family=binomial(link="logit"))
summary(fit2)
#解释：
coef(fit2) #不是我们要的OR
exp(coef(fit2))#这个是我们要的OR值,每一个都跟reference比，因此factor一定要处理：如ses被分类，不然就像race一样默认为连续变量
levels(hsb2$female)
levels(hsb2$ses)
confint(fit2)
exp(confint(fit2))#OR值的95%置信区间

