//
//  Card.m
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)cards {
    int score=0;
    
    for(Card * temp in cards){
        if([temp.contents isEqualToString:self.contents])
            score=1;
    }
    return score;
}

@end

