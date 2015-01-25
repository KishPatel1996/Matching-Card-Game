//
//  CardMatchingGame.m
//  Card Game
//
//  Created by Kishan Patel on 6/25/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property   (nonatomic,readwrite) int score;
@property   (nonatomic,strong) NSMutableArray *cards;
@property   (nonatomic) int match;
@end

@implementation CardMatchingGame
-(NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc]init];
        
    }
    return _cards;
    
    
}



-(instancetype)initWithCardCount:(int)count
                       usingDeck:(Deck *)deck gameType:(int)gameType {
    self=[super init];
    if(self){
        
        for(int i=0;i<count;i++){
            Card *temp = [deck drawRandomCard];
            if(temp){
                [self.cards addObject:temp];
            }
            else{
                self=nil;
                break;
            }
        }
        self.gameType=gameType;
    }
    return self;
}

- (Card *)cardAtIndex:(int)index{
    return (index<[self.cards count])?self.cards[index]: nil;
}

static int MATCH_PENALTY=2;
static int MATCH_BONUS=4;

-(void)chooseCardAtIndex:(int)index{
    Card *card= [self cardAtIndex:index];
    if(card.isChosen){
        card.chosen=NO;
        self.historyLog=[ NSString stringWithFormat:@"%@ was unselected",card.contents ];
        
    }else{
        self.historyLog=[ NSString stringWithFormat:@"%@ was selected",card.contents ];
        //Match against other card
        NSMutableArray *arrayOfCards=[[NSMutableArray alloc]init];
        //create sentence
        NSString *allCardsThatMatched=card.contents;
        for(Card *otherCard in self.cards){
            if(otherCard.isChosen && !otherCard.isMatch){
                [arrayOfCards addObject:otherCard];
                allCardsThatMatched= [[allCardsThatMatched stringByAppendingString:@" "]stringByAppendingString:otherCard.contents];
            }
        
        }
        if([arrayOfCards count]==self.gameType+1){
            int matchScore= [card match:arrayOfCards];
            if(matchScore){
                self.score+=matchScore*MATCH_BONUS;
                card.match=YES;
               
                for(Card *othercard in arrayOfCards){
                    othercard.match =YES;
                    
                }
                self.historyLog=[ NSString stringWithFormat:@"%@ matched for %d points!",allCardsThatMatched,matchScore*MATCH_BONUS ];
            }else{
                self.score-=MATCH_PENALTY * (self.gameType+1);
                for(Card *othercard in arrayOfCards){
                    othercard.match =NO;
                    othercard.chosen=NO;
                }
                self.historyLog=[ NSString stringWithFormat:@"%@ did not match! You lost %d points!",allCardsThatMatched,matchScore*MATCH_PENALTY ];
            }
        
        
        }
        self.score -= 1;
        card.Chosen=YES;
    }
}
@end
