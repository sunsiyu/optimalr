library(data.table)
# example data.table to be played with
df <- data.frame(a = sample(1:10, 20, replace=T),
                 b = sample(letters, 20, replace = T),
                 c = rnorm(20),
                 d = c(rep("b",5), rep("a", 5), rep("c", 10)),
                 e = as.Date("2016-01-01") + sample(0:10, 20, replace = T),
                 f = sample(1e3:1e5, 20, replace = F),
                 stringsAsFactors = F)

dt <- as.data.table(df)

dim(dt)
sapply(dt, class)
dt[, lapply(dt, class)]

## select rows by i
dt[1]
dt[1, ]
dt[5, ]
dt[1:10, ]
dt[d == "a"]
dt[d == "a" | d== "b", ]
dt[d %in% c("a", "b")]
dt[a  == 1 & d == "b"]

## select columns by j
dt[, a]  # vector
dt[,.(a)]  # data.table
dt[, c(a,b)] # a long vector
dt[, .(a,b)]  # data.table
dt[, .(-a)]  # something wierd
dt[, -a]  # something wierd
dt[, !a]  # something wierd
dt[, -"a", with = F]
dt[, -c("a", "b"), with = F]
dt[, sum(a)]
dt[, unique(b)]

## get summary table (long and narrow)
dt[, .(a,d)][, unique(a), by = d]

## summary table (short and narrow)
dt2 <- dt[, .(a,d)]
dt2[, a_d:=list(list(unique(a))), by = d]
head(dt2)

## Suppressing intermediate output with {}
dt[, {tmp1 = mean(a)
      tmp2 = mean(abs(c) - tmp1)
      tmp3 = round(tmp2, 2)
      list(tmp2 = tmp2, tmp3 = tmp3)},
   by = d]
