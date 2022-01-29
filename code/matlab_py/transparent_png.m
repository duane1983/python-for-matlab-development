% code/matlab_py/transparent_png.m
% {{{
% This code accompanies the book _Python for MATLAB Development:
% Extend MATLAB with 300,000+ Modules from the Python Package Index_ 
% ISBN 978-1-4842-7222-0 | ISBN 978-1-4842-7223-7 (eBook)
% DOI 10.1007/978-1-4842-7223-7
% https://github.com/Apress/python-for-matlab-development
% 
% Copyright © 2022 Albert Danial
% 
% MIT License:
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
% THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
% DEALINGS IN THE SOFTWARE.
% }}}
Im = @py.importlib.import_module;
np = Im('numpy');
rgba = py.PIL.Image.open('matlab.png').convert('RGBA');
z = py2mat(np.array(rgba.getdata()));
white_pixel = logical((z(:,1)==255) .* (z(:,2)==255) .* (z(:,3)==255));
z(white_pixel,4) = 0; % set alpha to zero = transparent
rgba_trsp = py.list();
for i = 1:length(z)
    rgba_trsp.append(py.tuple(z(i,1:4)));
    if ((mod(i,1000) == 0))
        fprintf('%7d\n',i)
    end
end
rgba.putdata(rgba_trsp);
rgba.save('matlab_transparent_background.png', 'PNG')
