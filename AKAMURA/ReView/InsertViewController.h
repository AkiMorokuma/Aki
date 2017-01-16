//
//  InsertViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/14.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"

@interface InsertViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate,UIScrollViewDelegate>{
    int star_count;
    BOOL flag;
    BOOL buttonChange;
}

@property (weak, nonatomic) IBOutlet UITextField *titleField; //タイトル
@property (weak, nonatomic) IBOutlet UITextView *contentsView; //コンテンツ
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)postCheck:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *postCheck;

//星
- (IBAction)starOnePush:(id)sender;
- (IBAction)starTwoPush:(id)sender;
- (IBAction)starThreePush:(id)sender;
- (IBAction)starFourPush:(id)sender;
- (IBAction)starFivePush:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *star_one;
@property (weak, nonatomic) IBOutlet UIButton *star_two;
@property (weak, nonatomic) IBOutlet UIButton *star_three;
@property (weak, nonatomic) IBOutlet UIButton *star_four;
@property (weak, nonatomic) IBOutlet UIButton *star_five;

@end
