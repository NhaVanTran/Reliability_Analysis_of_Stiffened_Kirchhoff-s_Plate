function [C]=eliminate_SP(x,y)
x1=x(1);x2=x(2);x3=x(3);y1=y(1);y2=y(2);y3=y(3);
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
mu30=(l23^2-l02^2)/l30^2;   mu02=(l30^2-l23^2)/l02^2;   mu23=(l02^2-l30^2)/l23^2;
A12=b30*(-c02)-(-c30)*b02;      % A12=2*area_Sub_triangle_1
A14=2*A12;

 % B1e8=d(SN1e)/dn|8 

% B1o8=d(SN1o)/dn|8

% B1e9=d(SN1e)/dn|9

% B1o9=d(SN1o)/dn|9

B1e8 =[ 0, 0, 0, -(l02*(((3*b02*c30)/2 - (3*b30*c02)/2)/(b02*c23 - b23*c02) + ((3*b02*c30)/4 - (3*b30*c02)/4)/(b02*c23 - b23*c02) + ((3*b23*c30)/2 - (3*b30*c23)/2)/(b02*c23 - b23*c02) - mu02*(((3*b02*c30)/4 - (3*b30*c02)/4)/(b02*c23 - b23*c02) - ((3*b02*c30)/2 - (3*b30*c02)/2)/(b02*c23 - b23*c02) + 3/4) + ((3*b02*c23)/4 - (3*b23*c02)/4 + (3*b02*c30)/2 - (3*b30*c02)/2 + (9*b23*c30)/4 - (9*b30*c23)/4 - (3*b02*c23*mu23)/4 + (3*b23*c02*mu23)/4 - (3*b23*c30*mu23)/4 + (3*b30*c23*mu23)/4)/(b02*c23 - b23*c02) - 3/4))/A14, (l02*((3*A12*b02)/(4*(b02*c23 - b23*c02)) + (A12*b23)/(2*(b02*c23 - b23*c02)) + (A12*(2*b02 + 3*b23 - b23*mu23))/(4*(b02*c23 - b23*c02)) - (A14*c23)/(2*l23^2) + (A12*b02*mu02)/(4*(b02*c23 - b23*c02))))/A14, -(l02*((3*A12*c02)/(4*(b02*c23 - b23*c02)) + (A12*c23)/(2*(b02*c23 - b23*c02)) + (A12*(2*c02 + 3*c23 - c23*mu23))/(4*(b02*c23 - b23*c02)) + (A14*b23)/(2*l23^2) + (A12*c02*mu02)/(4*(b02*c23 - b23*c02))))/A14, -(l02*((9*b02*c23)/4 - (9*b23*c02)/4 + (3*b02*c30)/2 - (3*b30*c02)/2 + (3*b23*c30)/4 - (3*b30*c23)/4 + (3*b02*c23*mu23)/4 - (3*b23*c02*mu23)/4 + (3*b23*c30*mu23)/4 - (3*b30*c23*mu23)/4))/(A14*(b23*c30 - b30*c23)), -(l02*((A12*(3*b23 + 2*b30 + b23*mu23))/(4*(b23*c30 - b30*c23)) + (A14*c23)/(2*l23^2)))/A14, (l02*((A12*(3*c23 + 2*c30 + c23*mu23))/(4*(b23*c30 - b30*c23)) - (A14*b23)/(2*l23^2)))/A14];
B1o8 =[ -(l02*(((3*b02*c23)/2 - (3*b23*c02)/2)/(b02*c30 - b30*c02) + ((3*b02*c23)/4 - (3*b23*c02)/4)/(b02*c30 - b30*c02) - ((3*b23*c30)/2 - (3*b30*c23)/2)/(b02*c30 - b30*c02) + mu02*(((3*b02*c23)/4 - (3*b23*c02)/4)/(b02*c30 - b30*c02) - ((3*b02*c23)/2 - (3*b23*c02)/2)/(b02*c30 - b30*c02) + 3/4) - 3/4))/A14, (l02*((3*A12*b02)/(4*(b02*c30 - b30*c02)) + (A12*b30)/(2*(b02*c30 - b30*c02)) - (A12*b02*mu02)/(4*(b02*c30 - b30*c02))))/A14, -(l02*((3*A12*c02)/(4*(b02*c30 - b30*c02)) + (A12*c30)/(2*(b02*c30 - b30*c02)) - (A12*c02*mu02)/(4*(b02*c30 - b30*c02))))/A14];
B1e9 =[ 0, 0, 0, -(l30*((3*b02*c23)/4 - (3*b23*c02)/4 + (3*b02*c30)/2 - (3*b30*c02)/2 + (9*b23*c30)/4 - (9*b30*c23)/4 - (3*b02*c23*mu23)/4 + (3*b23*c02*mu23)/4 - (3*b23*c30*mu23)/4 + (3*b30*c23*mu23)/4))/(A14*(b02*c23 - b23*c02)), (l30*((A12*(2*b02 + 3*b23 - b23*mu23))/(4*(b02*c23 - b23*c02)) - (A14*c23)/(2*l23^2)))/A14, -(l30*((A12*(2*c02 + 3*c23 - c23*mu23))/(4*(b02*c23 - b23*c02)) + (A14*b23)/(2*l23^2)))/A14, -(l30*(((3*b02*c23)/2 - (3*b23*c02)/2)/(b23*c30 - b30*c23) + ((3*b02*c30)/2 - (3*b30*c02)/2)/(b23*c30 - b30*c23) + ((3*b02*c30)/4 - (3*b30*c02)/4)/(b23*c30 - b30*c23) + mu30*(((3*b02*c30)/4 - (3*b30*c02)/4)/(b23*c30 - b30*c23) - ((3*b02*c30)/2 - (3*b30*c02)/2)/(b23*c30 - b30*c23) + 3/4) + ((9*b02*c23)/4 - (9*b23*c02)/4 + (3*b02*c30)/2 - (3*b30*c02)/2 + (3*b23*c30)/4 - (3*b30*c23)/4 + (3*b02*c23*mu23)/4 - (3*b23*c02*mu23)/4 + (3*b23*c30*mu23)/4 - (3*b30*c23*mu23)/4)/(b23*c30 - b30*c23) - 3/4))/A14, -(l30*((A12*b23)/(2*(b23*c30 - b30*c23)) + (3*A12*b30)/(4*(b23*c30 - b30*c23)) + (A12*(3*b23 + 2*b30 + b23*mu23))/(4*(b23*c30 - b30*c23)) + (A14*c23)/(2*l23^2) - (A12*b30*mu30)/(4*(b23*c30 - b30*c23))))/A14, (l30*((A12*c23)/(2*(b23*c30 - b30*c23)) + (3*A12*c30)/(4*(b23*c30 - b30*c23)) + (A12*(3*c23 + 2*c30 + c23*mu23))/(4*(b23*c30 - b30*c23)) - (A14*b23)/(2*l23^2) - (A12*c30*mu30)/(4*(b23*c30 - b30*c23))))/A14];
B1o9 =[ (l30*(((3*b02*c23)/2 - (3*b23*c02)/2)/(b02*c30 - b30*c02) - ((3*b23*c30)/2 - (3*b30*c23)/2)/(b02*c30 - b30*c02) - ((3*b23*c30)/4 - (3*b30*c23)/4)/(b02*c30 - b30*c02) + mu30*(((3*b23*c30)/4 - (3*b30*c23)/4)/(b02*c30 - b30*c02) - ((3*b23*c30)/2 - (3*b30*c23)/2)/(b02*c30 - b30*c02) + 3/4) + 3/4))/A14, -(l30*((A12*b02)/(2*(b02*c30 - b30*c02)) + (3*A12*b30)/(4*(b02*c30 - b30*c02)) + (A12*b30*mu30)/(4*(b02*c30 - b30*c02))))/A14, (l30*((A12*c02)/(2*(b02*c30 - b30*c02)) + (3*A12*c30)/(4*(b02*c30 - b30*c02)) + (A12*c30*mu30)/(4*(b02*c30 - b30*c02))))/A14];
 

