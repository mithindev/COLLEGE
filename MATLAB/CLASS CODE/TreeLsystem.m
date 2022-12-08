%% TREE L SYSTEM
clc; clear;

Strg='F[+X][-X]FX';
  Str1=strrep(Strg,'X',Strg);
  Str2=strrep(Str1,'X',Strg);
  Str3=strrep(Str2,'X',Strg);
Strc=Str3;
n=length(Strc);
index=0;
% following three arrays are to track branching in the tree
posx(1)=0
posy(1)=0;
posa(1)=90
% following variables are for drawing line segment
oldx=0;
oldy=0;
newx=0;
newy=0;
% after plotting a segment, newx and newy become oldx and oldy
cura=90; % Current angle
rota=30;

% on getting a command above will be updated
for i=1:n
    comd=Strc(i);
    switch(comd)
     case 'F'   
            newx=oldx+cos(deg2rad(cura));
            newy=oldy+sin(deg2rad(cura));
            line([oldx newx],[oldy newy]);
            drawnow;
            oldx=newx;
            oldy=newy;
      case 'X'      
            newx=oldx+cos(deg2rad(cura));
            newy=oldy+sin(deg2rad(cura)); 
            line([oldx newx],[oldy newy]);
            drawnow;
            oldx=newx;
            oldy=newy;
       case '+'
          cura=mod(cura+rota,360);
       case '-'
          cura=mod(cura-rota,360);
       case '[' 
           index=index+1;
           posx(index)=oldx;
           posy(index)=oldy;
           posa(index)=cura;
           
        case ']'  
          oldx= posx(index);
          oldy= posy(index);
          cura=posa(index);
          index=index-1;
    end
end
                      

