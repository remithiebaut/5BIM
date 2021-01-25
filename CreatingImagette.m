clear;
close all;
I = imread('echantillon/INSA_Odyssey2025/Carcass1_1+1_Ortho.tif');

NrowsInPixel=size(I,1);
NcolsInPixel=size(I,2);
ImagetteSize=480;

%Convert pixels coordinates into imagettes coordinates
DemiImagetteSize=ImagetteSize/2;
Nrows=ceil(NrowsInPixel/DemiImagetteSize)-2;
Ncols=ceil(NcolsInPixel/DemiImagetteSize)-2;

%change the path according to your files
cd()
cd('C:\Users\remit\OneDrive\Documents\Code\5BIM\Projet5BIM\imagettes')

%Too big to sort, we need to save them directly

%we use this later ijn the loop we need to define it before for speed
test=255*ones(ImagetteSize,ImagetteSize);
for i=0:Nrows
    %the next line is helping us keeping track of the progress
    i
    %the size of the big image isn't divisible by 480, we need to take 
    % care of the border
    startRow=min(1+NrowsInPixel-ImagetteSize,1+i*DemiImagetteSize);
    stopRow=min(NrowsInPixel,(i+2)*DemiImagetteSize);
    for j=0:Ncols
        startCol=min(1+NcolsInPixel-ImagetteSize,1+j*DemiImagetteSize);
        stopCol=min(NcolsInPixel,(j+2)*DemiImagetteSize);
        imagetteName= append(int2str(i),"_",int2str(j),".png");
        imagette=I(startRow:stopRow,startCol:stopCol,1:3);
        %we need to get rid of the mask part
        imagetteMask=I(startRow:stopRow,startCol:stopCol,4);
        if isequal(imagetteMask,test)
            imwrite(imagette,imagetteName);
        end
    end        
end


