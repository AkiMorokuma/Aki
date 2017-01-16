//
//  StartViewController.h
//  ISICAkaVillage
//
//  Created by Aki Morokuma on 2016/07/05.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@import CoreLocation;

// スタートボタンがあるのは、WalkrallyViewControllerなのにこっちが
// スタートってどうなの？
// 自分で難易度って言ってんなら難易度の英語でいいのでは？
// なので、StartViewControllerがスタートボタンがあるほうにして
// 難易度は、DifficultyViewControllerにして
// 実際のコンテンツ部分をWalkrallyViewControllerに変更した
//@interface StartViewController : UIViewController {
//    
//}

@interface DifficultyViewController : UIViewController {
    int diddicultyNum;
}


// 何回も言うけど変数名は、キャメルケースで書こうよ
//@property (weak, nonatomic) IBOutlet UIButton *easy_btn;
//@property (weak, nonatomic) IBOutlet UIButton *normal_btn;
//@property (weak, nonatomic) IBOutlet UIButton *hard_btn;
//@property (weak, nonatomic) IBOutlet UIButton *expert_btn;

@property (weak, nonatomic) IBOutlet UIButton *easyButton;
@property (weak, nonatomic) IBOutlet UIButton *normalButton;
@property (weak, nonatomic) IBOutlet UIButton *hardButton;
@property (weak, nonatomic) IBOutlet UIButton *expertButton;

// ちなみに↑こういう風に繋がなくてもアクション自体は.mの方と紐付いてるから
// ぶっちゃけプロパティ操作（コードで角丸やら）しないなら.hにOutletで紐付ける意味は皆無

@end
