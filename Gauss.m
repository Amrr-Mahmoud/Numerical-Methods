clc;
clear all;
for i=1:3
    b(i,1)=input('3 right hand side: ');
end
%for loop takes right hand side of the 3 equations
b=reshape(b,3,1);
%reshape 3 right hand side elements to be a matrix
for i=1:3
    for j=1:3
        a(i,j)=input('3 coefficients of 3 equations: ');
    end
end
%nested for loops to take coefficients of equations
x1=input('x1: ');
x2=input('x2: ');
x3=input('x3: ');
%inputs 3 initial values of x1,x2,x3
err=input('error: ');
%inputs value of error

for i=1:3
    %for loop to check that co. are diagonally dominant
    if(i==1)
        if(a(1,1)<=a(1,2)+a(1,3))
            %if co. of x1 in first equation is less than sum of co. of
            %x2,x3 enters if to switch equations order
            for(i=2:3)
                if(a(i,1)>a(i,2)+a(i,3))
                    %switches equation 1 by 2 or 3 according to which
                    %one its x1 co. is greater than sum of co. of x2,x3
                    temp=a(1,1);
                    a(1,1)=a(i,1);
                    a(i,1)=temp;
                    temp=a(1,2);
                    a(1,2)=a(i,2);
                    a(i,2)=temp;
                    temp=a(1,3);
                    a(1,3)=a(i,3);
                    a(i,3)=temp;
                    temp=b(1);
                    b(1)=b(i);
                    b(i)=temp;
                end
            end
        end
    end
    if(i==2)
        if(a(2,2)<=a(2,1)+a(2,3))
            %if co. of x2 in second equation is less than sum of co. of
            %x1,x3 enters if to switch equations order
            for(i=1:2:3)
                if(a(i,2)>a(i,1)+a(i,3))
                    %switches equation 2 by 1 or 3 according to which
                    %one its x2 co. is greater than sum of co. of x1,x3
                    temp=a(2,1);
                    a(2,1)=a(i,1);
                    a(i,1)=temp;
                    temp=a(2,2);
                    a(2,2)=a(i,2);
                    a(i,2)=temp;
                    temp=a(2,3);
                    a(2,3)=a(i,3);
                    a(i,3)=temp;
                    temp=b(2);
                    b(2)=b(i);
                    b(i)=temp;
                end
            end
        end
    end
    if(i==3)
        if(a(3,3)<=a(3,1)+a(3,2))
            %if co. of x3 in third equation is less than sum of co. of
            %x1,x2 enters if to switch equations order
            for(i=1:2)
                if(a(i,3)>a(i,1)+a(i,2))
                    %switches equation 3 by 1 or 2 according to which
                    %one its x3 co. is greater than sum of co. of x1,x2
                    temp=a(3,1);
                    a(3,1)=a(i,1);
                    a(i,1)=temp;
                    temp=a(3,2);
                    a(3,2)=a(i,2);
                    a(i,2)=temp;
                    temp=a(3,3);
                    a(3,3)=a(i,3);
                    a(i,3)=temp;
                    temp=b(3);
                    b(3)=b(i);
                    b(i)=temp;
                end
            end
        end
    end
end
a=reshape(a,3,3);
%reshape 9 coefficients to form a matrix. each rows means equation
display(a);
display(b);
x1old=999;
x2old=999;
x3old=999;
%initializing x1old,x2old,x3old by a big value
n=0;
%count for number of iterations
fprintf('\t\tx1\t\tx2\t\tx3 \t\terror\n');
fprintf('\t%0.5f\t%0.5f\t%0.5f\t \n',x1,x2,x3);
      %print x1, x2, x3 of first value

while(abs(x1old-x1)>err||  abs(x2old-x2)>err||abs(x3old-x3)>err)
    % while loops until all 3 x difference(x of previous iteration - x of
    %current iteration) are less than given error
    x1old=x1;
    %holds value of x1 of prev. iteration to be used in cal. differenece
    x1=(1/a(1,1))*(b(1)-a(1,2)*x2-a(1,3)*x3);
    %calculates x value by using x2,x3 of prev iteration
    x2old=x2;
    %holds value of x2 of prev. iteration to be used in cal. differenece
    x2=(1/a(2,2))*(b(2)-a(2,1)*x1-a(2,3)*x3);
    %calculates x value by using x1 of current iteration,x3 of prev iteration
    x3old=x3;
    %holds value of x3 of prev. iteration to be used in cal. differenece
    x3=(1/a(3,3))*(b(3)-a(3,1)*x1-a(3,2)*x2);
    %calculates x value by using x1,x2 of current iteration
    n=n+1;
    maxerr=[abs(x1old-x1),abs(x2old-x2),abs(x3old-x3)];
    fprintf('\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',x1,x2,x3,max(maxerr));
          %print x1, x2, x3, error of inner values

end
maxerr=[abs(x1old-x1),abs(x2old-x2),abs(x3old-x3)];
fprintf('\t%0.5f\t%0.5f\t%0.5f\t%0.5f\n',x1,x2,x3,max(maxerr));
          %print x1, x2, x3, error of last value

%max(maxerr)
%x1
%x2
%x3
%n
