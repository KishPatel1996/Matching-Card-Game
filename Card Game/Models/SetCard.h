//
//  SetCard.h
//  Card Game
//
//  Created by Kishan Patel on 7/7/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) int numberOfSymbols;
@property (strong,nonatomic) NSString *symbol;
@property (nonatomic) int colorIndex;
@property (nonatomic) int shading;

+(NSArray *)validSuits;


@end
