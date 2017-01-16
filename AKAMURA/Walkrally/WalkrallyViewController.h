//
//  EasyViewController.h
//  ISICAkaVillage
//
//  Created by Aki Morokuma on 2016/07/08.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FMDatabase.h"
#import "WalkrallyDto.h"
#import "SQLiteManager.h"
#import "AppDelegate.h"

// 問題のレベルをEnumでタイプとしてもつ
typedef NS_ENUM(int, DifficultyType) {
    EASY,
    NORMAL,
    HARD,
    EXPERT
};

@interface WalkrallyViewController : UIViewController <CLLocationManagerDelegate> {
    
    DifficultyType _type;
    NSString* navigationTitle;
    
    int _ID_VALUE;
    
    //クイズの配列
    NSMutableArray *quizData;

    int random;
    int number;
    
    

}

@property(nonatomic) DifficultyType type;
@property (nonatomic) int ID_VALUE;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentsTextview;
@property (weak, nonatomic) IBOutlet UIImageView *contentsView;

@property (nonatomic) BOOL state;



-(void)setNumber;
- (void)quiz:(int)minor
            :(NSMutableArray* )beaconDatar;


@end

