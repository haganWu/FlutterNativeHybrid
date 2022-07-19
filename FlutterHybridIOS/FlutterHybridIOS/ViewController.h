//
//  ViewController.h
//  FlutterHybridIOS
//
//  Created by 吴海恒 on 2022/7/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)onSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
- (IBAction)onBack:(id)sender;
- (IBAction)editChange:(id)sender;

@end