% A22=2*area_Sub_triangle_2
% o: The centroid of triangle element

%                                          3-node (1)
%                                            o
%                                           / \

%								L3=0      /		\   L2=0

%										/ Sub-T_2 \

%                         1-node  (2) o-------------o 0-node (3)
b10= y1-y0;                 b03=y0-y3;                  b31=y3-y1;
c10= x1-x0;                 c03=x0-x3;                  c31=x3-x1;
l10=sqrt(b10^2+c10^2);      l03=sqrt(b03^2+c03^2);      l31=sqrt(b31^2+c31^2);
mu10=(l31^2-l03^2)/l10^2;   mu03=(l10^2-l31^2)/l03^2;   mu31=(l03^2-l10^2)/l31^2;
A22=b10*(-c03)-(-c10)*b03;      % A22=2*area_Sub_triangle_2
A24=2*A22;

B2e9 =[ (l03*((3*b03*c10)/2 - (3*b10*c03)/2 + (9*b03*c31)/4 - (9*b31*c03)/4 - (3*b10*c31)/4 + (3*b31*c10)/4 + (3*b03*c31*mu31)/4 - (3*b31*c03*mu31)/4 - (3*b10*c31*mu31)/4 + (3*b31*c10*mu31)/4))/(A24*(b10*c31 - b31*c10)), (l03*((A22*(2*b10 + 3*b31 + b31*mu31))/(4*(b10*c31 - b31*c10)) - (A24*c31)/(2*l31^2)))/A24, -(l03*((A22*(2*c10 + 3*c31 + c31*mu31))/(4*(b10*c31 - b31*c10)) + (A24*b31)/(2*l31^2)))/A24, 0, 0, 0, -(l03*(((3*b03*c10)/2 - (3*b10*c03)/2)/(b03*c31 - b31*c03) + ((3*b03*c10)/4 - (3*b10*c03)/4)/(b03*c31 - b31*c03) - ((3*b10*c31)/2 - (3*b31*c10)/2)/(b03*c31 - b31*c03) - mu03*(((3*b03*c10)/4 - (3*b10*c03)/4)/(b03*c31 - b31*c03) - ((3*b03*c10)/2 - (3*b10*c03)/2)/(b03*c31 - b31*c03) + 3/4) + ((3*b03*c10)/2 - (3*b10*c03)/2 + (3*b03*c31)/4 - (3*b31*c03)/4 - (9*b10*c31)/4 + (9*b31*c10)/4 - (3*b03*c31*mu31)/4 + (3*b31*c03*mu31)/4 + (3*b10*c31*mu31)/4 - (3*b31*c10*mu31)/4)/(b03*c31 - b31*c03) - 3/4))/A24, (l03*((3*A22*b03)/(4*(b03*c31 - b31*c03)) + (A22*b31)/(2*(b03*c31 - b31*c03)) + (A22*(2*b03 + 3*b31 - b31*mu31))/(4*(b03*c31 - b31*c03)) - (A24*c31)/(2*l31^2) + (A22*b03*mu03)/(4*(b03*c31 - b31*c03))))/A24, -(l03*((3*A22*c03)/(4*(b03*c31 - b31*c03)) + (A22*c31)/(2*(b03*c31 - b31*c03)) + (A22*(2*c03 + 3*c31 - c31*mu31))/(4*(b03*c31 - b31*c03)) + (A24*b31)/(2*l31^2) + (A22*c03*mu03)/(4*(b03*c31 - b31*c03))))/A24];
B2o9 =[ -(l03*(((3*b03*c31)/2 - (3*b31*c03)/2)/(b03*c10 - b10*c03) + ((3*b03*c31)/4 - (3*b31*c03)/4)/(b03*c10 - b10*c03) + ((3*b10*c31)/2 - (3*b31*c10)/2)/(b03*c10 - b10*c03) + mu03*(((3*b03*c31)/4 - (3*b31*c03)/4)/(b03*c10 - b10*c03) - ((3*b03*c31)/2 - (3*b31*c03)/2)/(b03*c10 - b10*c03) + 3/4) - 3/4))/A24, (l03*((3*A22*b03)/(4*(b03*c10 - b10*c03)) + (A22*b10)/(2*(b03*c10 - b10*c03)) - (A22*b03*mu03)/(4*(b03*c10 - b10*c03))))/A24, -(l03*((3*A22*c03)/(4*(b03*c10 - b10*c03)) + (A22*c10)/(2*(b03*c10 - b10*c03)) - (A22*c03*mu03)/(4*(b03*c10 - b10*c03))))/A24];
B2e7 =[ (l10*(((3*b03*c10)/2 - (3*b10*c03)/2)/(b10*c31 - b31*c10) + ((3*b03*c10)/4 - (3*b10*c03)/4)/(b10*c31 - b31*c10) + ((3*b03*c31)/2 - (3*b31*c03)/2)/(b10*c31 - b31*c10) - mu10*(((3*b03*c10)/2 - (3*b10*c03)/2)/(b10*c31 - b31*c10) - ((3*b03*c10)/4 - (3*b10*c03)/4)/(b10*c31 - b31*c10) + 3/4) + ((3*b03*c10)/2 - (3*b10*c03)/2 + (9*b03*c31)/4 - (9*b31*c03)/4 - (3*b10*c31)/4 + (3*b31*c10)/4 + (3*b03*c31*mu31)/4 - (3*b31*c03*mu31)/4 - (3*b10*c31*mu31)/4 + (3*b31*c10*mu31)/4)/(b10*c31 - b31*c10) + 3/4))/A24, (l10*((3*A22*b10)/(4*(b10*c31 - b31*c10)) + (A22*b31)/(2*(b10*c31 - b31*c10)) + (A22*(2*b10 + 3*b31 + b31*mu31))/(4*(b10*c31 - b31*c10)) - (A24*c31)/(2*l31^2) - (A22*b10*mu10)/(4*(b10*c31 - b31*c10))))/A24, -(l10*((3*A22*c10)/(4*(b10*c31 - b31*c10)) + (A22*c31)/(2*(b10*c31 - b31*c10)) + (A22*(2*c10 + 3*c31 + c31*mu31))/(4*(b10*c31 - b31*c10)) + (A24*b31)/(2*l31^2) - (A22*c10*mu10)/(4*(b10*c31 - b31*c10))))/A24, 0, 0, 0, -(l10*((3*b03*c10)/2 - (3*b10*c03)/2 + (3*b03*c31)/4 - (3*b31*c03)/4 - (9*b10*c31)/4 + (9*b31*c10)/4 - (3*b03*c31*mu31)/4 + (3*b31*c03*mu31)/4 + (3*b10*c31*mu31)/4 - (3*b31*c10*mu31)/4))/(A24*(b03*c31 - b31*c03)), (l10*((A22*(2*b03 + 3*b31 - b31*mu31))/(4*(b03*c31 - b31*c03)) - (A24*c31)/(2*l31^2)))/A24, -(l10*((A22*(2*c03 + 3*c31 - c31*mu31))/(4*(b03*c31 - b31*c03)) + (A24*b31)/(2*l31^2)))/A24];
B2o7 =[ (l10*(((3*b03*c31)/2 - (3*b31*c03)/2)/(b03*c10 - b10*c03) + ((3*b10*c31)/2 - (3*b31*c10)/2)/(b03*c10 - b10*c03) + ((3*b10*c31)/4 - (3*b31*c10)/4)/(b03*c10 - b10*c03) + mu10*(((3*b10*c31)/2 - (3*b31*c10)/2)/(b03*c10 - b10*c03) - ((3*b10*c31)/4 - (3*b31*c10)/4)/(b03*c10 - b10*c03) + 3/4) + 3/4))/A24, -(l10*((A22*b03)/(2*(b03*c10 - b10*c03)) + (3*A22*b10)/(4*(b03*c10 - b10*c03)) + (A22*b10*mu10)/(4*(b03*c10 - b10*c03))))/A24, (l10*((A22*c03)/(2*(b03*c10 - b10*c03)) + (3*A22*c10)/(4*(b03*c10 - b10*c03)) + (A22*c10*mu10)/(4*(b03*c10 - b10*c03))))/A24];
 
 
% A32=2*area_Sub_triangle_3
% o: The centroid of triangle element

