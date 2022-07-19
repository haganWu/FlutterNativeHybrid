//
//  ViewController.m
//  FlutterHybridIOS
//
//  Created by 吴海恒 on 2022/7/15.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()
@property(nonatomic,assign) BOOL useEventChannel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.useEventChannel = true;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMessage:) name:@"showMessage" object:nil];
}
- (void)showMessage:(NSNotification*)notification{
    id params = notification.object;
    self.showLabel.text = [NSString stringWithFormat:@"来自Dart：%@",params];
}


- (IBAction)onSwitch:(id)sender {
    UISwitch *uiswitch = ((UISwitch*)sender);
    if (uiswitch.isOn) {
        self.useEventChannel = true;
        self.switchLabel.text = @"EventChannel";
    } else {
        self.useEventChannel = false;
        self.switchLabel.text = @"BasicMessageChannel";
    }
}
- (IBAction)editChange:(id)sender {
    NSString * text=((UITextField*)sender).text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendMessage" object:@{@"message": text,@"useEventChannel":self.useEventChannel? @"true":@"false"}];
}

- (IBAction)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleButtonAction {
    //以一个完整页面打开Flutter模块
    FlutterViewController *flutterViewController = [FlutterViewController new];
    
    [flutterViewController setInitialRoute:@"{name:'devio',dataList:['aa','bb',''cc]}"];
    
    [self presentViewController:flutterViewController animated:true completion:nil];
    self.view=flutterViewController.view;
}
@end
