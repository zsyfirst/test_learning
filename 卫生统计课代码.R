#读数据，描述统计
install.packages('xlsx')
install.packages('xJava')
install.packages('xlsxjars')

library(xlsx)
a <- read.xlsx("E:/统计/卫统.xlsx",sheetName="A",header=F)

#直方图;箱式图;正态QQ图
hist(a$HH)
boxplot(a$HH)

#正态性检验Shapiro-Wilk normality test：p<α不服从正态分布
shapiro.test(a$HH)
#未知总体与已知总体均数比较的t-检验
t.test(a$HH,mu=50)
#配对t检验：t.test(a$v1,a$v2,paired=TRUE)
#独立样本t检验（两个独立样本比较）
#先F检验再看是不是要用t'test: p>0.05,方差齐
var.test(a$v1~a$v2)#F检验
#法1：t.test(y~x,var.equal = TRUE) y包含样本数据，x表示分组。a single formula argument: y~x, where y contains both samples and x is a grouping indicator
t.test(hsb2$science~hsb2$female)
#法2：
t.test(science~female, data=hsb2)
#法3：
x = with(hsb2, science[female=="male"]) #等同于x=hsb2[hsb2$female=='male',"science"]
y = with(hsb2, science[female=="female"])
t.test(x,y)

#单因素方差分析one-way ANOVA（多个独立样本比较：完全随机设计资料；参数检验）
#先方差齐性检验：leveneTest(y,g)或者bartLett.test(y~g)
#再one-way ANOVA
#最后均数间多重两两比较：LSD法与Bonferroni法，详情请看卫统课件6.
y<- data$x
g<- factor(data$g,levels=c(1:3),labels = c('low,medium,high'))
anova(lm(y~g))

#分类变量的假设检验：
#二分变量/多分类变量：卡方检验（四格表；配对四格表；行*列表即R*C表）
#有序变量：秩和检验（两组：Wilcoxon秩和检验；多组：Kruskal-Wallis秩和检验）

#四格表资料的卡方检验：Pearson's Chi-squared test
#chisq.test(x,y,correct=FALSE)；若x是个矩阵，就不需要y
#n>=40,E>=5时，卡方检验不用校正。当n>40但5>E>=1时，需校正
M <-as.table(rbind(c(18, 22), c(9, 27)))
dimnames(M) <-list(group = c("井下矿工", "井上工人"),
                   dis = c("Y","N"))
Xsq<-chisq.test(M,correct= FALSE)
names(Xsq)
Xsq$p.value#X-squared

#Fisher确切概率法:n<40或E<1
#fisher.test(x,y);若x是个矩阵：fisher.test(x)
x <-matrix(c(7, 5, 3, 8), nrow= 2,
           dimnames= list(group = c("A", "B"), Y = c("Y", "N")))
fisher.test(x)


#linear correlation简单线性相关是对两个变量x1, x2进行的相关分析,两变量的地位相同
#simple linear regression简单线性回归,研究两个变量x与y在数值上线性依存关系的统计方法，其中x为自变量，y为因变量。
#回归：x可随机变动也可人为取值，y为服从正态分布的随机变量。
#研究两个变量的相互关系用相关分析。研究两个变量的依存关系用回归分析
