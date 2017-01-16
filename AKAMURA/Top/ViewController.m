//
//  ViewController.m
//  AKAMURA
//
//  Created by araki kenta on 2014/09/03.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize state = _state;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    top_picture_switch = YES;
    
    [self setProperty];
    [[[SQLiteManager alloc] init] openDatabase];
    
    [SVProgressHUD show];
    [SVProgressHUD showWithStatus:@"loading"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveLocalNotification)
                                                 name:@"UIApplicationDidReceiveLocalNotification"
                                               object:nil];
}

- (void)setProperty {
    
    //ボタン色
    self.genji_btn.backgroundColor           = RGB(205, 0, 0);
    self.access_btn.backgroundColor          = RGB(205, 0, 0);
    self.review_btn.backgroundColor          = RGB(205, 0, 0);
    self.tourism_btn.backgroundColor         = RGB(205, 0, 0);
    self.town_office_btn.backgroundColor     = RGB(205, 0, 0);
    self.special_product_btn.backgroundColor = RGB(205, 0, 0);
    
    //天気ラベルフォント
    self.temp_label.font     = [UIFont fontWithName:@"KFhimaji" size:18.0];
    self.today_label.font    = [UIFont fontWithName:@"KFhimaji" size:18.0];
    self.temp_max_label.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    self.temp_min_label.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    
    
    //ボタン　フォント変更
    [self.news_btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5],
                                           NSForegroundColorAttributeName,
                                           [UIFont fontWithName:@"KFhimaji" size:18.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    //View角丸生成
    self.pageView.layer.cornerRadius        = 10.0;
    self.pageControlView.layer.cornerRadius = 10.0;
    self.pageView.layer.masksToBounds        = YES;
    self.pageControlView.layer.masksToBounds = YES;
    
    //navigationbar font
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title"]];
    self.navigationItem.titleView = titleImageView;
    
    //ボタンオフ
    self.news_btn.enabled            = NO;
    self.genji_btn.enabled           = NO;
    self.access_btn.enabled          = NO;
    self.review_btn.enabled          = NO;
    self.setting_btn.enabled         = NO;
    self.tourism_btn.enabled         = NO;
    self.town_office_btn.enabled     = NO;
    self.walkrallyButton.enabled     = NO;
    self.special_product_btn.enabled = NO;
}

- (void)setButtonOn{
    //ボタンオン
    self.news_btn.enabled            = YES;
    self.genji_btn.enabled           = YES;
    self.access_btn.enabled          = YES;
    self.review_btn.enabled          = YES;
    self.setting_btn.enabled         = YES;
    self.tourism_btn.enabled         = YES;
    self.town_office_btn.enabled     = YES;
    self.walkrallyButton.enabled     = YES;
    self.special_product_btn.enabled = YES;
    
    [self.news_btn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],
                                           NSForegroundColorAttributeName,
                                           [UIFont fontWithName:@"KFhimaji" size:18.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    if (top_picture_switch) {
        top_picture_switch = NO;
        
        if (![[[Util alloc] init] networkCheck:self]) {
            SQLiteWriter *writer = [[SQLiteWriter alloc] init];
            [writer setXMLParser];
            [self weatherSet];
        }
        
        [self setPager];
        [self timerSet];
        [self setButtonOn];
        [SVProgressHUD dismiss];
    }
}

- (void)setPager {
    int pageSize = 19; // ページ数
    CGFloat width  = self.pageView.frame.size.width;
    CGFloat height = self.pageView.frame.size.height;
    
    //pagingView
    pagingView = [[InfinitePagingView alloc] initWithFrame:CGRectMake(0.f, 0.f,width,height)];
    pagingView.delegate = (id)self;
    
    [self.pageView addSubview: pagingView];
    
    for (int i = 1; i <= pageSize; i++) {
        UIImage *image;
        if(i < 10) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"akamura0%d",i]];
        }else{
            image = [UIImage imageNamed:[NSString stringWithFormat:@"akamura%d",i]];
        }
        UIImageView *page = [[UIImageView alloc] initWithImage:image];
        page.backgroundColor = [UIColor blackColor];
        page.frame = CGRectMake(0.f, 0.f, pagingView.frame.size.width, pagingView.frame.size.height-20);
        //page.contentMode = UIViewContentModeScaleToFill;
        page.contentMode = UIViewContentModeScaleAspectFit;
        [pagingView addPageView:page];
    }
    
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((width/2)-40, height-10, 80, 8)];
    pageControl.backgroundColor = [UIColor clearColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.numberOfPages = pageSize;
    pageControl.currentPage = 0;
    [pagingView addSubview:pageControl];
    
    // for ios 7
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)pagingView:(InfinitePagingView *)pagingView didEndDecelerating:(UIScrollView *)scrollView atPageIndex:(NSInteger)pageIndex{
    pageControl.currentPage = pageIndex;
}

