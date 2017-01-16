//
//  ShowViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/07.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ShowViewController : UIViewController{
    NSString *mytitle,*myDate,*mycontents,*myStar;
}

//受け取る値用
@property (nonatomic, retain) NSString *myTitle;
@property (nonatomic, retain) NSString *myData;
@property (nonatomic, retain) NSString *mycountents;
@property (nonatomic, retain) NSString *myStar;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentsText;
@property (weak, nonatomic) IBOutlet UINavigationItem *naviBar;


@end
