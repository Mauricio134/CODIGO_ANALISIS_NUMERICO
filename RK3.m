function [t,y] = RK3(f,t0,y0,T,p)
    h = T/p;
    t = zeros(p+1,1);
    y = zeros(p+1,1);
    t(1) = t0;
    y(1) = y0;
    for i = 2: p+1
        t(i) = t(i-1)+h;
        k1 = h*f(t(i-1),y(i-1));
        k2 = h*f(t(i-1)+(1/2)*h,y(i-1)+(1/2)*k1);
        k3 = h*f(t(i-1)+(3/4)*h,y(i-1)+(3/4)*k2);
        y(i) = y(i-1)+(2/9)*k1+(1/3)*k2+(4/9)*k3;
    end
end