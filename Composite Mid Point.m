%Taking Inputs
a= input('Enter The First Interval: ');
b= input('Enter The Second Interval: ');
f= input('Enter The Function: ');
n= input('Enter Number of points: ');
h=(b-a)/n; %calculating the distance between points
x(1)=a; %declaring the first element of the array by the first interval
fx(1)=f(a);% declaring the first element of the fx array by the function of first interval 
summation=0;
%Printing the header of the table
 fprintf('\t x \t \t  F(x) \n');
 fprintf(' %f \t %f\n',x(1),fx(1));
  %This loop fills the table values and prints it
for i=2:n+1 %Starting this loop from 2 because we initialized the first element of the arrays already
 x(i)=x(i-1)+h; %adding on the initial x the stepsize to fill the table 
 fx(i)=f(x(i)); % filling the fx table
 fprintf(' %f \t %f \n',x(i),fx(i)); %printing the table values
end
for j=2:2:n %Since in the problem our index starts with 0 we take the odd numbers but since our code starts the index of 1 
    %we have to take the even numbers elements by starting from 2 and
    %incrementing the loop by 2
summation=summation+fx(j);
end
fprintf("Composite Result: %f\n",2*h*(summation));%multiplying the summation by 2h and prints the composite result
