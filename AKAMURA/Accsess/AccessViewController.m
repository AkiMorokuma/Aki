//
//  AccessViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "AccessViewController.h"

@interface AccessViewController ()

@end

@implementation AccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self TableViewProperty];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"交通アクセス";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)TableViewProperty {
    _tableView.dataSource = self;
    _tableView.delegate = self;
    CELL_NUMBER = 0;
}

#pragma table_set

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; //セクションの数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3; //セクションごとのセルの数
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) { //ヘッダーサイズ
        default:
            return 50;
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section){ //各セクションのタイトル
        case 0:
            return @"ご利用の交通手段を選んで下さい。";
            break;
        default:
            return nil;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 86; //セルの高さ
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //セルのデータ
    static NSString *SAMPLEIDENTIFIER = @"Cell";
    UITableViewCell *menu_cell = [tableView dequeueReusableCellWithIdentifier:SAMPLEIDENTIFIER];
    
    if(menu_cell == nil){
        menu_cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SAMPLEIDENTIFIER];
    }
    menu_cell.textLabel.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    
    if(indexPath.section == 0){
        NSArray *setting = [[NSArray alloc]initWithObjects:@"飛行機をご利用の方",@"電車をご利用の方",@"マイカーをご利用の方", nil];
        menu_cell.textLabel.text = [setting objectAtIndex:indexPath.row];
        menu_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return menu_cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //セルタップ時のイベント
    switch (indexPath.row) {
        case 0:
            CELL_NUMBER = @"1";
            break;
        case 1:
            CELL_NUMBER = @"2";
            break;
        case 2:
            CELL_NUMBER = @"3";
            break;
        default:
            break;
    }
    [self performSegueWithIdentifier:@"AccessSegue2" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AccessSegue2"]) {
        AccessViewController2 *viewCon = segue.destinationViewController;
        viewCon.receiveValue = CELL_NUMBER;
    }
}

@end
