//
//  SetCardViewController.m
//  Card Game
//
//  Created by Kishan Patel on 7/14/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCard.h"


@interface SetCardViewController ()
@property (weak, nonatomic,) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic,) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic,) IBOutlet UILabel *gameLog;
@end

@implementation SetCardViewController



-(Deck *)createDeck{
    return [[SetCardDeck alloc]init];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self updateUI];
}

-(void)updateUI{
    for(UIButton *button in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:button];
        SetCard *card=(SetCard *)[self.game cardAtIndex:cardButtonIndex];
        [button setAttributedTitle:[self addColorandShadingtoCard:card ] forState:UIControlStateNormal];
        [button setBackgroundColor:[self buttonColorwithCard:card]];
        button.enabled=!card.isMatch;
        self.scoreLabel.text=[NSString stringWithFormat:@"Score:%d",self.game.score ];
        self.gameLog.text=self.game.historyLog;
    }
}

-(UIColor *)buttonColorwithCard: (Card *)card{
    
    if(card.isChosen){
        return [UIColor colorWithWhite:.8 alpha:1];
    }else{
        return [UIColor whiteColor];
    }
}


-(NSMutableAttributedString *)addColorandShadingtoCard:(SetCard *)card{
    NSString *stringToAddAttributes=card.contents;
    NSMutableAttributedString *returnString =[[NSMutableAttributedString alloc]initWithString:stringToAddAttributes];
    
    [returnString addAttributes:@{NSForegroundColorAttributeName:[[self validColors] objectAtIndex:card.colorIndex],
                                  NSStrokeColorAttributeName: [[self validStrokeColor]  objectAtIndex:card.shading],
                                  NSStrokeWidthAttributeName: @-3}  range:NSMakeRange(0, [returnString length])];
    
    return returnString;
    
}
- (NSArray *)validColors{
    
    return @[[UIColor clearColor],[UIColor grayColor],[UIColor blackColor] ];
}
- (NSArray *)validStrokeColor{
    return @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor] ];
}
@end

