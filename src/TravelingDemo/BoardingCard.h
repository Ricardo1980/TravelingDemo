//
//  BoardingCards.h
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoardingCard : NSObject
@property (strong, readonly, nonatomic) NSString *origin;
@property (strong, readonly, nonatomic) NSString *destination;
@property (strong, readonly, nonatomic) NSString *transport;
@property (strong, readonly, nonatomic) NSString *seat;
@property (strong, readonly, nonatomic) NSString *notes;
-(instancetype) initWithOrigin:(NSString*)origin destination:(NSString*)destination transport:(NSString*)transport seat:(NSString*)seat notes:(NSString*)notes;
+(instancetype) boardingCardWithOrigin:(NSString*)origin destination:(NSString*)destination transport:(NSString*)transport seat:(NSString*)seat notes:(NSString*)notes;
@end
