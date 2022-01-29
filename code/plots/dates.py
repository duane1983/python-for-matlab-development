#!/usr/bin/env python3
# code/plots/dates.py
# {{{
# This code accompanies the book _Python for MATLAB Development:
# Extend MATLAB with 300,000+ Modules from the Python Package Index_ 
# ISBN 978-1-4842-7222-0 | ISBN 978-1-4842-7223-7 (eBook)
# DOI 10.1007/978-1-4842-7223-7
# https://github.com/Apress/python-for-matlab-development
# 
# Copyright © 2022 Albert Danial
# 
# MIT License:
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
# }}}
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime
t = np.arange(.1, .8, .01)
y = np.sin(3/t)*np.sin(5/(1-t))
S = 30*24*60*60*t + 1620000000
dates = [datetime.fromtimestamp(_)
            for _ in S]
fig, ax = plt.subplots()
ax.scatter(dates,y,marker=11)
plt.grid()
ax.xaxis.set_major_formatter(
  mdates.DateFormatter('%Y-%m-%d %H:%S'))
fig.autofmt_xdate()
