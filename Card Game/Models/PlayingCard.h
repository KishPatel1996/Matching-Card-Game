//
//  PlayingCard.h
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString * suit;
@property (nonatomic) int rank;

+(NSArray *)validSuits;
+(int)maxRank;
@end
