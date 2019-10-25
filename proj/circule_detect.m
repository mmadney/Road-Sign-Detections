function  [ Result , type ]  = circule_detect( input_image,im1,im2,im3,im4 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 Img = rgb2gray(input_image);
 [hight width c ] = size(input_image);
 Img = edge(Img,'canny',0.2);
% Img = bwareaopen(Img, 200);
  w2 = round(width/2);
  circle_found = 0;
 [centers1, radii1] = imfindcircles(Img,[15 w2],'ObjectPolarity','dark','Sensitivity',0.94 ,'EdgeThreshold',0.4);
 %figure, imshow(Img), hold on
  for index_img=1:size(radii1,1)
   h1 = viscircles(centers1(index_img,:),radii1(index_img),'Edgecolor','b');
   cropedimg = croped_image(input_image ,centers1(index_img , :) , radii1(index_img));
   [height ,width , c] = size(cropedimg);
    yimg = rgb2ycbcr(cropedimg);
    cr = yimg(:,:,3);
    crb = imbinarize(cr);
    BW2 = bwareaopen(crb, 350);
    [L,cc] = bwlabel(BW2);
   % figure, imshow(BW2), hold on
    [H , W , ~] = size(L);
    if (cc == 1)
    red = regionprops(BW2 , 'Area');
    red = struct2cell(red);
    red = cell2mat(red);
    a = width .* height;
    pr = red ./ a ;
    %dectect no parking no trun left 
        if( 0.25 < pr && pr < 0.44)
            s  = regionprops(BW2,'centroid');
            centroids = cat(1, s.Centroid);
            x = round(centroids(:,2));
            y = round(centroids(:,1));
            R = cropedimg(x,y,1);
            G = cropedimg(x,y,2);
            B = cropedimg(x,y,3);
            if(R > G && R > B)
                 diff1 = R-G;
                 diff2 = R-B;
                 if(diff1 > 10 && diff2 > 10)
                    Result = cropedimg;
                    
                    circle_found = 1;
                    %call here 
                    type = detect( cropedimg,im1,im2,im3,im4 );
                    %type = 'no parking no trun left';
                    break;
                 end
            end   
        end
%         figure, imshow(cropedimg), hold on
%         hold on
%         plot(centroids(:,1), centroids(:,2), 'b*')
%         hold off
   %detect no entry
        if( 0.48 < pr && pr < 0.6)
             s  = regionprops(BW2,'centroid');
             centroids = cat(1, s.Centroid);
             x = round(centroids(:,2));
             y = round(centroids(:,1));
             R = cropedimg(x,y,1);
             G = cropedimg(x,y,2);
             B = cropedimg(x,y,3);
            % if (R > 200 && G > 200 && B > 200)
            if (R > 150 && G > 150 && B > 150)
                     Result = cropedimg;
                     circle_found = 1;
                     type = 'No Entry Sign';
                     break;
             end 
        end    
        
    end
  if(circle_found == 0)
    if(cc == 2)
        red = regionprops(BW2 , 'Area');
        red = struct2cell(red(1,1));
        red = cell2mat(red(1,1));
        a = width .* height;
        pr = red ./ a ;
        s  = regionprops(BW2,'centroid');
        centroids = cat(1, s.Centroid);
%         figure, imshow(cropedimg), hold on
%         hold on
%         plot(centroids(:,1), centroids(:,2), 'b*')
%         hold off
%      
 %detect passing prohibted 
        if( 0.21 < pr && pr < 0.44)
            x1 = round(centroids(2,2));
            y1 = round(centroids(2,1));
            R1 = cropedimg(x1,y1,1);
            G1 = cropedimg(x1,y1,2);
            B1 = cropedimg(x1,y1,3);
            if(R1 > G1 && R1 > B1)
                 diff1 = R1-G1;
                 diff2 = R1-B1;
                 if(diff1 > 10 && diff2 > 10)
                        Result = cropedimg;
                        circle_found = 1;
                        type = 'passing prohibted';
                        break;

                 end
            end 
       end
        
    end
  end
  delete(h1);
  end
  
end


