This codebook is a modification of the orignial codebook from:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
See the README.txt file for more details.
 
 Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals (time.Accelerometer-XYZ and time.Gyroscope-XYZ).
These time domain signals were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time.Body.Accelerometer-XYZ and time.Gravity.Accelerometer-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals 
(time.Body.AccelerometerJerk-XYZ and time.Body.GyroscopeJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(time.Body.AccelerometerMagnitude, time.Gravity.AccelerometerMagnitude, time.Body.AccelerometerJerkMagnitude, time.Body.GyroscopeMagnitude, time.Body.GyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the frequency domain signal: frequency.Body.Accelerometer-XYZ, frequency.Body.AccelerometerJerk-XYZ, frequency.Body.Gyroscope-XYZ, frequency.Body.AccelerometerJerkMagnitude, frequency.Body.GyroscopeMagnitude, frequency.Body.GyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

time.Body.Accelerometer-XYZ
time.GravityAccelerometer-XYZ
time.Body.AccelerometerJerk-XYZ
time.Body.Gyroscope-XYZ
time.Body.GyroscopeJerk-XYZ
time.Body.AccelerometerMagnitude
time.Gravity.AccelerometerMagnitude
time.Body.AccelerometerJerkMagnitude
time.Body.GyroscopeMagnitude
time.Body.GyroscopeJerkMagnitude
frequency.Body.Accelerometer-XYZ
frequency.Body.AccelerometerJerk-XYZ
frequency.Body.Gyroscope-XYZ
frequency.Body.AccelerometerMagnitude
frequency.Body.AccelerometerJerMagnitude
frequency.Body.GyroscopeMagnitude
frequency.Body.GyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravity.Mean
time.Body.AccelerometerMean
time.Body.AccelerometerJerkMean
time.Body.GyroscopeMean
time.Body.GyroscopeJerkMean

The data was collected for 30 different subjects (SUBJECTS), and divided into 6 different activities (ACTIVITY.NAME).
The data for each variables in this dataset are averages per subject-activity pairs.
