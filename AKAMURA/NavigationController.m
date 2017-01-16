//
//  NavigationController.m
//  AKAMURA
//
//  Created by araki kenta on 2014/09/04.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ナビゲーションバーの色
    [UINavigationBar appearance].barTintColor = RGB(205, 0, 0);
    
    // ナビゲーションバーの戻るボタンやラベルの色を変更
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.translucent = NO ;
    
    // ナビゲーションバーのタイトルの色を変更
    [UINavigationBar appearance].titleTextAttributes
    = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    // ViewControllerでステータスバーの更新を宣言
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ステータスバー色
- (UIStatusBarStyle)preferredStatusBarStyle{
    // フォント白
    return UIStatusBarStyleLightContent;
}

@end
