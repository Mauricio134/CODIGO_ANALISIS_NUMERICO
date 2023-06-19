function [t,y] = euler(f,t0,y0,T,p)
    h = T/p;
    t = zeros(1,p+1);
    y = zeros(1,p+1);
    t(1) = t0;
    y(1) = y0;
    for i = 2: p+1
        t(i) = t(i-1)+h;
        y(i) = y(i-1)+h*f(t(i-1),y(i-1));
    end
end