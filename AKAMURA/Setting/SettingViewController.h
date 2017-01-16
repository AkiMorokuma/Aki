//
//  SettingViewController.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/06.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MPMoviePlayerController *player;

@end
