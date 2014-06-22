Codebook
========

Notes:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'Time.' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time.Body.Accerlation-XYZ and Time.Gravity.Acceleration-[XYZ]) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time.Body.Acceleration.Jerk-[XYZ] and Time.Body.Gyroscope.Jerk-[XYZ]). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time.Body.Acceleration.Magnitude, Time.Gravity.Acceleration.Magnitude, Time.Body.Acceleration.Jerk.Magnitude, Time.Body.Gyroscope.Magnitude and Time.Body.Gyroscope.Jerk.Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FFT.Body.Acceleration-[XYZ], FFT.Body.Acceleration.Jerk-[XYZ], FFT.Body.Gyroscope-[XYZ], FFT.Body.Acceleration.Jerk.Magnitude, FFT.Body.Gyroscope.Magnitude, FFT.Body.Gyro.Jerk.Magnitude. (Note the 'FFT.' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-X, -Y, or -Z' is used to denote tri-axial signals in the X, Y and Z directions.

Time.Body.Acceleration.[XYZ]
Time.Gravity.Acceleration.[XYZ]
Time.Gravity.Body.Acceleration.Jerk.[XYZ]
Time.Body.Body.Gyroscope.[XYZ]
Time.Body.Gyroscope.Jery.[XYZ]
Time.Body.Acceleration.Magnitude
Time.Gravity.Acceleration.Magnitude
Time.Body.Acceleration.Jerk.Magnitude
Time.Body.Gyroscope.Magnitude
Time.Body.Gyroscope.Jerk.Magnitude
FFT.Body.Acceleration.[XYZ]
FFT.Body.Acceleration.Jerk.[XYZ]
FFT.Body.Gyroscope.[XYZ]
FFT.Body.Acceleration.Magnitude
FFT.Body.Acceleration.Jerk.Magnitude
FFT.Body.Gyroscope.Mangitude
FFT.Body.Gyroscope.Jerk.Magnitude

The set of variables that were estimated from these signals (filtered from the original dataset) as indicated in the field names : 

.MEAN: Mean value
.STDDEV: Standard deviation

There are a total of 68 variables. For brevity, the names of the fields have been summarised.

|Variable Name | Format | Variable Label | Valid range | Value for missing | Value for inapplicable |
---------------|--------|----------------|-------------|-------------------|------------------------|
|Activity| One of SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, LAYING | A description of the activity the subject was enganing in in the time domain | SITTING, STANDiNG, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS, LAYING | NA | 
|Subject|   integer |   A unique number indicating a given subject   |   1-30 | NA | NA |       
|FFT.Body.Acceleration.Jerk.[MEAN or STDDEV].[XYZ] p     | floating point | See Notes.           | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Acceleration.Magnitude.[MEAN or STDDEV]      | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Acceleration.[MEAN or STDDEV].[XYZ]      | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Body.Acceleration.Jerk.Magnitude.[MEAN or STDDEV]      | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Body.Gyroscope.Jerk.Magnitude.[MEAN or STDDEV]      | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Body.Gyroscope.Magnitude.[MEAN or STDDEV]      | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|FFT.Body.Gyroscope.[MEAN or STDDEV].[XYZ]      | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Acceleration.Jerk.Magnitude.[MEAN or STDDEV]      | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Acceleration.Jerk.[MEAN or STDDEV].[XYZ]       | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Acceleration.Magnitude.[MEAN]       | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Acceleration.[MEAN or STDDEV].[XYZ] | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Gyroscope.Jerk.Magnitude.[MEAN or STDDEV]      | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Gyroscope.Jerk.[MEAN or STDDEV].[XYZ]      | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Gyroscope.Magnitude.[MEAN or STDDEV]       | floating point |  See Notes.              | 1.0 to -1.0 | NA     |   NA       |                   
|Time.Body.Gyroscope.[MEAN or STDDEV].[XYZ]        | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                                   
|Time.Gravity.Acceleration.Magnitude.[MEAN or STDDEV]        | floating point | See Notes.               | 1.0 to -1.0 | NA     |   NA       |                        
|Time.Gravity.Acceleration.[MEAN or STDDEV].[XYZ]        | floating point |   See Notes.             | 1.0 to -1.0 | NA     |   NA       |                               
