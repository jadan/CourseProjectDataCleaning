Data: UCI HAR Dataset
The data was cleaned up according to the instructions given in the course project page. 
There were two resulting tidy data sets:
<ul>
	<li> The first data set is has dimensions 10,299 x 68 and consists of the mean() and std() columns from the original data, as well as a subject and an activity column.</li>
	<li> The second data set summarizes the first data set by subject (1-30) and activity(walking, walking downstairs, walking upstairs, sitting, standing, laying). Each of the other 66 columns is collapsed by using the mean function. The resulting table has dimensions 180 x 68./li>
</ul>


Transformations:

The following files from the original dataset were used to compose the resulting data sets:
<ul>
<li>features.txt</li>
<li>activity_labels.txt</li>
<li>X_train.txt</li>
<li>y_train.txt</li>
<li>subject_train.txt</li>
<li>X_test.txt</li>
<li>y_test.txt</li>
<li>subject_test.txt</li>
</ul>

The first step was to merge the subject and activity columns to the train and test data sets. After that, the data sets were merged into a single data set. 

The features table was used to extract the relevant columns which ultimately correspond to the columns used in the final data sets, this correspond to the following features in the original data set:
 { 1   2   3   4   5   6   7   8  43  44  45  46  47  48  83  84  85  86  87  88 123 124 125 
126 127 128 163 164 165 166 167 168 203 204 216 217 229 230 242 243 255 256 268 269 270 271
272 273 347 348 349 350 351 352 426 427 428 429 430 431 505 506 518 519 531 532 544 545 }

The variable were rename so that the names are more descriptive that in the original data set. The column names preceded by an "f" correspond to the measurements that were Fourier-transformed, and thus describe the same variables in the frequency domain. All the other variables are measured in the time domain. 
Linear jerk refers to the rate of change of the measurements produced by the accelerometer and angular jerk refers to the second derivative of the measurements produced by the gyroscope. The *-axis label denoted the axis in the corresponding sensor to which the measurements correspond. The body and gravity descriptors refer to the source of the acceleration. The mean and standard deviation descriptors are self-explanatory. The magnitude descriptor refers to the Euclidean norm of the variable in the 3 axis. 
Variables:

 [1] "subject"                                                 
 [2] "activity"                                                
 [3] "body acceleration mean x-axis"                           
 [4] "body acceleration mean y-axis"                           
 [5] "body acceleration mean z-axis"                           
 [6] "body acceleration standard deviation x-axis"             
 [7] "body acceleration standard deviation y-axis"             
 [8] "body acceleration standard deviation z-axis"             
 [9] "gravity acceleration mean x-axis"                        
[10] "gravity acceleration mean y-axis"                        
[11] "gravity acceleration mean z-axis"                        
[12] "gravity acceleration standard deviation x-axis"          
[13] "gravity acceleration standard deviation y-axis"          
[14] "gravity acceleration standard deviation z-axis"          
[15] "body linear jerk mean x-axis"                            
[16] "body linear jerk mean y-axis"                            
[17] "body linear jerk mean z-axis"                            
[18] "body linear jerk standard deviation x-axis"              
[19] "body linear jerk standard deviation y-axis"              
[20] "body linear jerk standard deviation z-axis"              
[21] "body angular velocity mean x-axis"                       
[22] "body angular velocity mean y-axis"                       
[23] "body angular velocity mean z-axis"                       
[24] "body angular velocity standard deviation x-axis"         
[25] "body angular velocity standard deviation y-axis"         
[26] "body angular velocity standard deviation z-axis"         
[27] "body angular jerk mean x-axis"                           
[28] "body angular jerk mean y-axis"                           
[29] "body angular jerk mean z-axis"                           
[30] "body angular jerk standard deviation x-axis"             
[31] "body angular jerk standard deviation y-axis"             
[32] "body angular jerk standard deviation z-axis"             
[33] "body acceleration magnitude mean"                        
[34] "body acceleration magnitude standard deviation"          
[35] "gravity acceleration magnitude mean"                     
[36] "gravity acceleration magnitude standard deviation"       
[37] "body linear jerk magnitude mean"                         
[38] "body linear jerk magnitude standard deviation"           
[39] "body angular velocity magnitude mean"                    
[40] "body angular velocity magnitude standard deviation"      
[41] "body angular jerk magnitude mean"                        
[42] "body angular jerk magnitude standard deviation"          
[43] "f body acceleration mean x-axis"                         
[44] "f body acceleration mean y-axis"                         
[45] "f body acceleration mean z-axis"                         
[46] "f body acceleration standard deviation x-axis"           
[47] "f body acceleration standard deviation y-axis"           
[48] "f body acceleration standard deviation z-axis"           
[49] "f body linear jerk mean x-axis"                          
[50] "f body linear jerk mean y-axis"                          
[51] "f body linear jerk mean z-axis"                          
[52] "f body linear jerk standard deviation x-axis"            
[53] "f body linear jerk standard deviation y-axis"            
[54] "f body linear jerk standard deviation z-axis"            
[55] "f body angular velocity mean x-axis"                     
[56] "f body angular velocity mean y-axis"                     
[57] "f body angular velocity mean z-axis"                     
[58] "f body angular velocity standard deviation x-axis"       
[59] "f body angular velocity standard deviation y-axis"       
[60] "f body angular velocity standard deviation z-axis"       
[61] "f body acceleration magnitude mean"                      
[62] "f body acceleration magnitude standard deviation"        
[63] "f bodybody linear jerk magnitude mean"                   
[64] "f bodybody linear jerk magnitude standard deviation"     
[65] "f bodybody angular velocity magnitude mean"              
[66] "f bodybody angular velocity magnitude standard deviation"
[67] "f bodybody angular jerk magnitude mean"                  
[68] "f bodybody angular jerk magnitude standard deviation" 