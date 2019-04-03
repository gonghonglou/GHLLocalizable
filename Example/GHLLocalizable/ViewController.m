//
//  ViewController.m
//  GHLLocalizable
//
//  Created by gonghonglou on 2018/3/14.
//  Copyright © 2018年 Troy. All rights reserved.
//

#import "ViewController.h"
#import <GHLLocalizable/GHLLocalizable.h>
#import "NextViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *chineseButton;

@property (nonatomic, strong) UIButton *englishButton;

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [GHLLocalizable initUserLanguage];
    
    self.chineseButton = [self createButtonWithTitle:NSLocalizedString(@"中文版", nil)
                                               fream:CGRectMake((self.view.frame.size.width-200)/2, 200, 200, 50)];
    self.englishButton = [self createButtonWithTitle:NSLocalizedString(@"英文版", nil)
                                               fream:CGRectMake((self.view.frame.size.width-200)/2, 300, 200, 50)];
    self.nextButton = [self createButtonWithTitle:NSLocalizedString(@"下一页", nil)
                                            fream:CGRectMake((self.view.frame.size.width-200)/2, 500, 200, 50)];

    [self.chineseButton addTarget:self action:@selector(clickChineseButton) forControlEvents:UIControlEventTouchUpInside];
    [self.englishButton addTarget:self action:@selector(clickEnglishButton) forControlEvents:UIControlEventTouchUpInside];

    [self.nextButton addTarget:self action:@selector(clickNextButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    if ([[GHLLocalizable userLanguage] isEqualToString:GHLChinese_Hans]) {
        [self clickChineseButton];
    } else {
        [self clickEnglishButton];
    }
}

- (void)clickChineseButton {
    [GHLLocalizable setUserlanguage:GHLChinese_Hans];
    
    [self didSelectStyle:self.chineseButton];
    [self didDeselectStyle:self.englishButton];
}

- (void)clickEnglishButton {
    [GHLLocalizable setUserlanguage:GHLEnglish];

    [self didSelectStyle:self.englishButton];
    [self didDeselectStyle:self.chineseButton];
}

- (void)clickNextButton {
    NextViewController *nextVC = [NextViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (UIButton *)createButtonWithTitle:(NSString *)title fream:(CGRect)fream {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = fream;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 4.0;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 1.0;
    [self.view addSubview:button];
    return button;
}

- (void)didSelectStyle:(UIButton *)button {
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)didDeselectStyle:(UIButton *)button {
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
}


@end
