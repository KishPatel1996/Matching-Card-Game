//
//  SetCardDeck.m
//  Card Game
//
//  Created by Kishan Patel on 7/14/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

#pragma mark - Designated Initializer 
-(instancetype) init{
    self=[super init];
    if(self){
        for(NSString *symbol in [SetCard validSuits]){
            for(int num =1;num<=3;num++){
                for(int color=0;color<3;color++){
                    for(int shading=0;shading<3;shading++){
                        SetCard * card = [[SetCard alloc]init];
                        card.symbol=symbol;
                        card.numberOfSymbols=num;
                        card.colorIndex=color;
                        card.shading=shading;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
    
    
}
@end
