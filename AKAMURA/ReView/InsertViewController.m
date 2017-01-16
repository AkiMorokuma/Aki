//
//  InsertViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self setScrollView];
    [self setTextView];
    [self setStar];
    [self setTextField];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    
    gestureRecognizer.cancelsTouchesInView = NO;
    
    [self.view addGestureRecognizer:gestureRecognizer];
    [self.scrollView addGestureRecognizer:gestureRecognizer];
    // リターンキーの種類を設定
    self.titleField.returnKeyType = UIReturnKeyDefault;
    self.contentsView.returnKeyType = UIReturnKeyDefault;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // キーボード表示・非表示時のイベント削除
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"投稿";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)setTextView {
    buttonChange = NO;
    self.contentsView.delegate = self;
    self.contentsView.text = @"赤村へのコメントを記述して下さい。";
    self.contentsView.textColor = [UIColor lightGrayColor];
}

- (void)setStar {
    [self.star_five setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 1;
}

- (void)scrollViewDidScroll:(id)scrollView {
    CGPoint origin = [scrollView contentOffset];
    [scrollView setContentOffset:CGPointMake(0.0, origin.y)];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // キーボードを隠す
    [self closeKeyboard];
    return YES;
}

- (void)closeKeyboard {
    [self.view endEditing: YES];
}

- (void)setScrollView {
    self.scrollView.delegate = self;
}

- (void)setTextField {
    self.titleField.delegate = self;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    buttonChange = YES;
    // 編集開始
    if ([textView.text isEqualToString:@"赤村へのコメントを記述して下さい。"]){
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
    [self buttonSet];
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    // 編集終了
    if ([textView.text isEqualToString:@""]){
        textView.text = @"赤村へのコメントを記述して下さい。";
        textView.textColor = [UIColor lightGrayColor];
    }
    [self buttonSet];
    [textView resignFirstResponder];
}

-(void) buttonSet {
    if (buttonChange) {
        self.postCheck.titleLabel.text = @"確定する！";
    }else{
        self.postCheck.titleLabel.text = @"投稿する！";
    }
}

//タイトルの文字数制限
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    buttonChange = YES;
    [self buttonSet];
    // 最大入力文字数
    int maxInputLength = 20;
    
    // 入力済みのテキストを取得
    NSMutableString *STR = [self.titleField.text mutableCopy];
    
    // 入力済みのテキストと入力が行われたテキストを結合
    [STR replaceCharactersInRange:range withString:string];
    
    if ([STR length] > maxInputLength) {
        // ※ここに文字数制限を超えたことを通知する処理を追加
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)starOnePush:(id)sender {
    [self.star_five setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 1;
}

- (IBAction)starTwoPush:(id)sender {
    [self.star_five setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 2;
}

- (IBAction)starThreePush:(id)sender {
    [self.star_five setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 3;
}

- (IBAction)starFourPush:(id)sender {
    [self.star_five setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 4;
}

- (IBAction)starFivePush:(id)sender {
    [self.star_five setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_four setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_three setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_two setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [self.star_one setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    star_count = 5;
}

- (IBAction)postCheck:(id)sender {
    
    if (buttonChange) {
        [self closeKeyboard];
        buttonChange = NO;
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"投稿を行います。" message:@"以上の内容でよろしいですか？" preferredStyle:UIAlertControllerStyleAlert];
        
        // addActionした順に左から右にボタンが配置されます
        [alertController addAction:[UIAlertAction actionWithTitle:@"はい" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // otherボタンが押された時の処理
            [self sendButtonPushed];
        }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)sendButtonPushed {
    if (![[[Util alloc] init] networkCheck:self]) {
        [self startPostCommunication];
    }
}

- (void)startPostCommunication {
    //URL文字列の作成
    NSString *ADDRESS = [NSString stringWithFormat:@"http://133.17.165.141:8086/upload/red_village_app/review_insert.php"];
    //URLオブジェクトの作成
    NSURL *testurl = [NSURL URLWithString:ADDRESS];
    //POSTの場合はNSMutableURLRequestで宣言する
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:testurl];
    //POSTで送るデータを定義
    NSString *POST_DATA = [NSString stringWithFormat:@"star=%d&title=%@&contents=%@",star_count,self.titleField.text,self.contentsView.text];
    //メソッドをPOSTにする
    request.HTTPMethod = @"POST";
    //データをエンコーディング
    request.HTTPBody = [POST_DATA dataUsingEncoding:NSUTF8StringEncoding];
    //レスポンス変数を空で宣言（必要に応じてオブジェクトが作成されるから）
    NSURLResponse *response = nil;
    //エラー変数を空で宣言（必要に応じてオブジェクトが作成されるから）
    NSError *error = nil;
    //NSURLConnectionのメソッドを呼び出して同期接続を開始
    NSData *data = [NSURLConnection sendSynchronousRequest: request returningResponse:&response error:&error];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
}
@end
