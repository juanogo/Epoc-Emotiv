#!/usr/bin/env sh
array=( val test )
for i in "${array[@]}"
do
    # generate validation preds
    # cov models
    python genPreds.py models/CovJuan_500.yml $i
    python genPreds.py models/CovJuan_500_1-15.yml $i
    python genPreds.py models/CovJuan_500_20-35.yml $i
    python genPreds.py models/CovJuan_500_70-150.yml $i
    python genPreds.py models/CovJuan_250_35Hz.yml $i
    python genPreds.py models/CovJuan_500_35Hz.yml $i
    python genPreds.py models/CovERP_dist.yml $i
    # PolynomialFeatures cov model
    python genPreds.py models/CovJuan_500_poly.yml $i
    python genPreds.py models/CovJuan_500_1-15_poly.yml $i
    python genPreds.py models/CovJuan_500_20-35_poly.yml $i
    python genPreds.py models/CovJuan_500_70-150_poly.yml $i
    python genPreds.py models/CovJuan_250_35Hz_poly.yml $i
    python genPreds.py models/CovJuan_500_35Hz_poly.yml $i
    python genPreds.py models/CovERP_dist_poly.yml $i
    # JuanD cov model
    python genPreds.py models/CovJuanD_256_35Hz.yml $i
    python genPreds.py models/CovJuanD_500_35Hz.yml $i
    # aggregated cov model
    python genPreds.py models/CovJuan_All.yml $i
    python genPreds.py models/CovJuan_old_All.yml $i

    # Low pass EEG model
    python genPreds.py models/FBL.yml $i
    python genPreds.py models/FBL_delay.yml $i

    # Hybrid model (cov + FBL)
    python genPreds.py models/FBLC_256pts.yml $i
    python genPreds.py models/FBLCR_256.yml $i

    # NN models
    python genPreds_RNN.py models/RNN_FB_delay4000.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_2D_30Hz.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_2D_30Hz_shorterDelay.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_1D_30Hz.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_1D_30Hz_shorterDelay.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_1D_5Hz.yml $i
    python genPreds_CNN_Tim.py models/cnn_script_1D_7-30Hz.yml $i

done
