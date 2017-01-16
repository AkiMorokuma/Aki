//
//  ViewController.h
//  AKAMURA
//
//  Created by araki kenta on 2014/09/03.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "InfinitePagingView.h"
#import "FMDatabase.h"
#import "MapDto.h"
#import "WebViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "SBJson.h"
#import "SVProgressHUD.h"
#import "SQLiteWriter.h"
#import "DetailViewController2.h"
#import "SQLiteManager.h"
#import "Util.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface ViewController : UIViewController<UIScrollViewDelegate,CLLocationManagerDelegate>{
    
    BOOL top_picture_switch;
    UIPageControl *pageControl;
    InfinitePagingView *pagingView,*pagetitleView;
    NSTimer *tm1;
    //DB
    NSString *db_path;
    FMDatabase *db;
    //top写真の配列
    //NSMutableArray *top_picture_data;
    
    //天気
    BOOL flag;
    BOOL _state;
    
}
@property (weak, nonatomic) IBOutlet UIView *pageView;
@property (weak, nonatomic) IBOutlet UIView *pageControlView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navi;

//各種ボタン
- (IBAction)tourism_btn:(id)sender;
- (IBAction)genji_btn:(id)sender;
- (IBAction)special_product_btn:(id)sender;
- (IBAction)access_btn:(id)sender;
- (IBAction)town_office_btn:(id)sender;
- (IBAction)review_btn:(id)sender;
- (IBAction)setting_btn:(id)sender;
- (IBAction)news_btn:(id)sender;
- (void)showViewController;

@property (weak, nonatomic) IBOutlet UIButton *tourism_btn;
@property (weak, nonatomic) IBOutlet UIButton *genji_btn;
@property (weak, nonatomic) IBOutlet UIButton *special_product_btn;
@property (weak, nonatomic) IBOutlet UIButton *access_btn;
@property (weak, nonatomic) IBOutlet UIButton *town_office_btn;
@property (weak, nonatomic) IBOutlet UIButton *review_btn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *setting_btn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *news_btn;
@property (weak, nonatomic) IBOutlet UIButton *walkrallyButton;

//天気ラベル、イメージ
@property (weak, nonatomic) IBOutlet UIImageView *wetherImage;
@property (weak, nonatomic) IBOutlet UILabel *temp_label;
@property (weak, nonatomic) IBOutlet UILabel *temp_max_label;
@property (weak, nonatomic) IBOutlet UILabel *temp_min_label;
@property (weak, nonatomic) IBOutlet UILabel *today_label;
@property (nonatomic) BOOL state;
@end
