//
//  DetailViewController.h
//  AKAMURA
//
//  Created by araki kenta on 2014/09/04.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "MapDto.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "SQLiteManager.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface DetailViewController : UIViewController{
    
    //画像関係
    NSString *_TITLE_VALUE;
    NSString *PIC_NAME;
    BOOL image_tap;
    UIImageView *imageView2;
    UIScrollView *scrollView;
    UIView *view2;
    //詳細の配列
    NSMutableArray *mapData;
    
    BOOL _state;
    AVAudioPlayer* player1;
    AVAudioPlayer* player2;
}
@property (nonatomic) NSString* TITLE_VALUE;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *title_view;
@property (nonatomic) BOOL state;

- (IBAction)cancell_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancell_btn;

@end
