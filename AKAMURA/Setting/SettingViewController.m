//
//  SettingViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/06.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "SettingViewController.h"
@import AVKit;
@import AVFoundation;

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self setDelegateOfTable];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"設定";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDelegateOfTable {
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

#pragma table_set
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2; //セクション数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1; //セクションごとのセルの数
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        default:
            return 40; //ヘッダーのサイズ
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) { //各セクションのタイトル
        case 0:
            return @"Akamura";
            break;
        case 1:
            return @"関連動画";
            break;
        default:
            return nil;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

//セルのデータ
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SAMPLE_IDENTIFIER = @"Cell";
    UITableViewCell *setting_cell = [tableView dequeueReusableCellWithIdentifier:SAMPLE_IDENTIFIER];
    
    if(setting_cell == nil) {
        setting_cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SAMPLE_IDENTIFIER];
    }
    if(indexPath.section == 0) {
        NSArray *setting = [[NSArray alloc]initWithObjects:@"現在のバージョン", nil];
        setting_cell.textLabel.text = [setting objectAtIndex:indexPath.row];
        
        NSString *STR_VERSION;
        NSString *STR_VERSION1 = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
        NSString *STR_VERSION2 = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleVersion"];
        
        STR_VERSION = [NSString stringWithFormat:@"%@（%@）",STR_VERSION1,STR_VERSION2];
        setting_cell.detailTextLabel.text = STR_VERSION;
        
    }else if(indexPath.section == 1) {
        setting_cell.textLabel.text = @"赤村レビュー";
        setting_cell.detailTextLabel.text = @"";
    }
    return setting_cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section==1){ //セルタップ時のイベント
        [self movieStartUp];
    }
}

- (void)movieStartUp {
    NSString * const kPlayerItemUrl = @"http://133.17.165.141:8086/upload/red_village_app/movie/review.mov";
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:kPlayerItemUrl];
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
        
        AVPlayerViewController *playerViewController = [[AVPlayerViewController alloc] init];
        playerViewController.player = player;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:playerViewController
                               animated:YES
                             completion:^{
                             }];
        });
    });
}

@end
