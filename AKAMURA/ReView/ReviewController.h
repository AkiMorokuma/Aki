//
//  ReviewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/07.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowViewController.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface ReviewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSXMLParserDelegate>{
    NSArray *myData,*myData1,*myData2,*myData3,*myData4;
    NSArray *titleData,*titleData1,*titleData2,*titleData3,*titleData4;
    NSArray *dateData,*dateData1,*dateData2,*dateData3,*dateData4;
    NSArray *contentsData,*contentsData1,*contentsData2,*contentsData3,*contentsData4;
    NSArray *evaluationData,*evaluationData1,*evaluationData2,*evaluationData3,*evaluationData4;

    NSString *starsum,*nowTagStr,*txtBuffer;
    NSArray *sectionList;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTitle;
- (IBAction)write_btn:(id)sender;

@end
