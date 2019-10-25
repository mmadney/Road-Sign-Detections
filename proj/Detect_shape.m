
function [ Result , type ] = Detect_shape( input_image,im1,im2,im3,im4)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Img = rgb2gray(input_image);
%Img = imbinarize(Img);
% Img = im2bw(Img , 0.7);,
% H=fspecial('laplacian',1);
% Img=imfilter(Img,H);
% SE = [0 1 0;1 1 1;0 1 0];
% for i=1:1
% Img = imdilate(Img,SE);
% end
Img = edge(Img,'canny',0.46);
[H,theta,rho] = hough(Img,'ThetaResolution',0.5);
peaks = houghpeaks(H,15,'Threshold',0.2*max(H(:)));
lines = houghlines(Img,theta,rho,peaks,'FillGap',20,'MinLength',15);
tri_lines_positve = [];
tri_lines_negative = [];
diamond_positive =[];
diamond_negitive =[];
horzintal_lines = [];
visted_line_diamond1= 0;
visted_line_diamond2= 0;
for i=1:length(lines)
    % detect triangle lines /
  if(lines(i).theta >= 26 && lines(i).theta <= 34)
        start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','green');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;
       tri_lines_positve = [tri_lines_positve;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       tri_lines_positve = sort_lines(tri_lines_positve);

  end
   % detect triangle lines \
       if(lines(i).theta <= -26 && lines(i).theta >= -34)
           start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','blue');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;
       tri_lines_negative = [tri_lines_negative;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       tri_lines_negative = sort_lines(tri_lines_negative);
       end
       
        % detect diamond lines \
       if(lines(i).theta <= -42 && lines(i).theta >= -47)
           start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','blue');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;
       diamond_negitive = [diamond_negitive;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       diamond_negitive = sort_lines(diamond_negitive);
       end
       
       
        % detect diamond lines /
      if(lines(i).theta >= 42 && lines(i).theta <= 47)
        start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','green');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;       
       diamond_positive = [diamond_positive;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       diamond_positive = sort_lines(diamond_positive);

      end
     if(lines(i).theta < -86 && lines(i).theta > -93)
        start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','magenta');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;
       horzintal_lines = [horzintal_lines;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       horzintal_lines = sort_lines(horzintal_lines);
     end
     
      if(lines(i).theta > 86 && lines(i).theta < 93)
        start_end = [lines(i).point1; lines(i).point2];
        plot(start_end(:,1),start_end(:,2),'LineWidth',2,'Color','magenta');
          % Plot beginnings and ends of lines
       plot(start_end(1,1),start_end(1,2),'x','LineWidth',2,'Color','yellow');
       plot(start_end(2,1),start_end(2,2),'x','LineWidth',2,'Color','red');
       %get length and save in struct vector 
       len = norm(lines(i).point1 - lines(i).point2);
       filed1 = 'point1';
       filed2 = 'point2';
       filed3 = 'len';
       value = len;
       horzintal_lines = [horzintal_lines;struct(filed1,lines(i).point1,filed2,lines(i).point2,filed3,value)];
       horzintal_lines = sort_lines(horzintal_lines);
     end
end         
%found tringles according to thier lines 
 found_triangle = 0;
 for i=1:length(tri_lines_positve)
     for j=1:length(tri_lines_negative)
          v1 = tri_lines_positve(i).point2 - tri_lines_positve(i).point1;
          v2 = tri_lines_negative(j).point2 - tri_lines_negative(j).point1;
          angel=ceil((acos(sum(v1.*v2)/(norm(v1)*norm(v2)))*180)/pi);
          if (angel > 57 && angel < 65)
              %line1 strat
              xp1 = tri_lines_positve(i).point1(1,1);
              yp1 = tri_lines_positve(i).point1(1,2);
              %line1 end
              xp2 = tri_lines_positve(i).point2(1,1);
              yp2 = tri_lines_positve(i).point2(1,2);
              %line2 strat
              xp3 = tri_lines_negative(j).point1(1,1);
              yp3 = tri_lines_negative(j).point1(1,2);
              %line2 end
              xp4 = tri_lines_negative(j).point2(1,1);
              yp4 = tri_lines_negative(j).point2(1,2); 
              
              %line1
              xs1=[xp1 xp2];
              ys1= [yp1 yp2];
              
              %line2
              xs2=[xp3 xp4];
              ys2=[yp3 yp4];
             [xi1 , yi1] = intersection_point(xs1,xs2,ys1,ys2);
             for h=1:length(horzintal_lines)
                 %line3 strat
                  xp5 = horzintal_lines(h).point1(1,1);
                  yp5 = horzintal_lines(h).point1(1,2);
                  
                  %line3 end
                  xp6 = horzintal_lines(h).point2(1,1);
                  yp6 = horzintal_lines(h).point2(1,2);
                   %line1
                    xs1=[xp1 xp2];
                    ys1= [yp1 yp2];
                   %line3
                    xs2=[xp5 xp6];
                    ys2=[yp5 yp6];
                   [xi2,yi2] = intersection_point(xs1,xs2,ys1,ys2);
                   len_line = norm([xp2 yp2] - [xi2 yi2]);
                      if(len_line > 0 && len_line < 30) 
                           %line2
                            xs1= [xp3 xp4];
                            ys1= [yp3 yp4];
                           %line3
                            xs2=[xp5 xp6];
                            ys2=[yp5 yp6];
                            [xi3,yi3] = intersection_point(xs1,xs2,ys1,ys2);
                            len_line = norm([xp4 yp4] - [xi3 yi3]);
                            if(len_line > 0 && len_line < 30)
                                 found_triangle = 1;
                                  xs = [xi1 xi2 xi3];
                                  ys = [yi1 yi2 yi3];
                                  minx = min(xs);
                                  miny = min(ys);
                                  maxx = max(xs);
                                  maxy = max(ys);
                                  width = maxx - minx;
                                  hight = maxy - miny;
                                  img   =  imcrop(input_image , [minx miny-10 width hight+20]);
                                  figure, imshow(img), hold on
                                  yimg = rgb2ycbcr(img);
                                  cr = yimg(:,:,1);
                                  crb = imbinarize(cr);
                                  BW2 = bwareaopen(crb, 500);
                                  BW2 = ~BW2;
                                  Area = regionprops(BW2 , 'Area');
                                  Area = struct2cell(Area);
                                  Area = cell2mat(Area);
                                  point_area = Area(1,3);
                                  trinagle_area = Area(1,1);
                                  pr = point_area ./ trinagle_area ;
                                  if(pr >= 0.11)
                                      type = 'Roadway narrows';
                                      
                                  else
                                       type = 'Warning'; 
                                  end
                                  
                                  Result = img ;
                                   break;
                                
                            end
                      end
             end
             if(found_triangle == 1)
                break;
             end                  
          end
         
     end
     if(found_triangle == 1)
         break;
     end
 end
 %found diamond according to thier lines 
  found_diamond = 0;
     if(found_triangle == 0)
         for i=1:length(diamond_positive)
             for j=1:length(diamond_negitive)
                  v1 = diamond_positive(i).point2 - diamond_positive(i).point1;
                  v2 = diamond_negitive(j).point2 - diamond_negitive(j).point1;
                   angel=ceil((acos(sum(v1.*v2)/(norm(v1)*norm(v2)))*180)/pi);
                  if (angel > 87 && angel <= 93)
                      visted_line_diamond1 = i;
                      visted_line_diamond2 = j;
                      %line1 strat_end 
                      xp1 = diamond_positive(i).point2(1,1);
                      yp1 = diamond_positive(i).point2(1,2);
                      xp2 = diamond_positive(i).point1(1,1);
                      yp2 = diamond_positive(i).point1(1,2);
                      %line2 strat_end
                      xp3 = diamond_negitive(j).point1(1,1);
                      yp3 = diamond_negitive(j).point1(1,2);
                      xp4 = diamond_negitive(j).point2(1,1);
                      yp4 = diamond_negitive(j).point2(1,2);
                      points = [xp1 yp1;xp2 yp2;xp3 yp3;xp4 yp4];
                      %line1
                      xs1=[xp1 xp2];
                      ys1= [yp1 yp2];
                      %line2
                      xs2=[xp3 xp4];
                      ys2=[yp3 yp4];
                     [xi1 , yi1] = intersection_point(xs1,xs2,ys1,ys2);
                     for x=1:length(diamond_positive)
                         if (x == visted_line_diamond1)
                             continue;
                         end
                         for y=1:length(diamond_negitive)
                             if(y == visted_line_diamond2) 
                                 continue;
                             end
                              v1 = diamond_positive(x).point2 - diamond_positive(x).point1;
                              v2 = diamond_negitive(y).point2 - diamond_negitive(y).point1;
                              angel=ceil((acos(sum(v1.*v2)/(norm(v1)*norm(v2)))*180)/pi);
                              if (angel > 87 && angel <= 93)
                                   %line1 strat_end 
                                      xp5 = diamond_positive(x).point2(1,1);
                                      yp5 = diamond_positive(x).point2(1,2);
                                      xp6 = diamond_positive(x).point1(1,1);
                                      yp6 = diamond_positive(x).point1(1,2);
                                      %line2 strat_end
                                      xp7 = diamond_negitive(y).point1(1,1);
                                      yp7 = diamond_negitive(y).point1(1,2);
                                      xp8 = diamond_negitive(y).point2(1,1);
                                      yp8 = diamond_negitive(y).point2(1,2);
                                      ts = [xp1 yp1;xp2 yp2;xp3 yp3;xp4 yp4];
                                      %line1
                                       xs1=[xp5 xp6];
                                       ys1= [yp5 yp6];
                                      %line2
                                      xs2=[xp7 xp8];
                                      ys2=[yp7 yp8];
                                      [xi2 , yi2] = intersection_point(xs1,xs2,ys1,ys2);
                                      diffx = abs((xi1-xi2));
                                      diffy = abs((yi1-yi2));
                                     if((0<= diffx && diffx < 4)|| 0 <= diffy && diffy < 4)
                                         xs = [xp1 xp2 xp3 xp4 xp5 xp6 xp7 xp8];
                                         ys = [yp1 yp2 yp3 yp4 yp5 yp6 yp7 yp8];
                                            minx = min(xs);
                                            miny = min(ys);
                                            maxx = max(xs);
                                            maxy = max(ys);
                                            width = maxx - minx;
                                            hight = maxy - miny;
                                            img   =  imcrop(input_image, [minx miny width hight]);
                                            found_diamond = 1;
                                            cr = yimg(:,:,1);
                                            crb = imbinarize(cr);
                                            BW2 = bwareaopen(crb, 500);
                                            BW2 = ~BW2;
                                            type = 'Signal ahead';
                                            type = 'Deaf/blind people'; 
                                            Result = img ;
                                            break;
                                     end
                                   
                              end
                              
                              if(found_diamond == 1)
                                break;
                              end
                         end
                         
                         if(found_diamond == 1)
                              break;
                         end
                    
                     end
                      if(found_diamond == 1)
                              break;
                       end
                  end
                  if(found_diamond == 1)
                       break;
                  end
             end
             
                  if(found_diamond == 1)
                       break;
                  end
         end
     end
     if(found_triangle == 0 && found_diamond == 0)
        [Result , type ]= circule_detect(input_image,im1,im2,im3,im4);
     end
       
 end
     


