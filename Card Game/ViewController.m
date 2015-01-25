//
//  ViewController.m
//  Card Game
//
//  Created by Kishan Patel on 6/23/14.
//  Copyright (c) 2014 Kishan Patel. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@property (weak, nonatomic,) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic,) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic,) IBOutlet UILabel *gameLog;
@end

@implementation ViewController

-(CardMatchingGame *)game{
    if(!_game){
        int temp=-1;
        if([self.createDeck isMemberOfClass:[PlayingCardDeck class]]){
            temp=0;
        }else{
            temp=1;
        }
        _game= [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck] gameType:temp];
    }
    return _game;
}

-(Deck *)createDeck{
    return nil;
}

- (IBAction)TouchResetButton:(id)sender {
    self.game=nil;
    [self updateUI];
    
    
}

- (IBAction)TouchCardButton:(UIButton *)sender {
    int index= [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
   
    [self updateUI];
    
}
-(void)updateUI{
    for(UIButton *button in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:button];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        [button setTitle:[self titleForCard:card ] forState:UIControlStateNormal];
        [button setBackgroundImage:[self biForCard:card] forState:UIControlStateNormal];
        button.enabled=!card.isMatch;
        self.scoreLabel.text=[NSString stringWithFormat:@"Score:%d",self.game.score ];
        self.gameLog.text=self.game.historyLog;
    }
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents: @"";
}
-(UIImage *)biForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen? @"cardfront":@"cardback"];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.game=nil;
}

@end
