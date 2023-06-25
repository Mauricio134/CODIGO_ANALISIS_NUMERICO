f = @(t,y) t.*cos(t)+y./t+t;
t0 = 1;
y0 = 1+sin(1);
T = 3;
p = 10;
dy = @(t,y) 1/t;
dt = @(t,y) cos(t) - t.*sin(t)-y/(t.^2)+1;
[t1,y1] = euler(f,t0,y0,T,p);
[t2,y2] = taylor(t0,y0,T,p,f,dy,dt);
[t3,y3] = heun(f,t0,y0,T,p);
[t4,y4] = RK3(f,t0,y0,T,p);
[t5,y5] = RK4(f,t0,y0,T,p);
n = length(y1);

% Definir anchos de campo
t_width = 8;
data_width = 12;

% Imprimir encabezado
fprintf('|%*s|%*s|%*s|%*s|%*s|%*s|\n', t_width, 't', data_width, 'Euler', data_width, 'Taylor', data_width, 'Heun', data_width, 'RK3', data_width, 'RK4');;
%fprintf('|%s|%s|%s|%s|%s|%s|\n', repmat('-', 1, t_width), repmat('-', 1, data_width), repmat('-', 1, data_width), repmat('-', 1, data_width), repmat('-', 1, data_width), repmat('-', 1, data_width))

% Imprimir datos
for k = 1:n
    fprintf('|%*.6f|%*.6f|%*.6f|%*.6f|%*.6f|%*.6f|\n', t_width, t1(k), data_width, y1(k), data_width, y2(k), data_width, y3(k), data_width, y4(k), data_width, y5(k));
end
