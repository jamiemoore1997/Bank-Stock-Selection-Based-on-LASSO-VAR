# Bank-Stock-Selection-Based-on-LASSO-VAR

Abstract—This study uses the network indicator 
from LASSO- vector autoregressive model as a 
feature for stock selection. At the same time, a 
machine learning approach for stock selection is 
proposed with the Random Forest, Extreme 
Gradient Boost, Linear Regression, and 
Artificial Neural Network stacked model to 
predict the probability of an outperforming 
stock. The features set with and without 
connectedness are feed through the learning 
model to acquire daily portfolios for the winning 
stocks. The features set with net connectedness 
show a greater indicative power at both learning 
and portfolio construction stage. With 
connectedness, the performance of the learning 
model is significantly better during crisis 
periods, whereas the portfolio performance 
surpasses the benchmark in terms of cumulative 
returns. This research is the first attempt to use 
a Large LASSO connectedness for stock 
selection and study the impact of connectedness 
as a feature in a high-dimensional data set. 


Keywords—LASSO-VAR ,Machine Learning, 
Network Connectedness, , Stacking Ensemble, 
Stock Selection


1. RESEARCH FRAMEWORK:

![image](https://user-images.githubusercontent.com/82497669/148704741-94356578-1cb7-44fb-9644-fcc3ff50da16.png)


2. RESEARCH METHODOLOGY:
  Data Selection:

![image](https://user-images.githubusercontent.com/82497669/148704798-e8c255c8-ca9f-4aa6-afd3-abb5c1991cbb.png)

  Create Feature Set From Data Selected

![image](https://user-images.githubusercontent.com/82497669/148704844-2e55dacd-499f-43dd-893d-5f0b9c08612f.png)

![image](https://user-images.githubusercontent.com/82497669/148704866-5ba2ce2c-e520-4b8a-93dc-8ed7e503076f.png)


  Pull data through Machine Learning models to select the best stocks
  
    Target:
    Predict probability of outperformance in stock in the next 5 business days.
    Label with median of daily risk adjusted return .

  Transform data to train,test,validation sets for time series data
![image](https://user-images.githubusercontent.com/82497669/148704954-e77bee1a-6727-4165-8a4c-6ff09a79d769.png)

  Use Random Forest, Logistic Regression, Extreme Gradient Boost
  Combined Results with Artificial Neural Network
![image](https://user-images.githubusercontent.com/82497669/148704972-d9043ad5-c5f2-48d0-b8a4-b21db05b47d7.png)




