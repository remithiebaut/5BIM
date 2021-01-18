clear;
close all;
I = imread('echantillon/INSA_Odyssey2025/Carcass1_1+1_Ortho.tif');
rgb = I(:,:,1:3);
%figure,imshow(rgb);

Nrows=ceil(63024/240)-1;
Ncols=ceil(21199/240)-1;

cd()
cd('C:\Users\remit\OneDrive\Documents\Code\5BIM\projet_5bim\imagettes')


% Data = zeros([Nrows,Ncols,480,480,3]);

for i=0:Nrows
    %the next line is helping us keeping track of the progress
    i
    
    %the size of the big image isn't divisible by 480, we need to take 
    % care of the border
    startRow=min(63024-479,1+i*240);
    stopRow=min(63024,(i+2)*240);
    for j=0:Ncols
        startCol=min(21199-479,1+j*240);
        stopCol=min(21199,(j+2)*240);
        imagetteName= append(int2str(i),"_",int2str(j),".png");
        imagette=rgb(startRow:stopRow,startCol:stopCol,:);
        %we need to get rid of the mask part
        if imagette ~= 255*ones(480,480,3)
            imwrite(imagette,imagetteName);
        end
    end        
end


