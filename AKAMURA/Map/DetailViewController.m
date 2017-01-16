//
//  DetailViewController.m
//  AKAMURA
//
//  Created by araki kenta on 2014/09/04.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize TITLE_VALUE = _TITLE_VALUE;
@synthesize state = _state;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate]; // デリゲート呼び出し
    if (_state == NO) {
        _TITLE_VALUE = appDelegate.title;
    }else{
        _state = NO;
    }
    
    NSLog(@"DetailViewController  Title:%@",_TITLE_VALUE);
    mapData = [[[SQLiteManager alloc] init] getMapData];
    [self navigationbarTitleSet];
    [self initialization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"詳細";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)initialization {
    //タップを有効化する。
    _imageView.userInteractionEnabled = YES;
    _imageView.tag = 1;
    image_tap = YES;
    [self.cancell_btn setEnabled:NO];
    
    self.title_label.backgroundColor = RGB(205, 0, 0);
    self.title_view.backgroundColor = RGB(205, 0, 0);

    NSString *soundpass1 = [[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:@"komyo_templebell.mp3"];
    NSURL *urOfsound1 = [NSURL fileURLWithPath:soundpass1];
    player1 =[[AVAudioPlayer alloc] initWithContentsOfURL:urOfsound1 error:nil];
    
    NSString *soundpass2 = [[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:@"waterfall.mp3"];
    NSURL *urOfsound2 = [NSURL fileURLWithPath:soundpass2];
    player2 =[[AVAudioPlayer alloc] initWithContentsOfURL:urOfsound2 error:nil];
    
    for (int i = 0; i<mapData.count; i++) {
        MapDto* mapDto = [mapData objectAtIndex:i];
        if([_TITLE_VALUE isEqualToString:mapDto.result_title]){
            
            _imageView.image = [UIImage imageNamed:mapDto.result_picture];
            _textView.text = [NSString stringWithFormat:@"%@",mapDto.result_detail];
            _textView.font = [UIFont systemFontOfSize:18];
            _title_label.text = _TITLE_VALUE;
            
            //TODO: SQLiteから取ってきたresult_pictureが画像の名前と一致してなさそう
            
            PIC_NAME = mapDto.result_picture;
            
            if([mapDto.result_title isEqualToString:@"光明寺の梵鐘"]){
                [player1 prepareToPlay];
                [player1 play];
            }else if([mapDto.result_title isEqualToString:@"大音の滝"]){
                [player2 prepareToPlay];
                [player2 play];
            }
        }
    }
    
    [self setScrollImage];
    [self setBlackView];
    [self.view addSubview:view2];
    [self.view addSubview:scrollView];
    
    scrollView.hidden = YES;
    view2.hidden = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //タッチイベントの取得
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            if(image_tap){
                image_tap = NO;
                
                scrollView.hidden = NO;
                view2.hidden = NO;
                
                [self.cancell_btn setEnabled:YES];
            }
            break;
        default:
            break;
    }
}

- (void)setScrollImage {
    //スクロールビューの初期化
    scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.frame;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    scrollView.bounces = YES;
    
    //画像を指定
    UIImage *image =[UIImage imageNamed:PIC_NAME];
    imageView2 = [[UIImageView alloc]initWithImage:image];
    
    imageView2.frame = self.view.bounds;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.tag = 2;
    
    scrollView.contentSize = imageView2.frame.size;
    
    //スクロールビューに画像を貼り付け
    [scrollView addSubview:imageView2];
    
    //拡大/縮小対応
    scrollView.delegate = (id)self;
    scrollView.minimumZoomScale = 1.0;
    scrollView.maximumZoomScale = 3.0;
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    //拡大/縮小対応
    return imageView2;
}

- (void)setBlackView {
    //画像背景のView生成
    view2 = [[UIView alloc] init];
    view2.frame = self.view.bounds;
    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view2.backgroundColor = [UIColor blackColor];
}

- (IBAction)cancell_btn:(id)sender {
    scrollView.hidden = YES;
    view2.hidden = YES;
    image_tap = YES;
    [self.cancell_btn setEnabled:NO];
}
@end
