# Introduction to Machine Learning with R

## What is Machine Learning

Machine learning (ML) is a branch of artificial intelligence that seeks to develop alorithms based on input data to generate predictions or classifications on unseen data. Examples of machine learning applications are seen across a variety of fields from finance to healthcare. For example, a stockbroker may apply data scraped from X, TikTok, Instagram, Facebook, or the news to her algorithm to capture social factors impacting trading and adequately predict trends in the stock market. Similarly, a clinical scientist may include histology staining and deleterious genetic markers to classify cancer subtypes. 

It's easy to get excited about implementing ML algorithms in your research given it's popularity, but it is important to take the time to understand the statistical framework behind your models. Today we will be exploring classical machine learning using the R package CARET: Classification and Regression Training. CARET provides functionality to conduct the following tasks: 

* Data Cleaning
* Data Splitting
* Model Fitting
* Data Resampling for Parameter Tuning
* Feature Selection
* Predictive Modeling
* Performance Testing

## Data Cleaning

CARET is a a powerful, but it does not provide functionality to remove contaminants, conduct log10 transformations, or perform probabilistic quotient normalization. These pre-processing steps, while important, are beyond the scope of this bootcamp, but the QBS program offers classes in ML that can provide in depth instruction on data cleaning. 

Today we will learn how to use CARET to center, scale and impute our data. 

* Centering
* Scaling - the only scaling avilable in CARET is the default scaling, which divides by the standard deviation
* Imputation - choise of k-nearest neighbor (KNN) or Tree Bagging













![classical-machine-learning](/images/classical-machine-learning.png)

## Supervised Machine Learning

Supervised machine learning leverages labeled data to train algorithms to identify patterns and generate predictions on a similar data set. Supervised machine learning can be divided into classification and regression. 

### Classification 

Classification algorithms are fed binary or categorically labeled data, which inform the algorithm to learn attributes of each category. For example, we can conduct classification on photos of dogs and cats and ask our algorithm to bin the photos into "Puppos" and "Kitties". Our algorithm might learn that "long snouts" are a dog attribute or stripes are a cat attribute. 

![cat-dog-classification](/images/cat-dog-classificaiton.png)

Now you may be thinking, "Well, not all cats have stripes" or "My pug has such a short snout that he snores". These are all fair points, but you must remember that our algorithm is making a classification on a number of attributes, not just stripes or snout length. In order to capture the finer differences in attributes between/amoung our categorizations, our training set must be large and diverse. 

#### What is a trianing set?

A critial part of our algorithm development is our data. Ideally, we need a large, diverse data set to capture all the potential variables among levels in our categories. After acquiring such a data set, whether that be from a collaborator, website(s), or our own experiments, we must divide our data into a training and testing. Typically, we randomly split our data into 2/3 training data and 1/3 testing data. Another approach is referred to as stratified splitting, in which we ensure that our splitting is conducted evenly across classes of interest. This approach is especially useful for data sets with many classes. 
