clear;
close all;
I = imread('echantillon/INSA_Odyssey2025/Carcass1_1+1_Ortho.tif');

Nrows=ceil(63024/240)-2;
Ncols=ceil(21199/240)-2;

%change the path according to your files
cd()
cd('C:\Users\remit\OneDrive\Documents\Code\5BIM\Projet5BIM\imagettes')

%Too big to sort, we need to save them directly
% Data = zeros([Nrows,Ncols,480,480,3]);

%we use this later ijn the loop we need to define it before for speed
test=255*ones(480,480);
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
        imagette=I(startRow:stopRow,startCol:stopCol,1:3);
        %we need to get rid of the mask part
        imagetteMask=I(startRow:stopRow,startCol:stopCol,4);
        if isequal(imagetteMask,test)
            imwrite(imagette,imagetteName);
        end
    end        
end


