function [ x , y ] = intersection_point(start1,start2,end1,end2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

                    p1 = polyfit(start1,end1,1);
                    p2 = polyfit(start2,end2,1);
                    %calculate intersection
                    x_intersect = fzero(@(x) polyval(p1-p2,x),3);
                    y_intersect = polyval(p1,x_intersect);
                    line(start1,end1);
                    hold on;
                    line(start2,end2);
                    plot(x_intersect,y_intersect,'m*')
                    x = x_intersect;
                    y = y_intersect;
end

