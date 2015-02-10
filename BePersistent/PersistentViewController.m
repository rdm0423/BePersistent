//
//  PersistentViewController.m
//  BePersistent
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PersistentViewController.h"

static NSString * const nameKey = @"nameKey";
static NSString * const player = @"player";
static NSString * const scoreKey = @"scoreKey";


@interface PersistentViewController ()

@property (weak, nonatomic) IBOutlet UITextField *playerNameTextField;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation PersistentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *player = [[NSUserDefaults standardUserDefaults] objectForKey:@"player"];
    [self updateWithPlayerDictionary:player];
}

- (void)updateWithPlayerDictionary:(NSDictionary *) player {
    
    //have to create a number as below we have it as a number value. casting it.
    NSNumber *score = player[@"scoreKey"];
    self.playerNameTextField.text = player[@"nameKey"];
    self.scoreLabel.text = [score stringValue];
    self.stepper.value = [score doubleValue];
}


- (IBAction)stepperValueChanged:(id)sender {
    UIStepper *stepper = sender;
    self.scoreLabel.text = [NSString stringWithFormat:@"%.0f", stepper.value];
}

- (IBAction)saveButton:(id)sender {
    NSMutableDictionary *playerDictionary = [NSMutableDictionary new];
    
    playerDictionary[@"nameKey"] = self.playerNameTextField.text;
    [playerDictionary setObject:@(self.stepper.value) forKey:@"scoreKey"];
    
    [[NSUserDefaults standardUserDefaults] setObject:playerDictionary forKey:@"player"];
    [[NSUserDefaults standardUserDefaults] synchronize];  //allows us to save down
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
