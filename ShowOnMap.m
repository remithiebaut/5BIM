% L'objectif de  cette fonction est de faire apparaître sur la grande image
% de base l'ensemble des imagettes qui contiennent l'un ou l'autre des
% contaminants.
clear;
close all;

I = imread('echantillon/INSA_Odyssey2025/Carcass1_1+1_Ortho.tif');

imshow(I(:,:,1:3));

NrowsInPixel=size(I,1);
NcolsInPixel=size(I,2);
ImagetteSize = 480;

drawContaminant('Selection_imagettes/Carcasse','white',NrowsInPixel,NcolsInPixel,ImagetteSize)
drawContaminant('Selection_imagettes/Barrière','magenta',NrowsInPixel,NcolsInPixel,ImagetteSize)
drawContaminant('Selection_imagettes/élément chelou','red',NrowsInPixel,NcolsInPixel,ImagetteSize)
drawContaminant('Selection_imagettes/Trace de pneu','black',NrowsInPixel,NcolsInPixel,ImagetteSize)

%legend(['Carcasse','Barrière','élément chelou','Trace de pneu'],['white','magenta','red','black'],'Location','northwest')


function drawContaminant(path,color,NrowsInPixel,NcolsInPixel,ImagetteSize)

    files=dir(path);
    %drop '.' and '..' paths
    files=files(3:end);

    for p = 1:numel(files)
        drawImagette(files(p).name,color,NrowsInPixel,NcolsInPixel,ImagetteSize);
    end    

 
end


function drawImagette(name,color,NrowsInPixel,NcolsInPixel,ImagetteSize)
    
    DemiImagetteSize = ImagetteSize/2;

    name = string(name(1:end-4));
    coords=split(name,'_');

    i=coords(1);
    j=coords(2);

    i=str2double(i);
    j=str2double(j);

    %find pixels coordinates from image name

    startRow=min(1+NrowsInPixel-ImagetteSize,1+i*DemiImagetteSize);
    startCol=min(1+NcolsInPixel-ImagetteSize,1+j*DemiImagetteSize);

    %draw rectangle, be carreful axis x and y are inversed the
    %imagettes are numeroted by row and cols

    rectangle('Position',[startCol startRow 480 480],'EdgeColor',color);
end    

 
