//
//  SetCard.m
//  Card Game
//
//  Created by Kishan Patel on 7/7/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "SetCard.h"


@implementation SetCard

-(NSString *)contents{
    NSString *stringToReturn=@"";
    for(int i=0;i<self.numberOfSymbols;i++){
        stringToReturn=[stringToReturn stringByAppendingString:self.symbol];
    }
    return stringToReturn;
}
+(NSArray *)validSuits{
    return @[@"▲", @"●",@"◼︎",];
}



-(void)setSymbol:(NSString *)symbol{
    if([[SetCard validSuits] containsObject:symbol]){
        _symbol=symbol;
    }
}

-(void)setColorIndex:(int)colorIndex{
    if(colorIndex<3){
        _colorIndex=colorIndex;
    }else{
        return;
    }
}
-(int)match:(NSArray *)cards{
    if([cards count]==2){
        SetCard *cardOne = [cards firstObject];
        SetCard *cardTwo=[cards lastObject];
        if((self.colorIndex==cardOne.colorIndex && cardOne.colorIndex==cardTwo.colorIndex)||(self.colorIndex!=cardOne.colorIndex && cardOne.colorIndex!=cardTwo.colorIndex && self.colorIndex!=cardTwo.colorIndex)){
            if((self.shading==cardOne.shading && cardOne.shading==cardTwo.shading)||(self.shading!=cardOne.shading && cardOne.shading!=cardTwo.shading && self.shading!=cardTwo.shading)){
                if(([self.symbol isEqualToString:cardOne.symbol]&& [cardOne.symbol isEqualToString:cardTwo.symbol])||
                   (![self.symbol isEqualToString:cardOne.symbol]&&![self.symbol isEqualToString:cardTwo.symbol]&&![cardOne.symbol isEqualToString:cardTwo.symbol])){
                    if((self.numberOfSymbols==cardOne.numberOfSymbols && cardOne.numberOfSymbols==cardTwo.numberOfSymbols)||(self.numberOfSymbols!=cardOne.numberOfSymbols && cardOne.numberOfSymbols!=cardTwo.numberOfSymbols && self.numberOfSymbols!=cardTwo.numberOfSymbols)){
                        return 1;
                    }
                }
                
            }
        }
        
    }
    return 0;
}
                                                                                      
                                                                                      
@end
