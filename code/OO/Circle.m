% code/OO/Circle.m
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
classdef Circle
  properties
      x {mustBeNumeric}
      y {mustBeNumeric}
      r {mustBeNumeric}
  end
  properties (Constant)
     MAX_R = 20;
  end
  properties (Access = private)
     perim
  end
  methods
   function obj = Circle(x,y,r)
     obj.x = x;
     obj.y = y;
     obj.r = r;
     obj.perim = 2*r*pi;
   end
   function [A] = area(obj)
     A = pi*obj.r^2;
   end
 end 
end
