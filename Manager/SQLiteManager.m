//
//  SQLiteManager.m
//  ISICAkaVillage
//
//  Created by ArakiKenta on 2016/07/17.
//  Copyright © 2016年 araki kenta. All rights reserved.
//

#import "SQLiteManager.h"

@implementation SQLiteManager

- (BOOL)openDatabase {
    //DBファイルへのパスを取得
    //パスは~/Documents/配下に格納される。
    NSString *DB_PATH = nil;
    NSArray *documentsPath = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    
    //取得データ数を確認
    if ([documentsPath count] >= 1) {
        //固定で0番目を取得でOK
        DB_PATH = [documentsPath objectAtIndex:0];
        //パスの最後にファイル名をアペンドし、DBファイルへのフルパスを生成。
        DB_PATH = [DB_PATH stringByAppendingPathComponent:DB_FILE];
        NSLog(@"db path : %@", DB_PATH);
        
    } else {
        //error
        NSLog(@"search Document path error. database file open error.");
        return false;
    }
    
    //DBファイルがDocument配下に存在するか判定
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:DB_PATH]) {
        //存在しない
        //デフォルトのDBファイルをコピー(初回のみ)
        //ファイルはアプリケーションディレクトリ配下に格納されている。
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *ORG_PATH = [bundle bundlePath];
        //初期ファイルのパス。(~/XXX.app/sample.db)
        ORG_PATH = [ORG_PATH stringByAppendingPathComponent:DB_FILE];
        
        //デフォルトのDBファイルをDocument配下へコピー
        if (![fileManager copyItemAtPath:ORG_PATH toPath:DB_PATH error:nil]) {
            //error
            NSLog(@"db file copy error. : %@ to %@.", ORG_PATH, DB_PATH);
            return false;
        }
    }
    //open database with FMDB.
    db = [FMDatabase databaseWithPath:DB_PATH];
    return [db open];
}

- (void)selectContents {
    [self openDatabase];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DOCUMENTS_DIRECTORY = [paths objectAtIndex:0];
    NSString *WRITABLE_DBPATH = [DOCUMENTS_DIRECTORY stringByAppendingPathComponent:DB_FILE];
    BOOL success = [fileManager fileExistsAtPath:WRITABLE_DBPATH];
    if(!success) {
        NSString *DEFAULT_DBPATH = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_FILE];
        success = [fileManager copyItemAtPath:DEFAULT_DBPATH toPath:WRITABLE_DBPATH error:&error];
    }
    if(!success) {
        NSAssert1(0, @"failed to create writable db file with message '%@'.", [error localizedDescription]);
    }
    if(![db open]) {
        NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
    [db setShouldCacheStatements:YES];
}

/**
 *  本来はDAOかServiceクラスを作ってそこでSQL叩くのを実装すべきだけど余力がないのでここに一旦書きます
 *
 */

//++++++++++++++++++++++++++++++++++++++++
// map_tb
//++++++++++++++++++++++++++++++++++++++++

/**
 *  Mapのデータを全件取得します。
 *
 *  @return NSMutableArrayで返します。
 */
- (NSMutableArray*)getMapData {
    [self selectContents];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM map_tb"];
    FMResultSet* rs = [db executeQuery:sql];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    
    while( [rs next] ){
        MapDto *mapDto = [[MapDto alloc]init];
        mapDto.result_id_num     = [rs intForColumn:@"id"];
        mapDto.result_title      = [rs stringForColumn:@"title"];
        mapDto.result_latitube   = [rs doubleForColumn:@"latitube"];
        mapDto.result_longitube  = [rs doubleForColumn:@"longitube"];
        mapDto.result_detail     = [rs stringForColumn:@"detail"];
        mapDto.result_picture = [rs stringForColumn:@"picture"];
        [data addObject:mapDto];
    }
    
    [rs close];
    [db close];
    return data;
}

/**
 *  Mapのデータを1件取得します。
 *
 *  @return NSMutableArrayで返します。
 */
- (NSMutableArray*)getMapDataById:(int)idNum {
    [self selectContents];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM map_tb where id = %d",idNum];
    FMResultSet* rs = [db executeQuery:sql];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    
    while( [rs next] ){
        MapDto *mapDto = [[MapDto alloc]init];
        mapDto.result_id_num     = [rs intForColumn:@"id"];
        mapDto.result_title      = [rs stringForColumn:@"title"];
        mapDto.result_latitube   = [rs doubleForColumn:@"latitube"];
        mapDto.result_longitube  = [rs doubleForColumn:@"longitube"];
        mapDto.result_detail     = [rs stringForColumn:@"detail"];
        mapDto.result_picture = [rs stringForColumn:@"picture"];
        [data addObject:mapDto];
    }
    
    [rs close];
    [db close];
    return data;
}

//++++++++++++++++++++++++++++++++++++++++
// walkrally_tb
//++++++++++++++++++++++++++++++++++++++++

/**
 *  Walkrallyのデータを全件取得します。
 *
 *  @return NSMutableArrayで返します。
 */
-(NSMutableArray*) getWalkrallyData {
    [self selectContents];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM walkrally_tb"];
    FMResultSet* rs = [db executeQuery:sql];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    
    while( [rs next] ){
        WalkrallyDto *walkrallyDto   = [[WalkrallyDto alloc]init];
        walkrallyDto.result_id_num   = [rs intForColumn:@"id"];
        walkrallyDto.result_contents = [rs stringForColumn:@"contents"];
        walkrallyDto.result_picture = [rs stringForColumn:@"picture"];
        [data addObject:walkrallyDto];
    }
    
    [rs close];
    [db close];
    return data;
}

/**
 *  Walkrallyのデータを1件取得します。
 *
 *  @return NSMutableArrayで返します。
 */
-(NSMutableArray*) getWalkrallyDataById:(int)idNum {
    [self selectContents];
    NSString* sql = [NSString stringWithFormat:@"SELECT * FROM walkrally_tb where id = %d", idNum];
    FMResultSet* rs = [db executeQuery:sql];
    NSMutableArray* data = [[NSMutableArray alloc] init];
    
    while( [rs next] ){
        WalkrallyDto *walkrallyDto   = [[WalkrallyDto alloc]init];
        walkrallyDto.result_id_num   = [rs intForColumn:@"id"];
        walkrallyDto.result_contents = [rs stringForColumn:@"contents"];
        walkrallyDto.result_picture = [rs stringForColumn:@"picture"];
        [data addObject:walkrallyDto];
    }
    
    [rs close];
    [db close];
    return data;
}


@end
