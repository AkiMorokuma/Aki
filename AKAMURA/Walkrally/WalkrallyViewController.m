//
//  EasyViewController.m
//  ISICAkaVillage
//
//  Created by Aki Morokuma on 2016/07/08.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "WalkrallyViewController.h"
#import "AppDelegate.h"
#import "BeaconManager.h"


@interface WalkrallyViewController ()

@end

@implementation WalkrallyViewController

@synthesize ID_VALUE = _ID_VALUE;
@synthesize type = _type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *imageData = [UIImage imageNamed:@"correct"];
    CGRect rect = CGRectMake(0, 0, 400, 600);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.image = imageData;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    // 問題のデータが各種そろえばコチラの中でquizDataにデータを取得させればいいんじゃないでしょうか？
    switch (_type) {
        case EASY:
            [self navigationbarTitleSet:@"かんたん"];
            //quizData = [[[SQLiteManager alloc] init] getWalkrallyData];
            break;
        case NORMAL:
            [self navigationbarTitleSet:@"ふつう"];
            break;
        case HARD:
            [self navigationbarTitleSet:@"むずかしい"];
            break;
        case EXPERT:
            [self navigationbarTitleSet:@"とてもむずかしい"];
            break;
        default:
            break;
    }
    [self initialization];
    [self dispNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)navigationbarTitleSet:(NSString*)title {
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

- (void)initialization {
//    // 全件取得
//    quizData = [[[SQLiteManager alloc] init] getWalkrallyData];
//    
//    // 全件の個数分からランダムに値を一つ取得
////    switch (_type) {
////        case EASY:
////            random = (int)arc4random_uniform(5);
////            break;
////        case NORMAL:
////            random = (int)arc4random_uniform(6);
////            break;
////        case HARD:
////            random = (int)arc4random_uniform(11);
////            break;
////        case EXPERT:
////            random = (int)arc4random_uniform(19);
////            break;
////
////        default:
////            break;
////    }
//    
//    //ランダムで出た値をつかってquizDataから習得
//    random = 0;
//        WalkrallyDto* walkrallyDto = [quizData objectAtIndex: random];
//        _idLabel.text = [NSString stringWithFormat:@"%d", walkrallyDto.result_id_num];
//        _contentsTextview.text = walkrallyDto.result_contents;
//        _contentsView.image = [UIImage imageNamed:walkrallyDto.result_picture];
//        _contentsView.contentMode = UIViewContentModeRedraw;
//        _contentsView.backgroundColor = [UIColor blackColor];
    
    NSArray* contents = [NSArray arrayWithObjects:@"三角お屋根の内側",
                                                    @"カメの近く",
                                                    @"少し奥のパラソルへ",
                                                    @"公園にあるシャワー室",
                                                    @"蒼い自販機のすぐ近く", nil];

    _contentsTextview.text = [contents objectAtIndex:0];
    
    
}

-(void)dispNumber {
    number = random+1;
    NSLog(@"クイズ：%d", number);
}


- (void)quiz:(int)minor
            :(NSMutableArray* )beaconData {
    
    NSLog(@"MINORRRRR：%d", minor);
    NSLog(@"NUMBERRRR：%d", number);
    
    if(number == minor){
        NSLog(@"正解だドン！！");
    }else {
        NSLog(@"違うドン！！");
    }
    
}




@end
