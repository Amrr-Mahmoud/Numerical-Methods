f=input('f:'); %please enter this function @(x)x^3
 f %your function..
 a=input('a:'); % 0 (lower limit of integration)
 b=input('b:'); % 2 (upper limit of integration)
 n=input('n: '); % 4 (number of intervals)
 
 h=(b-a)/n; %step size (your answer must be 0.5)
 h

s = f(a)+f(b); %to calculate the first and the last point

for F = 1:2:n-1
    s=s+4*f(a+F*h); %to calculate the points the multiplied by 4 in the formula 
end

for F = 2:2:n-2
    s=s+2*f(a+F*h);  %to calculate the points the multiplied by 2 in the formula 
end

F=h/3*s %the formula and  it's shows your result (your answer must be 4)
