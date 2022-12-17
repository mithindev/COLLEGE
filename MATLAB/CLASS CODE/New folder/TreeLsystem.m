%% TREE L SYSTEM
clc; clear;

strg = 'F[+X][-X]FX';
str1 = strrep(strg, 'X', strg);
str2 = strrep(str1, 'X',strg);
str3 = strrep(str2, 'X', strg);
strc = str3;

% arrays to track the branching in the tree;

posx(1) = 0;
posy(1) = 0;
posa(1) = 90;

% for drawing line segment

oldx = 0;
oldy = 0;
newx = 0;
newy = 0;

% angles

cura = 90;
rota = 30;

n = length(strc);
index = 0;

for i = 1:n
    comd = strc(i);
    switch (comd)
        case 'F'
            newx = oldx + cos(deg2rad(cura));
            newy = oldy + sin(deg2rad(cura));
            line([oldx newx], [oldy newy]);
            drawnow;
            oldx = newx;
            oldy = newy;
        case 'X'
            newx = oldx + cos(deg2rad(cura));
            newy = oldy + sin(deg2rad(cura));
            line([oldx newx], [oldy newy]);
            drawnow;
            oldx = newx;
            oldy = newy;
        case '+'
            cura = mod(cura+rota, 360);
            case '-'
                cura = mod(cura - rota, 360);
            case '['
                index = index + 1;
                posx(index) = oldx;
                posy(index) = oldy;
                posa(index) = cura;
            case ']'
                oldx = posx(index);
                oldy = posy(index);
                cura = posa(index);
                index = index-1;
    end
end
