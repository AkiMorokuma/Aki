//
//  ShowViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/07.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "ShowViewController.h"

@implementation ShowViewController

@synthesize myStar;
@synthesize myTitle;
@synthesize myData;
@synthesize mycountents;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self set_detail];
    [self set_Review];
}

- (void)set_Review {
    self.titleLabel.text = myTitle;
    self.dateLabel.text = myData;
    self.contentsText.text = mycountents;
    
    switch ([myStar intValue]) {
        case 1:
            self.naviBar.title = @"★";
            break;
        case 2:
            self.naviBar.title = @"★★";
            break;
        case 3:
            self.naviBar.title = @"★★★";
            break;
        case 4:
            self.naviBar.title = @"★★★★";
            break;
        case 5:
            self.naviBar.title = @"★★★★★";
            break;
        default:
            break;
    }
    
    //タイトルの文字数でフォントサイズ変更
    if(myTitle.length >= 15) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }else if(myTitle.length >= 10) {
        self.titleLabel.font = [UIFont systemFontOfSize:21];
    }
}

- (void)set_detail {
    
    self.contentsText.editable = NO;
    self.contentsText.selectable = NO;
    
    UIImage *title_image = [UIImage imageNamed:@"title_wood"];
    UIImage *date_image = [UIImage imageNamed:@"date_wood"];
    UIImage *view_image = [UIImage imageNamed:@"ine"];
    
    UIImage *title_backimage;
    UIImage *date_backimage;
    UIImage *view_backimage;
    
    CGFloat width = self.titleLabel.frame.size.width;
    CGFloat height = self.titleLabel.frame.size.height;
    
    CGFloat width2 = self.dateLabel.frame.size.width;
    CGFloat height2 = self.dateLabel.frame.size.height;
    
    CGFloat width3 = self.view.frame.size.width;
    CGFloat height3 = self.view.frame.size.height;
    
    CGSize size = CGSizeMake(width,height);
    UIGraphicsBeginImageContext(size);
    [title_image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    title_backimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGSize size2 = CGSizeMake(width2,height2);
    UIGraphicsBeginImageContext(size2);
    [date_image drawInRect:CGRectMake(0, 0, size2.width, size2.height)];
    date_backimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGSize size3 = CGSizeMake(width3,height3);
    UIGraphicsBeginImageContext(size3);
    [view_image drawInRect:CGRectMake(0, 0, size3.width, size3.height)];
    view_backimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.titleLabel.backgroundColor = [UIColor colorWithPatternImage:title_backimage];
    self.dateLabel.backgroundColor = [UIColor colorWithPatternImage:date_backimage];
    self.view.backgroundColor = [UIColor colorWithPatternImage:view_backimage];
    
    //枠線の幅
    self.contentsText.layer.borderWidth = 0.2;
    //角の丸み
    self.contentsText.layer.cornerRadius = 5.0;
    //影の濃さ
    self.contentsText.layer.shadowOpacity = 0.3f;
}

@end
