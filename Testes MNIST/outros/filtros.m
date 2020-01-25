% filtros 
% http://setosa.io/ev/image-kernels/

filter_blur = [0.0625 0.125 0.0625; 0.125 0.25 0.125;0.0625 0.125 0.0625];

filter_bottomSobel = [-1 -2 -1; 0 0 0;1 2 1];

filter_emboss = [-2 -1 0; -1 1 1;0 1 2];

filter_identify = [0 0 0; 0 1 0; 0 0 0];

filter_leftSobel = [1 0 -1; 2 0 -2; 1 0 -1];

filter_outline = [-1 -1 -1; -1 8 -1; -1 -1 -1];

filter_rightSobel = [-1 0 1; -2 0 2; -1 0 1];

filter_sharpen = [0 -1 0; -1 5 -1; 0 -1 0];

filter_topSobel = [1 2 1; 0 0 0; -1 -2 -1];


