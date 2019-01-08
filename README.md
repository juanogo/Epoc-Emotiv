# Epoc-Emotiv

This code predicts the imaginary hand motion of an amputee patient (undergoing phantom limb rehabilitation with an augmented reality-based technology). I used EEG-based signal processing on EEG data extracted from an Emotiv Epoc brain-interface (EDF files) in CSV format. The movements to be detected are six: __hand extension, hand contraction, finger waving, closed fist, open fist, and turn up-side down.__
A short real time demo can be watched in my TED Talk: 

[Watch it on youtube](https://youtu.be/e-ZBNtzpF1Q?t=419)

![result](https://user-images.githubusercontent.com/38761819/50808388-4f070800-12cc-11e9-81e2-3fea93976c42.png)

## Here is the pipeline:

__1.__	    Apply a bank of low pass filters and calculate the covariance matrices, then concatenated all together into a single feature set. All these are created and saved as models (genAll_.sh, genPreds.py)

__2.__	    Using these features, train three algorithms: __Logistic Regression, Convolutional Neural Network and Recurrent Neural Network__ (genPreds_CNN_Tim.py, genPreds_RNN.py)

__3.__	    The above algorithms produce predictions that are then used to train another set of higher-level algorithms: __XGBoost, Recurrent Neural Network, Neural Network and Convolutional Neural Network__ (XGB.py, NeuralNet.py)

__4.__	    __Diversity__ is achieved by running above algorithms with many modifications such as different subsets of metafeatures, Parametric ReLU instead of ReLU as activation, multiple layers, among many others. Also, several models are additionally bagged to increase their robustness (genEns_BagsModels.py, genEns_BagsSubjects.py). These models are then saved (genAll.sh, genEns.py, genSafe1.sh)

__5.__	    A weighted mean of the meta-features above is applied to calculate the final prediction (WeightedMean.py). The means used are: arithmetic mean, geometric mean, power mean. A model here is an average of these three weighted means.

__6.__	    Finally, the prediction is given by a __YOLO__ (you only look once) file that is an average of 18 models coming from step 5 (genYOLO.py, genYOLO.sh)

The final system for rehabilitation was created at BIOS Colombia (www.biosco) during my term as a Senior Scientific Researcher, as part of the project REGALIAS.

## Dependencies:

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

## Juan Gomez, PhD
