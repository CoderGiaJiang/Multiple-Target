//
//  ViewController.m
//  TargetDemo
//
//  Created by FallChat on 2017/5/2.
//  Copyright © 2017年 FallChat. All rights reserved.
//

#import "ViewController.h"

/**
 * 各个分包的分包ID
 */
typedef NS_ENUM(NSInteger, AppPackageCode) {
    
    AppPackageCode_Main     = 0, /** 主包 */
    AppPackageCode_First    = 1, /** 包 1 */
    AppPackageCode_Second   = 2, /** 包 2 */
    AppPackageCode_Third    = 3, /** 包 3 */
    AppPackageCode_Forth    = 4, /** 包 4 */
    AppPackageCode_Fifth    = 5, /** 包 5 */
    
    AppPackageCode_Current  = AppPackageCode_Main, /** 当前包编号*/
};

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *packDisplayLab;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    switch (AppPackage) {
        case AppPackageCode_Main:
            self.view.backgroundColor = [UIColor redColor];
            break;
        case AppPackageCode_First:
            self.view.backgroundColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    self.packDisplayLab.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    self.iconImage.image = [UIImage imageNamed:@"icon40"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
