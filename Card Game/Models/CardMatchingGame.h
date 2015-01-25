//
//  CardMatchingGame.h
//  Card Game
//
//  Created by Kishan Patel on 6/25/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount:(int)count
                        usingDeck: (Deck *)deck
                         gameType:(int)gameType;




-(Card *)cardAtIndex: (int)index;
-(void)chooseCardAtIndex: (int) index;

@property (nonatomic, readonly) int score;
@property (nonatomic) int gameType;
@property  (nonatomic)NSString *historyLog;
@end
