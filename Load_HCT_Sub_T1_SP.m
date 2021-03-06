function [fe]=Load_HCT_Sub_T1_SP(Load,x,y)
x1=x(1);    x2=x(2);    x3=x(3);    y1=y(1);    y2=y(2);    y3=y(3);
x0=(x1+x2+x3)/3;    y0=(y1+y2+y3)/3;
% A12=2*area_Sub_triangle_1
% o: The centroid of triangle element

%                                          3-node (2)
%                                            o
%                                           / \

%								L1=0      /		\   L3=0

%										/ Sub-T_1 \

%                         0-node  (3) o-------------o 2-node (1)
%                                            L2=0 

b30=y3-y0;                  b02=y0-y2;                  b23=y2-y3;
c30=x3-x0;                  c02=x0-x2;                  c23=x2-x3;
l30=sqrt(b30^2+c30^2);      l02=sqrt(b02^2+c02^2);      l23=sqrt(b23^2+c23^2);
% mu30=(l23^2-l02^2)/l30^2;   mu02=(l30^2-l23^2)/l02^2;   
mu23=(l02^2-l30^2)/l23^2;
A12=b30*(-c02)-(-c30)*b02;      % A12=2*area_Sub_triangle_1
A14=2*A12;

fe1 =[ (5*b02*c23 - 5*b23*c02 - 2*b02*c30 + 2*b30*c02 + 7*b23*c30 - 7*b30*c23 - b02*c23*mu23 + b23*c02*mu23 - b23*c30*mu23 + b30*c23*mu23)/(80*(b02*c23 - b23*c02)), ((A12*b02*l23^2)/120 - (7*A12*b23*l23^2)/240 + (A12*b23*l23^2*mu23)/240)/(l23^2*(b02*c23 - b23*c02)) + (A14*c23)/(120*l23^2), (A14*b23)/(120*l23^2) - ((A12*c02*l23^2)/120 - (7*A12*c23*l23^2)/240 + (A12*c23*l23^2*mu23)/240)/(l23^2*(b02*c23 - b23*c02)), (7*b02*c23 - 7*b23*c02 - 2*b02*c30 + 2*b30*c02 + 5*b23*c30 - 5*b30*c23 + b02*c23*mu23 - b23*c02*mu23 + b23*c30*mu23 - b30*c23*mu23)/(80*(b23*c30 - b30*c23)), ((7*A12*b23*l23^2)/240 - (A12*b30*l23^2)/120 + (A12*b23*l23^2*mu23)/240)/(l23^2*(b23*c30 - b30*c23)) + (A14*c23)/(120*l23^2), (A14*b23)/(120*l23^2) - ((7*A12*c23*l23^2)/240 - (A12*c30*l23^2)/120 + (A12*c23*l23^2*mu23)/240)/(l23^2*(b23*c30 - b30*c23)), -(b02*c23 - b23*c02 - b02*c30 + b30*c02 + b23*c30 - b30*c23)/(20*(b02*c30 - b30*c02)), (A12*(b02 - b30))/(60*(b02*c30 - b30*c02)), -(A12*(c02 - c30))/(60*(b02*c30 - b30*c02))];
  
fe=Load*A12*fe1';
end

