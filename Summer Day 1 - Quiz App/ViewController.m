//
//  ViewController.m
//  Summer Day 1 - Quiz App
//
//  Created by Bakytzhan Baizhikenov on 5/11/15.
//  Copyright (c) 2015 Bakytzhan Baizhikenov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIButton *optionAButton;
@property (strong, nonatomic) IBOutlet UIButton *optionBButton;
@property (strong, nonatomic) IBOutlet UIButton *optionCButton;
@property (strong, nonatomic) IBOutlet UIButton *optionDButton;

@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) NSArray *answers;

@property (nonatomic) int currentQuestion;

@end

@implementation ViewController


-(void) generateData
{
    
    NSString *question0 = @"What is the capital of Kazakhstan";
    NSString *option0_0 = @"Almaty";
    NSString *option0_1 = @"Astana";
    NSString *option0_2 = @"Taldykorgan";
    NSString *option0_3 = @"Semey";
    NSArray *options0 = @[option0_0, option0_1, option0_2, option0_3];
    NSNumber *answer0 = @1;
    
    NSString *question1 = @"The moon is a : ";
    NSString *option1_0 = @"Comet";
    NSString *option1_1 = @"Star";
    NSString *option1_2 = @"Planet";
    NSString *option1_3 = @"Satellite";
    NSArray *options1 = @[option1_0, option1_1, option1_2, option1_3];
    NSNumber *answer1 = @3;

    NSString *question2 = @"The difference between people with access to computers and the Internet and those without this access is known as the:";
    NSString *option2_0 = @"digital divide";
    NSString *option2_1 = @"Internet divide";
    NSString *option2_2 = @"Web divide";
    NSString *option2_3 = @"cyberway divide";
    NSArray *options2 = @[option2_0, option2_1, option2_2, option2_3];
    NSNumber *answer2 = @0;

    NSString *question3 = @"Servers are computers that provide resources to other computers connected to a: ";
    NSString *option3_0 = @"mainframe";
    NSString *option3_1 = @"supercomputer";
    NSString *option3_2 = @"network";
    NSString *option3_3 = @"client";
    NSArray *options3 = @[option3_0, option3_1, option3_2, option3_3];
    NSNumber *answer3 = @2;
    
    self.questions = @[question0, question1, question2, question3];
    self.options = @[options0, options1, options2, options3];
    self.answers = @[answer0, answer1, answer2, answer3];
    
}

-(void) resetButtons
{
    [self.optionAButton setBackgroundColor:[UIColor grayColor]];
    [self.optionBButton setBackgroundColor:[UIColor grayColor]];
    [self.optionCButton setBackgroundColor:[UIColor grayColor]];
    [self.optionDButton setBackgroundColor:[UIColor grayColor]];
}

-(void) highlightCorrect
{
    if ([self.answers[self.currentQuestion] isEqualToValue:@0]) {
        [self.optionAButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([self.answers[self.currentQuestion] isEqualToValue:@1]) {
        [self.optionBButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([self.answers[self.currentQuestion] isEqualToValue:@2]) {
        [self.optionCButton setBackgroundColor:[UIColor greenColor]];
    }
    if ([self.answers[self.currentQuestion] isEqualToValue:@3]) {
        [self.optionDButton setBackgroundColor:[UIColor greenColor]];
    }
}

-(void) showCurrentQuestion
{
    self.questionLabel.text = self.questions[self.currentQuestion];
    NSArray *currentOptions = self.options[self.currentQuestion];
    [self.optionAButton setTitle:currentOptions[0] forState:UIControlStateNormal];
    [self.optionBButton setTitle:currentOptions[1] forState:UIControlStateNormal];
    [self.optionCButton setTitle:currentOptions[2] forState:UIControlStateNormal];
    [self.optionDButton setTitle:currentOptions[3] forState:UIControlStateNormal];
    
    [self resetButtons];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self generateData];
    
    self.currentQuestion = 0;
    [self showCurrentQuestion];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextQuestionButtonPressed:(UIButton *)sender {
    
    self.currentQuestion += 1;
    self.currentQuestion %= [self.questions count];
    [self showCurrentQuestion];
    
}

- (IBAction)showAnswerButtonPressed:(id)sender {
    
    [self resetButtons];
    [self highlightCorrect];
   
}

- (IBAction)optionAButtonPressed:(UIButton *)sender {
    
    [self.optionAButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
}

- (IBAction)optionBButtonPressed:(UIButton *)sender {
    [self.optionBButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
}

- (IBAction)optionCButtonPressed:(UIButton *)sender {
    [self.optionCButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
}

- (IBAction)optionDButtonPressed:(UIButton *)sender {
    [self.optionDButton setBackgroundColor:[UIColor redColor]];
    [self highlightCorrect];
}

@end
