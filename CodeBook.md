## Code book

-------------------------------------------------
Each variable is named in following format:

`type_of_signal Feature - Stat - Dimension(if applicable)`

All features are normalized and vary from -1 to 1

**Type of signal:**

`t`         -   time domain signals

`f`         -   frequency domain signals (Fast Fourier Transform)

**Feature:**

`BodyAcc`  - raw body accelerometer signal **(3D)**

`GravityAcc` - raw gravity accelerometer signal **(3D)**

`BodyAccJerk` - body accelerometer jerk **(3D)**

`BodyGyro` - raw body gyroscope signal **(3D)**

`BodyGyroJerk` - raw body gyroscope jerk **(3D)**

`BodyAccMag`- body accelerometer magnitude (Eclidean norm)

`GravityAccMag`- gravity accelerometer magnitude (Eclidean norm)

`BodyAccJerkMag` - body accelerometer jerk magnitude (Eclidean norm)

`BodyGyroMag`- body gyroscope magnitude (Eclidean norm)

`BodyGyroJerkMag`- body gyroscope jerk magnitude (Eclidean norm)

**Statistic**

`Mean`

`SD`

**Dimension (for 3D features)**

`X`

`Y`

`Z`

