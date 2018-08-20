# SAStickyHeader [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)  ![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg)
Sticky parallax header view for UIScrollView using Auto-Layout constraints


## Demo
![Navigation bar example gif](source/demo/NavBarExample.gif)

![No navigation bar example gif](source/demo/NoNavBarExample.gif)


## Description
* Library that adds parallax and sticky header functionality to `UIScrollView` objects
* Uses Auto-Layout constraint
* Extremely small footprint
* Easy to use
* Friendly to interface builder


## Installation
The easiest way to install and use is simply to include **SAStickyHeaderViewController.swift** into your project's "Compile Sources" build phase.

The project is set up as a shared framework (SAStickyHeader) to enable [Carthage](https://github.com/Carthage/Carthage) support if you don't care about taking on that complexity.

Alternatively, this can easily be added as a git submodule into your project.


## How To Use
* Subclass `SAStickyHeaderViewController`
* Assign values to `headerView`, `scrollView` respectively
* Override `headerHeightDefault` as needed
* Set `hidesNavigationBar` to change navigation bar behavior


# License
The MIT License (MIT)

Copyright (c) 2015 Stefan Arambasich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