%                                          o-node (3)
%                                            o
%                                           / \

%								L2=0      /		\   L1=0

%										/ Sub-T_1 \

%                         1-node  (1) o-------------o 3-node (2)
%                                            L3=0 
b20= y2-y0;                 b01=y0-y1;                  b12=y1-y2;
c20= x2-x0;                 c01=x0-x1;                  c12=x1-x2;
l20=sqrt(b20^2+c20^2);      l01=sqrt(b01^2+c01^2);      l12=sqrt(b12^2+c12^2);
mu20=(l12^2-l01^2)/l20^2;   mu01=(l20^2-l12^2)/l01^2;   mu12=(l01^2-l20^2)/l12^2;
A32=b20*(-c01)-(-c20)*b01;      % A22=2*area_Sub_triangle_3
A34=2*A32;

B3e7 =[ -(l01*(((3*b01*c20)/2 - (3*b20*c01)/2)/(b01*c12 - b12*c01) + ((3*b01*c20)/4 - (3*b20*c01)/4)/(b01*c12 - b12*c01) + ((3*b12*c20)/2 - (3*b20*c12)/2)/(b01*c12 - b12*c01) - mu01*(((3*b01*c20)/4 - (3*b20*c01)/4)/(b01*c12 - b12*c01) - ((3*b01*c20)/2 - (3*b20*c01)/2)/(b01*c12 - b12*c01) + 3/4) + ((3*b01*c12)/4 - (3*b12*c01)/4 + (3*b01*c20)/2 - (3*b20*c01)/2 + (9*b12*c20)/4 - (9*b20*c12)/4 - (3*b01*c12*mu12)/4 + (3*b12*c01*mu12)/4 - (3*b12*c20*mu12)/4 + (3*b20*c12*mu12)/4)/(b01*c12 - b12*c01) - 3/4))/A34, (l01*((3*A32*b01)/(4*(b01*c12 - b12*c01)) + (A32*b12)/(2*(b01*c12 - b12*c01)) + (A32*(2*b01 + 3*b12 - b12*mu12))/(4*(b01*c12 - b12*c01)) - (A34*c12)/(2*l12^2) + (A32*b01*mu01)/(4*(b01*c12 - b12*c01))))/A34, -(l01*((3*A32*c01)/(4*(b01*c12 - b12*c01)) + (A32*c12)/(2*(b01*c12 - b12*c01)) + (A32*(2*c01 + 3*c12 - c12*mu12))/(4*(b01*c12 - b12*c01)) + (A34*b12)/(2*l12^2) + (A32*c01*mu01)/(4*(b01*c12 - b12*c01))))/A34, -(l01*((9*b01*c12)/4 - (9*b12*c01)/4 + (3*b01*c20)/2 - (3*b20*c01)/2 + (3*b12*c20)/4 - (3*b20*c12)/4 + (3*b01*c12*mu12)/4 - (3*b12*c01*mu12)/4 + (3*b12*c20*mu12)/4 - (3*b20*c12*mu12)/4))/(A34*(b12*c20 - b20*c12)), -(l01*((A32*(3*b12 + 2*b20 + b12*mu12))/(4*(b12*c20 - b20*c12)) + (A34*c12)/(2*l12^2)))/A34, (l01*((A32*(3*c12 + 2*c20 + c12*mu12))/(4*(b12*c20 - b20*c12)) - (A34*b12)/(2*l12^2)))/A34, 0, 0, 0];
B3o7 =[ -(l01*(((3*b01*c12)/2 - (3*b12*c01)/2)/(b01*c20 - b20*c01) + ((3*b01*c12)/4 - (3*b12*c01)/4)/(b01*c20 - b20*c01) - ((3*b12*c20)/2 - (3*b20*c12)/2)/(b01*c20 - b20*c01) + mu01*(((3*b01*c12)/4 - (3*b12*c01)/4)/(b01*c20 - b20*c01) - ((3*b01*c12)/2 - (3*b12*c01)/2)/(b01*c20 - b20*c01) + 3/4) - 3/4))/A34, (l01*((3*A32*b01)/(4*(b01*c20 - b20*c01)) + (A32*b20)/(2*(b01*c20 - b20*c01)) - (A32*b01*mu01)/(4*(b01*c20 - b20*c01))))/A34, -(l01*((3*A32*c01)/(4*(b01*c20 - b20*c01)) + (A32*c20)/(2*(b01*c20 - b20*c01)) - (A32*c01*mu01)/(4*(b01*c20 - b20*c01))))/A34];
B3e8 =[ -(l20*((3*b01*c12)/4 - (3*b12*c01)/4 + (3*b01*c20)/2 - (3*b20*c01)/2 + (9*b12*c20)/4 - (9*b20*c12)/4 - (3*b01*c12*mu12)/4 + (3*b12*c01*mu12)/4 - (3*b12*c20*mu12)/4 + (3*b20*c12*mu12)/4))/(A34*(b01*c12 - b12*c01)), (l20*((A32*(2*b01 + 3*b12 - b12*mu12))/(4*(b01*c12 - b12*c01)) - (A34*c12)/(2*l12^2)))/A34, -(l20*((A32*(2*c01 + 3*c12 - c12*mu12))/(4*(b01*c12 - b12*c01)) + (A34*b12)/(2*l12^2)))/A34, -(l20*(((3*b01*c12)/2 - (3*b12*c01)/2)/(b12*c20 - b20*c12) + ((3*b01*c20)/2 - (3*b20*c01)/2)/(b12*c20 - b20*c12) + ((3*b01*c20)/4 - (3*b20*c01)/4)/(b12*c20 - b20*c12) + mu20*(((3*b01*c20)/4 - (3*b20*c01)/4)/(b12*c20 - b20*c12) - ((3*b01*c20)/2 - (3*b20*c01)/2)/(b12*c20 - b20*c12) + 3/4) + ((9*b01*c12)/4 - (9*b12*c01)/4 + (3*b01*c20)/2 - (3*b20*c01)/2 + (3*b12*c20)/4 - (3*b20*c12)/4 + (3*b01*c12*mu12)/4 - (3*b12*c01*mu12)/4 + (3*b12*c20*mu12)/4 - (3*b20*c12*mu12)/4)/(b12*c20 - b20*c12) - 3/4))/A34, -(l20*((A32*b12)/(2*(b12*c20 - b20*c12)) + (3*A32*b20)/(4*(b12*c20 - b20*c12)) + (A32*(3*b12 + 2*b20 + b12*mu12))/(4*(b12*c20 - b20*c12)) + (A34*c12)/(2*l12^2) - (A32*b20*mu20)/(4*(b12*c20 - b20*c12))))/A34, (l20*((A32*c12)/(2*(b12*c20 - b20*c12)) + (3*A32*c20)/(4*(b12*c20 - b20*c12)) + (A32*(3*c12 + 2*c20 + c12*mu12))/(4*(b12*c20 - b20*c12)) - (A34*b12)/(2*l12^2) - (A32*c20*mu20)/(4*(b12*c20 - b20*c12))))/A34, 0, 0, 0];
B3o8 =[ (l20*(((3*b01*c12)/2 - (3*b12*c01)/2)/(b01*c20 - b20*c01) - ((3*b12*c20)/2 - (3*b20*c12)/2)/(b01*c20 - b20*c01) - ((3*b12*c20)/4 - (3*b20*c12)/4)/(b01*c20 - b20*c01) + mu20*(((3*b12*c20)/4 - (3*b20*c12)/4)/(b01*c20 - b20*c01) - ((3*b12*c20)/2 - (3*b20*c12)/2)/(b01*c20 - b20*c01) + 3/4) + 3/4))/A34, -(l20*((A32*b01)/(2*(b01*c20 - b20*c01)) + (3*A32*b20)/(4*(b01*c20 - b20*c01)) + (A32*b20*mu20)/(4*(b01*c20 - b20*c01))))/A34, (l20*((A32*c01)/(2*(b01*c20 - b20*c01)) + (3*A32*c20)/(4*(b01*c20 - b20*c01)) + (A32*c20*mu20)/(4*(b01*c20 - b20*c01))))/A34];
 
B=[ B1e8+B3e8;...
    B1e9+B2e9;...
    B3e7+B2e7];
Bo=[B1o8+B3o8;...
    B1o9+B2o9;...
    B3o7+B2o7];
C=-inv(Bo)*B;%size(3x9)
end

