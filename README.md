# SAStickyHeader
Sticky parallax header view for UIScrollView using Auto-Layout constraints

## Description
- Library that adds parallax and sticky header functionality to `UIScrollView` 
 objects
- Uses Auto-Layout constraint
- Extremely small footprint
- Easy to use
- Friendly to interface builder

## Demo
![Navigation bar example](SAStickyHeaderDemo/NavBarExample.gif)

![No navigation bar example](SAStickyHeaderDemo/NoNavBarExample.gif)

## How to use
- Subclass `SAStickyHeaderViewController`
- Assign values to `headerView`, `scrollView` respectively
- Set a `headerHeightConstraint`, which is a single height constraint of the
 navigation bar
- Optional: Override `headerHeightDefault` as needed
- Optional: Set `hidesNavigationBar` to change navigation bar behavior
