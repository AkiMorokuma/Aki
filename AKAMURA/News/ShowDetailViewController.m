//
//  ShowDetailViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/16.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "ShowDetailViewController.h"

@interface ShowDetailViewController ()

@end

@implementation ShowDetailViewController

@synthesize NEWS_TITLE = _NEWS_TITLE;
@synthesize NEWS_PICTURE = _NEWS_PICTURE;
@synthesize NEWS_CONTENTS = _NEWS_CONTENTS;
@synthesize NEWS_DATE = _NEWS_DATE;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDetail];
}

- (void)setDetail {
    typedef enum{
        SDWebImageRetryFailed = 1 << 0,
        SDWebImageLowPriority = 1 << 1,
        SDWebImageCacheMemoryOnly = 1 << 2
    }
    SDWebImageOptions;
    
    NSString *IMAGE_PATH = [NSString stringWithFormat:@"http://133.17.165.141:8086/upload/red_village_app/picture/%@",_NEWS_PICTURE];
    NSURL *image_url = [NSURL URLWithString:IMAGE_PATH];
    UIImage *placeholderImage = [UIImage imageNamed:@"genji1"];
    [self.imageView sd_setImageWithURL:image_url placeholderImage:placeholderImage];
    self.titleLabel.text = _NEWS_TITLE;
    self.contentsView.text = [NSString stringWithFormat:@"%@\n\n%@ 投稿",_NEWS_CONTENTS,_NEWS_DATE];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
