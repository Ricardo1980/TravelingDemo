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
        
        // add the 4 trips from the test
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Madrid" destination:@"Barcelona" transport:@"Train" seat:@"45B" notes:nil]];
    
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"London" destination:@"New York JFK" transport:@"Plane" seat:@"7B" notes:@"Flight SK455. Baggage will be automatically transferred from your last leg."]];
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Barcelona" destination:@"Gerona Airport" transport:@"Airport Bus" seat:nil notes:nil]];
        
        [_boardingCards addObject:[BoardingCard boardingCardWithOrigin:@"Gerona Airport" destination:@"London" transport:@"Plane" seat:@"3A" notes:@"Flight SK455. Baggage drop at ticker counter 344."]];
    }
    return self;
}


/*
 https://en.wikipedia.org/wiki/Topological_sorting
 
 
 Algorithm explanation:
 https://www.youtube.com/watch?v=jHWGir3Jk8o&list=PLAXcUSglh5YgkYsNtFORVNBTtdGx7kEzy&index=7
 
 Time cost is linear, O(n)

 */
-(NSError*) applyTopologicalOrder {
    
    // initialize indegress structure using a map (key=origin, value: set of destination cities)
    NSMutableSet *citiesSet = [NSMutableSet new];
    for (BoardingCard *boardingCard in self.boardingCards) {
        [citiesSet addObject:boardingCard.origin];
        [citiesSet addObject:boardingCard.destination];
    }
    NSMutableDictionary *indegrees=[[NSMutableDictionary alloc] init];
    for (NSString *city in citiesSet) {
        [indegrees setObject:[NSMutableSet new] forKey:city];
    }
    
    // add origin cities as a value of destinations cities working as keys
    for (BoardingCard *boardingCard in self.boardingCards) {
        [indegrees[boardingCard.destination] addObject:boardingCard.origin];
    }
    
    NSMutableArray *sortedArray=[NSMutableArray new];
    
    while (indegrees.count>0) {
        
        NSString *destinationCityToExtract = nil;
        for (NSString *destinationCity in indegrees) { // traverse remaining cities
            NSMutableSet *origins=indegrees[destinationCity];
            if (origins.count==0) { // if city doesn't have origins, mark it to removal from indegrees
                destinationCityToExtract = destinationCity;
                break;
            }
        }
        
        if (destinationCityToExtract == nil) {
            NSError *error = [NSError errorWithDomain:@"world" code:200 userInfo:@{NSLocalizedDescriptionKey:@"There are no city to extract."}];
            return error;
        }
        // add destinationCityToExtract to the final list
        [sortedArray addObject:destinationCityToExtract];
        
        // remove destinationCityToExtract from indegrees
        [indegrees removeObjectForKey:destinationCityToExtract];
        for (NSString *destinationCity in indegrees) { // traverse remaining cities
            NSMutableSet *origins=indegrees[destinationCity];
            [origins removeObject:destinationCityToExtract];
        }
    }
    
    if (sortedArray.count==0) {
        NSError *error = [NSError errorWithDomain:@"world" code:200 userInfo:@{NSLocalizedDescriptionKey:@"There must be objects in he array"}];
        return error;
    }
    
    NSMutableArray *sortedBoardingCards=[NSMutableArray new];
    for (int i=0; i<sortedArray.count-1; i++) {
        BoardingCard *boardingCard=[self getBoardingPassWithOrigin:sortedArray[i] destination:sortedArray[i+1]];
        if (boardingCard==nil) {
            NSError *error = [NSError errorWithDomain:@"world" code:200 userInfo:@{NSLocalizedDescriptionKey:@"There must be a boarding card with that origin and destination."}];
            return error;
        }
        
        [sortedBoardingCards addObject:boardingCard];
    }
    self.boardingCards=sortedBoardingCards;
    
    return nil;
}

-(BoardingCard*) getBoardingPassWithOrigin:(NSString*)origin destination:(NSString*)destination {
    for (BoardingCard *boardingCard in self.boardingCards) {
        if ([boardingCard.origin isEqualToString:origin] && [boardingCard.destination isEqualToString:destination]) {
            return boardingCard;
        }
    }
    return nil;
}

@end
