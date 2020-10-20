# A-Simple-Movie-Recommender-System-to-Classmates-

![movie](https://user-images.githubusercontent.com/49653689/95661739-9fde0d00-0aff-11eb-864c-288a2ec8e825.png)

#### -- Project Status: [Completed]

## Project Objective

The purpose of this coursework is to implement recommendation techniques and suggest relevant movies to classmates. 

### Methods Used
* Item-based collaborative filter 
* User-based collaborative filter 
* Low-rank approximation
* Neural collaborative filtering

### Technologies
* R
* Jupyter, Python 3
* Pandas, Numpy, matplotlib, sklearn, keras

## Project Description

### Data 

* User-based matrix U: 46 (Users) * 14 ('Gender' + 'Favorite Color' + 12 Genres 0/1)
* Item-based matrix I: 20 (Movies) * 12 (Genres)
* Rating matrix l: 20 (Movie ratings scaled in 1-5) * 46 (Users)

* Users similarity matrix: 46 * 46
* Items similarity matrix: 20 * 20

### Recommendation Techniques

* User-based collaborative filter 

![user](https://user-images.githubusercontent.com/49653689/95283857-b9930200-082a-11eb-8ed3-fc1ef52e68b3.png)

* Item-based collaborative filter 

![item](https://user-images.githubusercontent.com/49653689/95283871-bef04c80-082a-11eb-97b6-18cd2db35a65.png)

* Matrix completion (low-rank matrix approximation via nuclear norm minimization)

![matrixcompletion](https://user-images.githubusercontent.com/49653689/95283874-c1eb3d00-082a-11eb-92bc-403cf2b50a9e.png)

* Neural matrix factorization

![NeuMF](https://user-images.githubusercontent.com/49653689/95661480-b4210a80-0afd-11eb-843b-5f26d2236d00.png)

### Results

* NeuMF model test MAE: 0.7

![maeplot](https://user-images.githubusercontent.com/49653689/95707337-3fe28600-0c27-11eb-9ee9-c8b4a2d40afe.png)

* Top 5 movies recommended for the desired user:

![neu](https://user-images.githubusercontent.com/49653689/95707346-4670fd80-0c27-11eb-87a5-9347e2890e7e.png)

* Rating from the desired user:

![true](https://user-images.githubusercontent.com/49653689/95707352-4a048480-0c27-11eb-9989-022e525c3b0a.png)

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

Neural Collaborative Filtering with NeuMF
http://caravanuden.com/spotify_recsys/neural_collaborative_filtering.html

Neural Networks for Collaborative Filtering
https://nipunbatra.github.io/blog/ml/2017/12/29/neural-collaborative-filtering.html
