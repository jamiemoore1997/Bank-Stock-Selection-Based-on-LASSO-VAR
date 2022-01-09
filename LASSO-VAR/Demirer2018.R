
### DEMIRER, M., DIEBOLD, FX., LIU, L., & YILMAZ, K. (2018)
### Estimating Global Bank Network Connectedness
### Journal Of Applied Econometrics
### replicated by David Gabauer (https://sites.google.com/view/davidgabauer/contact-details)
library("readr")
library("parallel")
options(mc.cores=detectCores())
source('C:/Users/jamie/Downloads/Thesis/ConnectednessApproach-master/ConnectednessApproach-master/2018 Demirer et al. J. Appl. Econom/functions.R', echo=TRUE)

DATA= read_csv("C:/Users/jamie/Downloads/Thesis/Book3.csv") 
# restrict dataset
DATA=na.omit(DATA)
DATE = DATA[,1]
Y = DATA[,-1]
k = ncol(Y)
NAMES = colnames(Y)

### STATIC CONNECTEDNESS APPROACH
nlag = 2 # VAR(4)
nfore = 10 # 10-step ahead forecast
lasso_full = LassoVAR(Y, p=nlag)
CV_full = GFEVD(lasso_full$B, lasso_full$Q, n.ahead=nfore)$GFEVD
rownames(CV_full)=colnames(CV_full)=NAMES
print(DCA(CV_full)$TABLE)

### DYNAMIC CONNECTEDNESS APPROACH
t = nrow(Y)
space = 200 + nlag # 200 days rolling window estimation
t0 = t-space

net = to = from = matrix(NA, ncol=k, nrow=t0)
gfevd = ct = npso = array(NA, c(k, k, t0))
total = matrix(NA, ncol=1, nrow=t0)
colnames(gfevd)=rownames(gfevd)=colnames(ct)=rownames(ct)=colnames(Y)
for (i in 1:t0){
  lasso_var = LassoVAR(Y[i:(space+i-1),], p=nlag)
  gfevd[,,i] = GFEVD(lasso_var$B, lasso_var$Q, n.ahead=nfore)$GFEVD
  vd = DCA(gfevd[,,i])
  ct[,,i] = vd$CT
  to[i,] = vd$TO
  from[i,] = vd$FROM
  net[i,] = vd$NET
  #npso[,,i] = vd$NPSO
  total[i,] = vd$TCI
  if (i%%100==0) print(paste0(round(100*i/t0,2),"%"))
}

write.table(from,file="from2.csv")
write.table(to,file="to2.csv")