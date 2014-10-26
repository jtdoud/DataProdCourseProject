Data Products Course Project: Exploring Use of Force Against Civilians in Armed Conflict
========================================================
author: Tucker Doud
date: October 25, 2014
font-family: calibri, arial, helvetica
transition: rotate

Project Focus
========================================================

Ever since the Iraq war of 2003, stories of armed conflict in the Middle East have dominated the headlines in western news outlets. Most recently, US led coalition forces have engaged ISIS led militants in Iraq and Syria. The case for military intervention will often use one or both of the following arguments:
- Self-defence or collective self-defence
- Humanitarian intervention  

Project Focus
========================================================
Both of these arguments have been used to justify recent armed mobilizations in the Middle East including Iraq, Syria, and Libya. My project, however, focuses on the argument of _humanitarian intvervention_ to prevent targeted civilian deaths.   

Using data from the [Uppsala Conflict Data Program] (http://www.pcr.uu.se/research/UCDP/) (UCDP) I suggest that if the motivation for war is humanitarian intervention, then history shows that Coalition forces may be better used in areas other that the Middle East.

The Data
========================================================
For my web app I use the UCDP One-sided Violence Data set. These data track intentional attacks on civilians by state or non-state groups from 1989 to 2013.

The original data set contains the following variables.

```
 [1] "ActorId"              "CoalitionComponents"  "ActorName"           
 [4] "Year"                 "BestFatalityEstimate" "LowFatalityEstimate" 
 [7] "HighFatalityEstimate" "IsGovernmentActor"    "Location"            
[10] "GWNOLocation"         "Region"               "Version"             
```
Note to grader: knitr echo set to false to save space.

Quick Exploration
========================================================
As we can see, targeted civilian deaths are far greater in regions _other than the Middle East_. A more detailed time-series will be presented in my web app.

```
Source: local data frame [5 x 2]

       Region Fatalities
1      Africa     662430
2        Asia      39248
3 Middle East      17937
4      Europe      17637
5    Americas       9057
```
<small>Note: The results above also contain the event of the Rwandan Genocide in 1994 in which approximately 500,000 African civilians were murdered. You will see in my app that even when excluding this extreme case, Africa still remains one of the worst areas for targeted civilian deaths.</small>
