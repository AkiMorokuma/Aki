//
//  SQLiteManager.h
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/17.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "MapDto.h"
#import "WalkrallyDto.h"

//データベース名
static NSString* const DB_FILE = @"akamura0021.db";

@interface SQLiteManager : NSObject {
    FMDatabase* db;
}

-(BOOL)openDatabase;
-(NSMutableArray*)getMapData;
-(NSMutableArray*)getMapDataById:(int)idNum;
-(NSMutableArray*)getWalkrallyData;
-(NSMutableArray*)getWalkrallyDataById:(int)idNum;
@end
