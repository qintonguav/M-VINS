# M-VINS
Monocular Visual-Inertial System
(source code will be released after paper acception)

VINS is a real-time SLAM for **Visual-Inertial** system. This code implements an initilization-free **monocular** sliding window based Visual-Inertial odometry and a basic AR demo, which is running on ROS ubuntu. 

**Videos:**

<a href="https://www.dropbox.com/s/b2gr4pd8n2pplnk/ar_demo.mp4?dl=0" target="_blank"><img src="https://github.com/qintony/VINS/blob/devel/support_material/img/small_ar.png" 
alt="ar_demo" width="280" height="210" border="30" /></a>


##3. Monocular Examples on EuRoC dataset
1. Download [EuRoC MAV Dataset](http://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets). Although it contains stereo cameras, we only use one camera.

2. Modify path in VINS/vins_estimator/launch/euroc_dataset.launch. Change **dataset_bag_path** to the your downloaded dataset folder. Change **dataset_name** to MH_01_easy, MH_02_easy, MH_03_medium, MH_04_difficult, MH_05_difficult, V1_01_easy, V1_02_medium, V1_03_difficult, V2_01_easy, V2_02_medium, V2_03_difficult. When you enter the following command, wait a moment to load bag file. In RVIZ, you will see the raw image, tracked image, path and feature points.
```
	roslaunch vins_estimator euroc_dataset.launch
```
We test all the datas in EuRoc dataset, followings are the thumbnail of our result (Green line is VINS result, red line is ground truth). 

<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_01/MH_01.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_02/MH_02.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_03/MH_03.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_04/MH_04.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_05/MH_05.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_01/V1_01.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_02/V1_02.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_03/V1_03.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_01/V2_01.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_02/V2_02.png width="280" height="210" />
<img src=https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_03/V2_03.png width="280" height="210" />

We put our detailed results in (/support_material/dataset_result/). [MH_01](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_01/result.png)，
[MH_02](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_02/result.png)，
[MH_03](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_03/result.png)，
[MH_04](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_04/result.png)，
[MH_05](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/MH_05/result.png)，
[V1_01](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_01/result.png)，
[V1_02](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_02/result.png)，
[V1_03](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V1_03/result.png)，
[V2_01](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_01/result.png)，
[V2_02](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_02/result.png)，
[V2_03](https://github.com/qintony/M-VINS/blob/master/support_material/dataset_result/V2_03/result.png)
We run these dataset with WINDOW_SIZE 15, MAX_SOLVER_TIME 60ms, MAX_FEATURE_COUNT 200 in real time. If you carefully set the parameters and give more computational resource, you will get better performance.



