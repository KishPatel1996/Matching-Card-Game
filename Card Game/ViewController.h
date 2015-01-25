//
//  ViewController.h
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Deck.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface ViewController : UIViewController
#pragma mark - Abstract method

@property (nonatomic, strong) CardMatchingGame *game;

-(Deck *)createDeck;
-(NSString *)titleForCard:(Card *)card;
-(UIImage *)biForCard:(Card *)card;
-(void)updateUI;
-(CardMatchingGame *)game;

@end
    
