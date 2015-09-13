//
//  CALayer+CALayer__XibConfiguration.h
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

/*
 This class class is used to setup the button border color using runtime attributes 
 Basically because is a CGColor what we need, not a UIColor
 http://stackoverflow.com/questions/26161429/set-uibutton-layer-border-width-and-color-in-interface-builder
 */
@interface CALayer (XibConfiguration)
@property(nonatomic, assign) UIColor* borderUIColor;
@end
