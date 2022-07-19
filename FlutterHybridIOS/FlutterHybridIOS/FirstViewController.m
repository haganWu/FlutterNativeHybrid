//
//  FirstViewController.m
//  FlutterHybridIOS
//
//  Created by 吴海恒 on 2022/7/16.
//

#import "FirstViewController.h"
#import "MainViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[MainViewController class]]){
        ((MainViewController*)segue.destinationViewController).inputParams = self.inputParams.text;
    }
}

@end
