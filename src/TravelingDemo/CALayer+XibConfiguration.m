//
//  CALayer+XibConfiguration.m
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
