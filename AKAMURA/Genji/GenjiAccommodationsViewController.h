//
//  GenjiAccommodationsViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/25.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface GenjiAccommodationsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>{
    int cell_num;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
