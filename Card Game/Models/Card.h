//
//  Card.h
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatch) BOOL match;


-(int)match:(NSArray *)cards;
@end




