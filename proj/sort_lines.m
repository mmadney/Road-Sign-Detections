function [ sorted_lines ] = sort_lines( tri_lines)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 tri_lines_sorted = [];
        for ii=1:length(tri_lines)
             number1 = tri_lines(ii).len;
            for jj=ii:length(tri_lines)
                 if(number1 < tri_lines(jj).len)
                 tri_lines_sorted = tri_lines(ii);
                 tri_lines(ii) = tri_lines(jj);
                 tri_lines(jj) = tri_lines_sorted;
                 end
            end
        end
        
        sorted_lines = tri_lines;

end

