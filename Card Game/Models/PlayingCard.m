//
//  PlayingCard.m
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents{
    NSArray * array= [PlayingCard rankStrings];
    NSString * content = [array[self.rank] stringByAppendingString:self.suit];
    return content;
}
@synthesize suit=_suit;

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit])
        _suit=suit;
}
 -(NSString *)suit{
     return _suit ? _suit: @"?";
}


+(NSArray *)validSuits{
    return @[@"❤️", @"♠️",@"♣️",@"♦️"];
}

+(NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(int)maxRank{
    return [[PlayingCard rankStrings] count]-1;
}

-(void)setRank:(int)rank{
    if(rank<=[PlayingCard maxRank]){
        _rank=rank;
    }
}

-(int)match:(NSArray *)cards{
    if([cards count]==1){
        PlayingCard *otherCard = [cards firstObject];
        if(otherCard.rank==self.rank){
            return 4;
        } else if([otherCard.suit isEqualToString:self.suit])
            return 1;
    }else if ([cards count]==2){
        PlayingCard *cardOne=[cards firstObject];
        PlayingCard *cardTwo=[cards lastObject];
        if(self.rank==cardOne.rank &&cardOne.rank==cardTwo.rank){
            return 7;
        } else if([self.suit isEqualToString:cardOne.suit]&&[self.suit isEqualToString:cardTwo.suit]){
            return 2;
        }
        
    }
    
    return 0;
}

@end
