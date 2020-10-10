# A-Simple-Movie-Recommender-System-to-Classmates-

#### -- Project Status: [Completed]

## Project Objective

The purpose of this coursework is to implement recommendation techniques and suggest relevant movies to classmates.

### Methods Used
* Item-based collaborative filter 
* User-based collaborative filter 
* Low-rank approximation

### Technologies
* R

## Project Description

### Data 

* User-Based Matrix U: 46 (Users) * 14 ('Gender' + 'Favorite Color' + 12 Genres 0/1)
* Item Based Matrix I: 20 (Movies) * 12 (Genres)
* Rating Matrix l: 20 (Movie ratings scaled in 1-5) * 46 (Users)

* Users Similarity Matrix: 46 * 46
* Items Similarity Matrix: 20 * 20

### Workflow

#### User-based collaborative filter 

![user](https://user-images.githubusercontent.com/49653689/95283857-b9930200-082a-11eb-8ed3-fc1ef52e68b3.png)

#### Item-based collaborative filter 

![item](https://user-images.githubusercontent.com/49653689/95283871-bef04c80-082a-11eb-97b6-18cd2db35a65.png)

#### Matrix completion

* Low-rank matrix approximation via nuclear norm minimization

![matrixcompletion](https://user-images.githubusercontent.com/49653689/95283874-c1eb3d00-082a-11eb-92bc-403cf2b50a9e.png)

#### Neural matrix factorization model
![NeuMF](https://user-images.githubusercontent.com/49653689/95661480-b4210a80-0afd-11eb-843b-5f26d2236d00.png)

### Results



## Reference

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

How to Implement a Recommendation System with Deep Learning and PyTorch
https://medium.com/coinmonks/how-to-implement-a-recommendation-system-with-deep-learning-and-pytorch-2d40476590f9

Neural Collaborative Filtering (NCF) Explanation & Implementation in Pytorch
https://www.youtube.com/watch?v=O4lk9Lw7lS0

Neural Collaborative Filtering (paper)
https://arxiv.org/pdf/1708.05031.pdf

Matrix Factorization
https://cims.nyu.edu/~cfgranda/pages/OBDA_fall17/notes/matrix_factorization.pdf

Neural Collaborative Filtering (Towards Data Science)
https://towardsdatascience.com/neural-collaborative-filtering-96cef1009401

Neural Networks for Collaborative Filtering（keras example) 
https://nipunbatra.github.io/blog/ml/2017/12/29/neural-collaborative-filtering.html
