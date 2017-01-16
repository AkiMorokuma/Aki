//
//  AccessViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccessViewController2.h"

@interface AccessViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSString *CELL_NUMBER;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
