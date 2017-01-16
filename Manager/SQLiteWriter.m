//
//  SQLiteWriter.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/10.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "SQLiteWriter.h"

@implementation SQLiteWriter

- (void)setXMLParser {
    [self delete_beacon_contents];
    //XMLを読み込む
    NSURL *myURL = [NSURL URLWithString:@"http://133.17.165.141:8086/upload/red_village_app/beacon_xml.php"];
    //XMLパーサを初期化
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithContentsOfURL:myURL];
    //デリゲート指定
    myParser.delegate = self;
    // 解析を開始する
    [myParser parse];
}

- (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response {
    //レスポンスを受信したときに呼ばれるメソッド
    NSLog(@"レスポンス受信");
    [webData setLength: 0];
}

- (void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) data {
    //dataを受け取ったときに呼ばれるメソッド
    NSLog(@"dataを受け取った");
    [webData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *) connection {
    //データ受信終了後にパースを開始
    NSLog(@"パーサを開始");
    [[NSURLCache sharedURLCache] setMemoryCapacity:0];
    [[NSURLCache sharedURLCache] setDiskCapacity:0];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData: webData];
    [xmlParser setDelegate: self];
    [xmlParser setShouldResolveExternalEntities:YES];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //解析開始時の処理
    //解析中タグの初期化
    nowTagStr = @"";
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    //テキストビューに、タグ名と、price属性を追加する
    nowTagStr = [NSString stringWithString:elementName];
    //テキストバッファの初期化
    txtBuffer = @"";
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    //テキストバッファに文字を追加する
    if ([nowTagStr isEqualToString:@"contents"]) {
        //テキストバッファに文字を追加する
        txtBuffer = [txtBuffer stringByAppendingString:string];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    //テキストビューにテキストバッファの文字を追加する
    if ([elementName isEqualToString:@"contents"]) {
        review_contents = txtBuffer;
        [self  ins_contents:review_contents];
    }
}

-(void) delete_beacon_contents {
    //DBを作るパスとファイル名の取得
    NSArray  *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
   
    NSString *dir   = [paths objectAtIndex:0];
    db_path  = [dir stringByAppendingPathComponent:@"akamura0021.db"];
    NSLog(@"DELETE:%@", db_path );
    
    //FMDBのクラスのインスタンスの作成
    db  = [FMDatabase databaseWithPath:db_path];
    NSString *delete_sql = @"DELETE FROM beacon_tb";
    [db open];
    [db executeUpdate:delete_sql];
     NSLog(@"aaaaaaaaa？");
    [db close];
}

- (void)ins_contents:(NSString*)contents_ans {
    //DBを作るパスとファイル名の取得
    NSArray  *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dir   = [paths objectAtIndex:0];
    db_path  = [dir stringByAppendingPathComponent:@"akamura0021.db"];
    NSLog(@"%@", db_path);
    //FMDBのクラスのインスタンスの作成
    db  = [FMDatabase databaseWithPath:db_path];
    //SQL文を入力
    
    NSString *insert_sql = @"INSERT INTO beacon_tb(contents) VALUES (?)";
    [db open];
    [db executeUpdate:insert_sql,contents_ans];
    [db close];
}

@end
