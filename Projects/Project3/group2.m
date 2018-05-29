%% Project 3 
%% Created By: William Ayers & Clarisa Leu-Rodriguez
data=load('project3data.txt');
timeData=data(:,1);
aData=data(:,2);

partB=spline(timeData,aData);
trapint(partB,0,2,100)