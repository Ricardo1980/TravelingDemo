//
//  DataModel.h
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (strong, nonatomic) NSMutableArray* boardingCards;
-(NSError*) applyTopologicalOrder;
@end
