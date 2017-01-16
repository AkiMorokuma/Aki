//
//  ShowDetailViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/16.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface ShowDetailViewController : UIViewController{
    NSString* _NEWS_TITLE,*_NEWS_PICTURE,* _NEWS_CONTENTS,* _NEWS_DATE;
}

@property (nonatomic) NSString* NEWS_TITLE;
@property (nonatomic) NSString* NEWS_PICTURE;
@property (nonatomic) NSString* NEWS_CONTENTS;
@property (nonatomic) NSString* NEWS_DATE;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentsView;

@end
