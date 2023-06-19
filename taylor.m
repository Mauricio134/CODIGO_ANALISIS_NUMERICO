function [t,y] = taylor(t0,y0,T,p,f,dy,dt)
    h = T/p;
    t = zeros(1,p+1);
    y = zeros(1,p+1);
    t(1) = t0;
    y(1) = y0;
    for n = 2:p+1
        t(n) = t(n-1) + h;
        y(n) = y(n-1) + f(t(n-1), y(n-1))*h + (dt(t(n-1), y(n-1)) + dy(t(n-1),y(n-1)) + f(t(n-1), y(n-1)))/2*h^2;
    end
end