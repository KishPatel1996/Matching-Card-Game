//
//  Deck.h
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject


-(void)addCard:(Card *)card atTop: (BOOL)atTop;
-(void)addCard:(Card *)card;


-(Card *)drawRandomCard;
-(int)deckLength;
@end
