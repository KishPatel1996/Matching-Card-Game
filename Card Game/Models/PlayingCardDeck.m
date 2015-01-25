//
//  PlayingCardDeck.m
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck
-(instancetype)init{
    self=[super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]) {
            for(int rank =1;rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank=rank;
                card.suit=suit;
                [self addCard:card];
            }
        }
    }
    return self;

    
}
@end
