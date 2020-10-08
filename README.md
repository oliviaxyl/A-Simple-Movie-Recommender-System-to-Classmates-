# A-Simple-Movie-Recommender-System-to-Classmates-

#### -- Project Status: [Completed]

## Coursework Objective

The purpose of this coursework is to implement basic collaborative filter techniques and suggest relevant movies to classmates.

### Methods Used
* Item-based collaborative filter 
* User-based collaborative filter 
* Low-rank approximation

### Technologies
* R

## Coursework Description

### Data 

* User-Based Matrix U: 46 (Users) * 14 ('Gender' + 'Favorite Color' + 12 Genres 0/1)
* Item Based Matrix I: 20 (Movies) * 12 (Genres)
* Rating Matrix l: 20 (Movie ratings scaled in 1-5) * 45 (Users)

* Users Similarity Matrix: 46 * 46
* Items Similarity Matrix: 20 * 20

### User-based collaborative filter 

![user](https://user-images.githubusercontent.com/49653689/95283857-b9930200-082a-11eb-8ed3-fc1ef52e68b3.png)

### Item-based collaborative filter 

![item](https://user-images.githubusercontent.com/49653689/95283871-bef04c80-082a-11eb-97b6-18cd2db35a65.png)

### Matrix completion

* Low-rank matrix approximation via nuclear norm minimization

![matrixcompletion](https://user-images.githubusercontent.com/49653689/95283874-c1eb3d00-082a-11eb-92bc-403cf2b50a9e.png)

## Challenges 

In reality, recommendation data is extremely sparse in large scale. Besides, a new user or a newly released movie can suffer from cold start. 

## Other Technique 

* SoftMax DNN (future work!)

## Reference

softImpute
https://www.rdocumentation.org/packages/softImpute/versions/1.4/topics/softImpute

Package ‘softImpute’ 
https://cran.r-project.org/web/packages/softImpute/softImpute.pdf

SVD example 
https://www.d.umn.edu/~mhampton/m4326svd_example.pdf

Matrix Completion and Low-Rank SVD via Fast Alternating Least Squares
https://arxiv.org/pdf/1410.2596.pdf

A Simple Algorithm for Nuclear Norm Regularized Problems 
https://www.m8j.net/data/List/Files-149/fastRegNuclearNormOptimization.pdf

Recommondation Systems
https://developers.google.com/machine-learning/recommendation/collaborative/matrix

