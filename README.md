# Epoc-Emotiv

This code predicts the imaginary hand motion of an amputee patient (undergoing phantom limb rehabilitation with and augmented reality-based technology). I used EEG-based signal processing on EEG data extracted from an Emotiv Epoc brain-interface (EDF files) in CSV format. The movements to be detected are six: hand extension, hand contraction, finger waving, close fist, open fist, and turn up-side down.
A short real time demo can be watched in my TED Talk: 

https://youtu.be/e-ZBNtzpF1Q?t=419

Here is the pipeline:
1.	Apply a bank of low pass filters and calculate the covariance matrices, then concatenated all together into a single feature set. All these are created and saved as models (genAll_.sh, genPreds.py)
2.	Using these features, train three algorithms: Logistic Regression, Convolutional Neural Network and Recurrent Neural Network (genPreds_CNN_Tim.py, genPreds_RNN.py)
3.	The above algorithms produce predictions that are then used to train another set of higher-level algorithms: XGBoost, Recurrent Neural Network, Neural Network and Convolutional Neural Network (XGB.py, NeuralNet.py)
4.	Diversity is achieved by running above algorithms with many modifications such as different subsets of metafeatures, Parametric ReLU instead of ReLU as activation, multiple layers, among many others. Also, several models are additionally bagged to increase their robustness (genEns_BagsModels.py, genEns_BagsSubjects.py). These models are then saved (genAll.sh, genEns.py, genSafe1.sh)
5.	A weighted mean of the meta-features above is applied to calculate the final prediction (WeightedMean.py). The means used are: arithmetic mean, geometric mean, power mean. A model here is an average of these three weighted means.
6.	Finally, the prediction is given by a YOLO file that is an average of 18 models coming from step 5 (genYOLO.py, genYOLO.sh)

The final system for rehabilitation was created at BIOS Colombia (www.biosco) during my term as a Senior Scientific Researcher, as part of the project REGALIAS.

Dependencies:
Python 2.7
Numpy 1.9.2
Scipy 0.16.0
scikit-learn 0.17.dev0
pyriemann 0.2.2 (from sources)
mne 0.10.dev0 (from sources)
XGBoost 0.40 (from sources)
Theano 0.7.0
CUDA 7.0.27
Keras 0.1.2 (from sources)
Lasagne 0.2.dev1 (from sources)
nolearn 0.6adev (from sources)
hyperopt 0.0.2 (from sources)
