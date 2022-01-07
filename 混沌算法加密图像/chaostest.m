
N=3;
m(1)=0.22
for i = 1:N-1  
    m(i+1) = 4 * m(i) - 4 * m(i)^2;
    m
end 