//
//  Deck.m
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray * cards;
@end

@implementation Deck

-(NSMutableArray *) cards{
    if(!_cards)
        _cards=[[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
        
    }else{
        [self.cards addObject:card];
    }
}
-(Card *)drawRandomCard{
    Card * randomCard=nil;
    
    if([self.cards count]){
        int index= arc4random()%[self.cards count];
        randomCard= self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
-(int)deckLength{
    return [self.cards count];
}
@end
