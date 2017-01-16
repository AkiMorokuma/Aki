//
//  Walkrally.h
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/17.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalkrallyDto : NSObject {
    int id_num_;
    NSString *contents_;
    NSString *picture_;
}

@property (nonatomic) int result_id_num;
@property (nonatomic) NSString *result_contents;
@property (nonatomic) NSString *result_picture;

@end
