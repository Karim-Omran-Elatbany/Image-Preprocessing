function [newimg] = uniformnoise(oldimg, a, b)
    [R, C, L] = size(oldimg);
    number_of_pixel = round((1 / (b - a)) * R * C);
    
    if L == 3
        newimg = oldimg; % Initialize newimg with the original image
        
        for i = a:b
            for j = 1:number_of_pixel
                row = ceil(rand(1, 1) * R);
                column = ceil(rand(1, 1) * C);
                for y = 1:3
                    newimg(row, column, y) = oldimg(row, column, y) + i;
                end
            end
        end
        
%         % Contrast stretching
          for y = 1:3
              mn = min(min(newimg(:, :, y)));
              mx = max(max(newimg(:, :, y)));
              newimg(:, :, y) = ((newimg(:, :, y) - mn) / (mx - mn)) * 255;
          end
        
    else
        newimg = oldimg; % Initialize newimg with the original image

        for i = a:b
            for j = 1:number_of_pixel
                row = ceil(rand(1, 1) * R);
                column = ceil(rand(1, 1) * C);
                newimg(row, column) = oldimg(row, column) + i;
            end
        end

        % Contrast stretching
         mn = min(min(newimg));
         mx = max(max(newimg));
         newimg = ((newimg - mn) / (mx - mn)) * 255;
         
    end
end
