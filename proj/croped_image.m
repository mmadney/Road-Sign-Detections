function [ cropedimg ] = croped_image( input_image , centers1 , radii1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  [he , wi , c] = size(input_image);
   centerx = round(centers1(1,1));
   centery = round(centers1(1,2));        
   raduis =  radii1(1);
   crop_img_ymax = (centery + raduis);
   crop_img_xmin = (centerx - raduis);
   crop_img_ymin = (centery - raduis);
   crop_img_xmax = (centerx + raduis);
   diameter = 2 * raduis;
   width = diameter; 
   height = diameter;
   x = 0;
   nxmax = crop_img_xmax ;
  while x < radii1/2 
      if(nxmax > wi)
            break;
       end
      nxmax = round(nxmax);
       R = input_image(centery,nxmax,1);    
       G = input_image(centery,nxmax,2);
       B = input_image(centery,nxmax,3);
       if(R > G && R > B)
            diff1 = R-G;
            diff2 = R-B;
           if(diff1>5 && diff2>5)
               width = width + 1;
           end
            nxmax = nxmax+1;
       else
           nxmax = nxmax+1;
       end
       x = x+1;
  end
  
  x = 0;
  nxmin = crop_img_xmin;
  while x < radii1/2  
      if(nxmin <= 0)
          break;
      end
      nxmin = round(nxmin);
       R = input_image(centery,nxmin,1);    
       G = input_image(centery,nxmin,2);
       B = input_image(centery,nxmin,3);
       if(R > G && R > B)
            diff1 = R-G;
            diff2 = R-B;
           if(diff1>5 && diff2 >5)
              width = width + 1;
              crop_img_xmin = crop_img_xmin - 1;
           end
           nxmin = nxmin -1;
       else
           nxmin = nxmin -1;
       end
       x = x+1;
  end   
  x = 0;
  nymin = crop_img_ymin;
  while x < radii1/2 
       if(nymin <= 0)
          break;
       end
       nymin = round(nymin);
       R = input_image(nymin,centerx,1);    
       G = input_image(nymin,centerx,2);
       B = input_image(nymin,centerx,3);
         if(R > G && R > B)
             diff1 = R-G;
             diff2 = R-B;
           if(diff1>5 && diff2 >5)
             height = height +1;
            crop_img_ymin = crop_img_ymin-1;
           end
           nymin = nymin -1;
        else
             nymin = nymin -1;
        end
       x = x+1;
  end
   
  x = 0;
  nymax = crop_img_ymax;
  while x < radii1/2   
       if(nymax > he)
          break;
       end
      nymax = round(nymax);
       R = input_image(nymax,centerx,1);    
       G = input_image(nymax,centerx,2);
       B = input_image(nymax,centerx,3);
       if(R > G && R > B)
           diff1 = R-G;
           diff2 = R-B;
           if(diff1>5 && diff2 >5)
               height = height +1;
           end
             nymax = nymax + 1;
       else
            nymax = nymax + 1;
       end
       x = x+1;
  end
   cropedimg = imcrop(input_image , [crop_img_xmin crop_img_ymin width height]);
end

