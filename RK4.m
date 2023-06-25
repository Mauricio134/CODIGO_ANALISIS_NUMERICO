function [t,y] = RK4(f,t0,y0,T,p)
    h = T/p;
    t = zeros(p+1,1);
    y = zeros(p+1,1);
    t(1) = t0;
    y(1) = y0;
    for i = 2: p+1
        t(i) = t(i-1)+h;
        k1 = h*f(t(i-1),y(i-1));
        k2 = h*f(t(i-1)+(1/2)*h,y(i-1)+(1/2)*k1);
        k3 = h*f(t(i-1)+(1/2)*h,y(i-1)+(1/2)*k2);
        k4 = h*f(t(i-1)+h,y(i-1)+k3);
        y(i) = y(i-1)+(1/6)*k1+(2/6)*k2+(2/6)*k3+(1/6)*k4;
    end
end