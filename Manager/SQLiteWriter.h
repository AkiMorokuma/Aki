//
//  SQLiteWriter.h
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/10.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"

@interface SQLiteWriter : NSObject<NSXMLParserDelegate>{
    //SQLite
    NSString *db_path;
    FMDatabase *db;
    
    //XML
    NSString *starsum;
    NSString *nowTagStr;
    NSString *txtBuffer;
    NSMutableData *webData;
    NSString *review_contents;
}

- (void)setXMLParser;


@end
