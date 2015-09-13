//
//  BoardingCards.m
//  TravelingDemo
//
//  Created by Ricardo on 13/9/15.
//  Copyright (c) 2015 Ricardo Ruiz López. All rights reserved.
//

#import "BoardingCard.h"

@implementation BoardingCard

-(instancetype) initWithOrigin:(NSString*)origin destination:(NSString*)destination transport:(NSString*)transport seat:(NSString*)seat notes:(NSString*)notes {
    self = [super init];
    if (self) {
        NSAssert(origin, @"Origin is mandatory.");
        NSAssert(destination, @"Destination is mandatory.");
        _origin=origin;
        _destination=destination;
        _transport=transport;
        _seat=seat;
        _notes=notes;
    }
    return self;
}

+(instancetype) boardingCardWithOrigin:(NSString*)origin destination:(NSString*)destination transport:(NSString*)transport seat:(NSString*)seat notes:(NSString*)notes {
    return [[self alloc] initWithOrigin:origin destination:destination transport:transport seat:seat notes:notes];
}

-(NSString*) description {
    NSString *originDescription=[NSString stringWithFormat:@"Origin: %@", self.origin];
    NSString *destinationDescription=[NSString stringWithFormat:@"Destination: %@", self.destination];
    NSString *transportDescription=[NSString stringWithFormat:@"Transport: %@", self.transport?self.transport:@"N/A"];
    NSString *seatDescription=[NSString stringWithFormat:@"Seat: %@", self.seat?self.seat:@"N/A"];
    NSString *notesDescription=[NSString stringWithFormat:@"Notes: %@", self.notes?self.notes:@"N/A"];
    return [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@", originDescription, destinationDescription, transportDescription, seatDescription, notesDescription];
}

@end
