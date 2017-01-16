//
//  GenjiAccommodationsViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/25.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "GenjiAccommodationsViewController.h"

@interface GenjiAccommodationsViewController ()

@end

@implementation GenjiAccommodationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    _tableView.dataSource = self;
    _tableView.delegate = self;
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"宿泊施設";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

#pragma table_set
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2; //セクションの数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) { //セクションごとのセルの数
        case 0:
            return 5;
            break;
        case 1:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch (section) { //ヘッダーサイズ
        default:
            return 50;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65; //セルの高さ
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) { //各セクションのタイトル
        case 0:
            return @"ご利用の施設を選んで下さい。";
            break;
        case 1:
            return @"お問い合わせ";
            break;
        default:
            return nil;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //セルのデータ
    static NSString *SAMPLEIDENTIFIER = @"Cell";
    UITableViewCell *menu_cell = [tableView dequeueReusableCellWithIdentifier:SAMPLEIDENTIFIER];
    
    if(menu_cell == nil){
        menu_cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SAMPLEIDENTIFIER];
    }
    
    menu_cell.textLabel.font = [UIFont fontWithName:@"KFhimaji" size:15.0];
    
    if(indexPath.section == 0){
        NSArray *setting = [[NSArray alloc]initWithObjects:@"ホタル館",@"ロッジ",@"バンガロー",@"ガーデンホーム",@"キャンプ場",nil];
        menu_cell.textLabel.text = [setting objectAtIndex:indexPath.row];
        menu_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.section ==1){
        NSArray *setting = [[NSArray alloc]initWithObjects:@"E-mail",nil];
        menu_cell.textLabel.text = [setting objectAtIndex:indexPath.row];
        menu_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return menu_cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) { //セルタップ時のイベント
        switch (indexPath.row) {
            case 0:
                cell_num = 1;
                break;
            case 1:
                cell_num = 2;
                break;
            case 2:
                cell_num = 3;
                break;
            case 3:
                cell_num = 4;
                break;
            case 4:
                cell_num = 5;
                break;
            default:
                break;
        }
        [self performSegueWithIdentifier:@"detailAccommodationsSegue" sender:self];
    }else if(indexPath.section==1){
        [self mailStartUp];
    }
}

- (void)mailStartUp {
    // メールアプリ起動
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (mailClass != nil) {
        MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
        mailPicker.mailComposeDelegate = self;
        [mailPicker setSubject:NSLocalizedString(@"源じいの森へのお問い合わせ", @"")];
         NSArray *toRecipients = [NSArray arrayWithObject:@"genjiinomori@mb.fcom.ne.jp"];
        
        [mailPicker setMessageBody:@"" isHTML:NO];
        [mailPicker setToRecipients:toRecipients];
        
        if ([mailClass canSendMail]) {
            [self presentViewController:mailPicker animated:TRUE completion:nil];
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    // メール送信処理完了時のイベント
    switch (result){
        // キャンセル
        case MFMailComposeResultCancelled:
            break;
        // 保存
        case MFMailComposeResultSaved:
            break;
        // 送信
        case MFMailComposeResultSent:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"送信に成功しました。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        // 送信失敗
        case MFMailComposeResultFailed:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"送信に失敗しました。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            break;
        }
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailAccommodationsSegue"]) {
        WebViewController *viewCon = segue.destinationViewController;
        viewCon.receive_num = cell_num;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
