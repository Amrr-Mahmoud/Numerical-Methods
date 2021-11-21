
%Taking Inputs
a= input('Enter Coeffecients Of The System Between []: ');
b= input('Enter The Right Hand Side Of The System Between []: ');
x = input('Enter The Initials Between []: '); 
tol =input('Enter The Tolerance: ');
n = length(b);
k=1;
%This part checks if the matrix is diagonally dominant
%Loop of rows
for i = 1 : n        
Summation = 0;
Res=0;
%Loop of columns
for j = 1 : n 
if j ~= i %this condition skips the coeffecient we need to compare with the others in equation
Summation = Summation + a(i,j); %This part adds the 2 other coeffecients        
else if(j==i) %saving the diagonal coeffecient
Res= a(i,j);
end   
end
end
if(Summation>Res) %checking if the summation of the 2 coeffecients is bigger than the diagonal coeffecient
fprintf("Please Enter A Diagonally Dominant Matrix \n");
break;
end      
end
%Printing the header of the table
fprintf("K \t");
%This loop prints the X's header
for h=1:n
fprintf(" \t X(%d) \t",h);
end
fprintf(" |(Xk-x)|");
fprintf(" \n0 \t %f \t %f \t %f ",x);
%This loop presents our steps to solve the problem by the general formula
while true %The iterations loop
for i = 1 : n %Rows Loop    
Summation = 0;
for j = 1 : n %Columns Loop
if j ~= i %This part applies the part of general formula: Summation from j=1 & j not equal i to n (aij*xj)
Summation = Summation + a(i,j)*x(j);
end
end
Xk(i) = 1/a(i,i) * (b(i)-Summation); %Substituting in general formula
diff(i)=(abs(Xk(i) - x(i)));  %Calculating the Difference of stoping condition 
end
dm=max(diff(:)); %Getting max value of difference
fprintf('\n%d \t %f \t %f \t %f \t %f',k,Xk,dm) % Printing the result
if(dm<tol)%Checking the stopping condition if |(Xk-x)| < tolerance     
  break
end
    x = Xk; %Saving the old Xk to fulfill the |(Xk-x)| condition
    k=k+1; % iterations Counter
end
fprintf("\n Xapproximate: %f ",Xk); %Printing the Xapproximate
  