- (void)timerSet {
    // タイマーの生成例
    //4秒から３秒に変更
    tm1 =[NSTimer scheduledTimerWithTimeInterval:3.0f
                                          target:pagingView
                                        selector:@selector(scrollToNextPage)
                                        userInfo:nil
                                         repeats:YES];
}

- (IBAction)tourism_btn:(id)sender {
    [self performSegueWithIdentifier:@"MapSegue" sender:self];
}

- (IBAction)genji_btn:(id)sender {
    [self performSegueWithIdentifier:@"genjiSegue" sender:self];
}

- (IBAction)special_product_btn:(id)sender {
    [self performSegueWithIdentifier:@"SPSegue" sender:self];
}

- (IBAction)access_btn:(id)sender {
    [self performSegueWithIdentifier:@"AccessSegue" sender:self];
}

- (IBAction)town_office_btn:(id)sender {
    [self performSegueWithIdentifier:@"TownOfficeSegue" sender:self];
}

- (IBAction)review_btn:(id)sender {
    [self performSegueWithIdentifier:@"ReviewSegue" sender:self];
}

- (IBAction)setting_btn:(id)sender {
    [self performSegueWithIdentifier:@"SettingSegue" sender:self];
}

- (IBAction)news_btn:(id)sender {
    [self performSegueWithIdentifier:@"newsSegue" sender:self];
}

- (IBAction)walkrallyButtonEvent:(id)sender {
    [self performSegueWithIdentifier:@"walkrallyTopSegue" sender:self];
}


- (void)weatherSet {
//    NSString *url = @"http://api.openweathermap.org/data/2.5/weather?q=Tagawa,JP&appid=85ecd2795ce2db948c0148683ad74404";
    NSString *url = @"http://api.openweathermap.org/data/2.5/weather?q=Tagawa,JP&units=metric&appid=85ecd2795ce2db948c0148683ad74404";
    NSString *URL_ESCAPE_STR = [[NSString  stringWithString:url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URL_ESCAPE_STR]
                                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:nil
                                                             error:nil];

    @try {
        SBJsonParser * parser = [[SBJsonParser alloc]init];
        NSDictionary * result = [parser objectWithData:responseData];
        
        NSArray *main = [NSArray arrayWithObjects:nil];
        main = [main arrayByAddingObject:[result valueForKeyPath:@"weather.icon"]];
        main = [main arrayByAddingObject:[result valueForKeyPath:@"main.temp"]];
        main = [main arrayByAddingObject:[result valueForKeyPath:@"main.temp_min"]];
        main = [main arrayByAddingObject:[result valueForKeyPath:@"main.temp_max"]];
        
        NSString *ICON = [[[[[main[0] description]
                             stringByReplacingOccurrencesOfString:@"("withString:@""]
                            stringByReplacingOccurrencesOfString:@")" withString:@""]
                           stringByReplacingOccurrencesOfString: @"\n" withString: @""]
                          stringByReplacingOccurrencesOfString: @" " withString: @""];
        
        NSString *TEMP     = [NSString stringWithFormat:@"%@",main[1]];
        NSString *TEMP_MIN = [NSString stringWithFormat:@"%@",main[2]];
        NSString *TEMP_MAX = [NSString stringWithFormat:@"%@",main[3]];
        
        float temp_subtraction     = TEMP.floatValue;
        float temp_min_subtraction = TEMP_MIN.floatValue;
        float temp_max_subtraction = TEMP_MAX.floatValue;
/*
        int temp_set = temp_subtraction;
        int temp_min_set = temp_min_subtraction;
        int temp_max_set = temp_max_subtraction;
        
        _temp_label.text = [NSString stringWithFormat:@"%d(℃)",temp_set];
        _temp_max_label.text = [NSString stringWithFormat:@"%d(℃)",temp_max_set];
        _temp_min_label.text = [NSString stringWithFormat:@"%d(℃)",temp_min_set];
*/
        _temp_label.text     = [NSString stringWithFormat:@"%.1f(℃)",temp_subtraction];
        _temp_max_label.text = [NSString stringWithFormat:@"%.1f(℃)",temp_max_subtraction];
        _temp_min_label.text = [NSString stringWithFormat:@"%.1f(℃)",temp_min_subtraction];
        
        //ICON
        NSString *ICON_SET = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png",ICON];
        NSURL *url3 = [NSURL URLWithString:ICON_SET];
        NSData * myData = [NSData dataWithContentsOfURL:url3];
        UIImage *myImage = [UIImage imageWithData:myData];
        _wetherImage.image = myImage;
    }
    @catch (NSException *exception) {
        _temp_label.text     = @" - (℃)";
        _temp_max_label.text = @" - (℃)";
        _temp_min_label.text = @" - (℃)";
        NSLog(@"Error");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
