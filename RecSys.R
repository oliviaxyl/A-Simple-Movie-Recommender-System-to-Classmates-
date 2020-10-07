# process data -------------
library(readxl)
library(dummies)
library(data.table)
library(openxlsx)
library(softImpute)

Survey_Results = read_excel("~/Desktop/Computational Statistics/HW/HW6/Survey Results_v1.1.xlsx", col_names = FALSE)[,-2]
colnames(Survey_Results) = c(Survey_Results[2,])
Survey_Results = Survey_Results[-2,]

genre_list = Survey_Results$Name[4:15]
item_list = Survey_Results$Name[17:36]
user_list = colnames(Survey_Results)[2:47]

Ratings = Survey_Results[17:36,2:47]
Ratings = matrix(as.numeric(as.matrix(Ratings)),nrow=20)
row.names(Ratings) = item_list
colnames(Ratings) = user_list

# User-Based Matrix U 46*14 ----------- 
U = data.frame(t(Survey_Results[1:15,]))[-1,-3]
colnames(U) = c("Gender", "Color", Survey_Results$Name[4:15])
# one-hot coding
U = dummy.data.frame(U, names=c("Gender","Color"), sep="_") 

# Item Based Matrix I 20*12 -----------
Movie_Genres = read_excel("~/Desktop/Computational Statistics/HW/HW6/Movie Genres.xlsx", col_names = FALSE)
colnames(Movie_Genres) = c("X__1","X__2","X__3")
genres = as.data.frame(Movie_Genres$X__3, stringsAsFactors=FALSE)
genres = as.data.frame(tstrsplit(genres[,1], ', ', type.convert=F), stringsAsFactors=FALSE)
colnames(genres) = c(1:3)
row.names(genres) = Movie_Genres$X__1

# one-hot coding
I = matrix(0,21,12) #empty matrix, 21 = (# of movies + 1 genre_list), 12 = # genres
I[1,] = genre_list
for (i in 1:nrow(genres)) { # 20
  for (c in 1:ncol(genres)) { # 3
    col = which(I[1,] == genres[i,c])
    I[i+1, col] = 1
  }
}
I = I[-1,]
# convert from characters to integers
I = matrix(as.numeric(I),nrow=20)
colnames(I) = genre_list
row.names(I) = item_list



# movie_recommendation function ------
movie_recommendation <- function(M, base, similarity){
  # M = U/I; base=user/item; similarity = l0/l1/l2
  
  # l: similarity matrix
  l = matrix(0,nrow(M),nrow(M))
  for (i in 1:nrow(l)) {
    for (c in 1:ncol(l)) { 
      if (similarity == "l2") {
        # l2 distance
        l[i,c] = sqrt( sum( (as.numeric(M[i,])-as.numeric(M[c,]) )^2 ) )
        # similarity
        l[i,c] = exp(-(l[i,c])^2/10 ) 
      } else if (similarity == "l1") {
        # l1 distance
        l[i,c] = sum( abs( as.numeric(M[i,])-as.numeric(M[c,]) ) )
        # similarity
        l[i,c] = exp(-(l[i,c])^2/50 ) 
      } else if (similarity == "l0") {
        # hamming distance
        l[i,c] = sum(M[i,] != M[c,])
        # similarity
        l[i,c] = exp(-(l[i,c])^2/100 ) 
      }
    }
    l[i,i] = NA
  }
  
  # rate: estimate rating matrix
  # rating: true rating matrix
  if (base == "user") {
    rating = Ratings
    } else if (base == "item") {
    rating = t(Ratings)
    }

  # select the top 10 most similar users/items for making the recommendation
  top = t(apply(l, 1, function(x) order(-x)[1:10]))
  rate = matrix(0,nrow(rating),ncol(rating))
  for (c in 1:ncol(rate)) {
    rec = rating[, top[c,] ]
    sim = l[top[c,],c]
    for (i in 1:nrow(rate)) {
      de = 0
      for (t in 1:length(rec[i,])){
        if (rec[i,t] != 0){
          de = c(de,sim[t])
        }
      }
      de = de[-1]
      rate[i,c] = sum(rec[i,]*sim)/sum(de) 
    }
  }
  rate = round(rate,2)
  
  if (base == "user") {
    rate = rate
    } else if (base == "item") {
    rate = t(rate)
    }
  
  # create recommendation matrix file
  rec5 = t(apply(t(rate), 1, function(x) order(-x)[1:5]))
  file = rep("",10)
  for(i in 1:46){ 
    recrow = c(item_list[rec5[i,]], rate[rec5[i,],i])
    file = rbind(file, recrow) 
  }
  file = file[-1,]
  colnames(file) = c("Movie1","Movie2","Movie3","Movie4","Movie5","Rating1","Rating2","Rating3","Rating4","Rating5")
  row.names(file) = user_list
  return(file)
  }


# Store recommendations in CSV file -----
U2 = movie_recommendation(M = U, base = "user", similarity = "l2")
write.xlsx(U2, file = "~/Desktop/Mv_Rcmd_Sys/user.base.l2.xlsx",
           sheetName = "U2", col.names = TRUE, row.names = TRUE, append = F)

U1 = movie_recommendation(M = U, base = "user", similarity = "l1")
write.xlsx(U1, file = "~/Desktop/Mv_Rcmd_Sys/user.base.l1.xlsx",
           sheetName = "U1", col.names = TRUE, row.names = TRUE, append = F)

U0 = movie_recommendation(U, "user", "l0")
write.xlsx(U0, file = "~/Desktop/Mv_Rcmd_Sys/user.base.l0.xlsx",
           sheetName = "U0", col.names = TRUE, row.names = TRUE, append = F)


I2 = movie_recommendation(M = I, base = "item", similarity = "l2")
write.xlsx(I2, file = "~/Desktop/Mv_Rcmd_Sys/item.base.l2.xlsx",
           sheetName = "I2", col.names = TRUE, row.names = TRUE, append = F)

I1 = movie_recommendation(M = I, base = "item", similarity = "l1")
write.xlsx(I1, file = "~/Desktop/Mv_Rcmd_Sys/item.base.l1.xlsx",
           sheetName = "I1", col.names = TRUE, row.names = TRUE, append = F)

I0 = movie_recommendation(M = I, base = "item", similarity = "l0")
write.xlsx(I0, file = "~/Desktop/Mv_Rcmd_Sys/item.base.l0.xlsx",
           sheetName = "I0", col.names = TRUE, row.names = TRUE, append = F)


# Matrix Completion -----
rating = Ratings
rating[rating == 0] = NA
A = softImpute(rating, rank.max = 10, lambda = 0.01, type = "svd",maxit = 1000)
rate = round(A$u %*% diag(A$d) %*% t(A$v), 2)

# create recomendation matrix file
rec5 = t(apply(t(rate), 1, function(x) order(-x)[1:5]))
file = rep("",10)
for(i in 1:46){ 
  recrow = c(item_list[rec5[i,]], rate[rec5[i,],i])
  file = rbind(file, recrow) 
}
file = file[-1,]
colnames(file) = c("Movie1","Movie2","Movie3","Movie4","Movie5","Rating1","Rating2","Rating3","Rating4","Rating5")
row.names(file) = user_list

write.xlsx(file, file = "~/Desktop/Homework6/result/matrix_comletion.xlsx",
           sheetName = "A", col.names = TRUE, row.names = TRUE, append = F)
