//
//  NewsViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/16.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDetailViewController.h"
#import "UIImageView+WebCache.h"

@interface NewsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>{
    NSString *NOW_TAG_STRING,*TEXT_BUFFER;
    NSArray *titleData,*pictureData,*contentsData,*dateData;
    NSString *SEND_TITLE,*SEND_PICTURE,*SEND_CONTENTS,*SEND_DATE;
    NSInteger selectedIndex;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
