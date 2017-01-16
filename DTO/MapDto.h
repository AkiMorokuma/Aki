//
//  Map.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/10/17.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapDto : NSObject {
    int id_num_;
    NSString *title_;
    double latitube_;
    double longitube_;
    NSString *detail_;
    NSString *picture_;
}

@property (nonatomic) int result_id_num;
@property (nonatomic) NSString *result_title;
@property (nonatomic) double result_latitube;
@property (nonatomic) double result_longitube;
@property (nonatomic) NSString *result_detail;
@property (nonatomic) NSString *result_picture;
@property (nonatomic) NSString *result_contents;

@end
