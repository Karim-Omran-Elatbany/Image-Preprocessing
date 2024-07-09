function [newimg] = exponentialnoise(oldimg, a)
    [R, C, L] = size(oldimg);

    if L == 3
        newimg = oldimg; % Initialize newimg with the original image
        
        for i = 0:1/255:1
            number_of_pixel = round(a * exp(-a * i) * R * C);
            
            for j = 1:number_of_pixel
                row = ceil(rand(1, 1) * R);
                column = ceil(rand(1, 1) * C);
                
                for k = 1:3
                    newimg(row, column, k) = min(255, max(0, oldimg(row, column, k) + i * 255));
                end
            end
        end

        % Contrast stretching (uncomment if needed)
%         for k = 1:3
%             mn = min(min(newimg(:, :, k)));
%             mx = max(max(newimg(:, :, k)));
%             newimg(:, :, k) = ((newimg(:, :, k) - mn) / (mx - mn)) * 255;
%         end

    else
        newimg = oldimg; % Initialize newimg with the original image

        for i = 0:1/255:1
            number_of_pixel = round(a * exp(-a * i) * R * C);
            
            for j = 1:number_of_pixel
                row = ceil(rand(1, 1) * R);
                column = ceil(rand(1, 1) * C);
                newimg(row, column) = min(255, max(0, oldimg(row, column) + i * 255));
            end
        end

        % Contrast stretching (uncomment if needed)
%         mn = min(min(newimg));
%         mx = max(max(newimg));
%         newimg = ((newimg - mn) / (mx - mn)) * 255;
    end
end
