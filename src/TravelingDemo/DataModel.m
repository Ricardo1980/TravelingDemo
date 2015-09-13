//
//  DataModel.m
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import "DataModel.h"
#import "BoardingCard.h"

@implementation DataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _boardingCards=[NSMutableArray new];
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Madrid" destination:@"Barcelona" transport:@"Train" seat:@"45B" notes:nil]];
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Barcelona" destination:@"Girona Airport" transport:@"Airport Bus" seat:nil notes:nil]];
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Girona Airport" destination:@"London" transport:@"Flight SK455" seat:@"aa" notes:nil]];
        
    }
    return self;
}

-(void) applyTopologicalOrder {
    
}

@end
