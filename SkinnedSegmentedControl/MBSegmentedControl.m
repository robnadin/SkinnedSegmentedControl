//
//  MBSegmentedControl.m
//  SkinnedSegmentedControl
//
//  Created by Rob on 04/01/2014.
//  Copyright (c) 2014 Rob Nadin. All rights reserved.
//

#import "MBSegmentedControl.h"

@implementation MBSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)awakeFromNib
{
    CGFloat horizontal = 0;
    CGFloat vertical = 0;
    UIImage *selectedNone = [UIImage imageNamed:@"selectedNone"];
    UIImage *selectedDivider = [UIImage imageNamed:@"selectedDivider"];
    
    // Set background images
    UIImage *segmentUnselected = [[UIImage imageNamed:@"segmentedBackgroundNone"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)
        resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:segmentUnselected
                    forState:UIControlStateNormal
                  barMetrics:UIBarMetricsDefault];

    UIImage *segmentSelected = [[UIImage imageNamed:@"segmentedBackgroundSelected"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)
        resizingMode:UIImageResizingModeStretch];
    [self setBackgroundImage:segmentSelected
                    forState:UIControlStateSelected
                  barMetrics:UIBarMetricsDefault];
    
    // For iOS 7
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        horizontal = .5f;
        vertical = 1.f;
        
        [self setBackgroundImage:segmentSelected
                        forState:UIControlStateHighlighted
                      barMetrics:UIBarMetricsDefault];

        // Set additional divider images for highlighted state
        [self setDividerImage:selectedDivider
          forLeftSegmentState:UIControlStateHighlighted
            rightSegmentState:UIControlStateNormal
                   barMetrics:UIBarMetricsDefault];

        [self setDividerImage:selectedDivider
          forLeftSegmentState:UIControlStateNormal
            rightSegmentState:UIControlStateHighlighted
                   barMetrics:UIBarMetricsDefault];
        
        [self setDividerImage:selectedDivider
          forLeftSegmentState:UIControlStateSelected
            rightSegmentState:UIControlStateHighlighted
                   barMetrics:UIBarMetricsDefault];

        [self setDividerImage:selectedDivider
          forLeftSegmentState:UIControlStateHighlighted
            rightSegmentState:UIControlStateSelected
                   barMetrics:UIBarMetricsDefault];
    }

    // Set standard divider images
    [self setDividerImage:selectedNone
      forLeftSegmentState:UIControlStateNormal
        rightSegmentState:UIControlStateNormal
               barMetrics:UIBarMetricsDefault];

    [self setDividerImage:selectedDivider
      forLeftSegmentState:UIControlStateSelected
        rightSegmentState:UIControlStateNormal
               barMetrics:UIBarMetricsDefault];

    [self setDividerImage:selectedDivider
      forLeftSegmentState:UIControlStateNormal
        rightSegmentState:UIControlStateSelected
               barMetrics:UIBarMetricsDefault];
    
    // Fix the text position of the segments
    [self setContentPositionAdjustment:UIOffsetMake(horizontal, vertical)
                        forSegmentType:UISegmentedControlSegmentAny
                            barMetrics:UIBarMetricsDefault];
    [self setContentPositionAdjustment:UIOffsetMake(selectedNone.size.width / 2 + horizontal * 2, vertical)
                        forSegmentType:UISegmentedControlSegmentLeft
                            barMetrics:UIBarMetricsDefault];
    [self setContentPositionAdjustment:UIOffsetMake(-selectedNone.size.width / 2 + horizontal * 2, vertical)
                        forSegmentType:UISegmentedControlSegmentRight
                            barMetrics:UIBarMetricsDefault];
    
    // Set the title text attributes
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:18.f];
    UIColor *textColor = [UIColor colorWithWhite:.6f alpha:1.f];
    
    NSDictionary *attributes = @{
                                 UITextAttributeFont: font,
                                 UITextAttributeTextColor: textColor,
                                 UITextAttributeTextShadowColor: [UIColor clearColor]
                                 };
    [self setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    textColor = [UIColor whiteColor];
    attributes = @{
                   UITextAttributeFont: font,
                   UITextAttributeTextColor: textColor,
                   UITextAttributeTextShadowColor: [UIColor clearColor]
                   };
    [self setTitleTextAttributes:attributes forState:UIControlStateSelected];
    [self setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
}

@end
