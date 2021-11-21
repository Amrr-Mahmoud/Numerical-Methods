
%Taking Inputs
a= input('Enter The First Interval: ');
b= input('Enter The Second Interval: ');
f= input('Enter The Function: ');
n= input('Enter Number of points: ');
h=(b-a)/n; %calculating the distance between points
x(1)=a; %declaring the first element of the array by the first interval
fx(1)=f(a);% declaring the first element of the fx array by the function of first interval 
Res=(b-a)*((f(a)+f(b))/2);%fulfilling the simple method formula
fprintf("Simple Result: %f \n ",Res); %printing the result
