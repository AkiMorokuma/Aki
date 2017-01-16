//
//  NewsViewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/16.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self setTable];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    titleData = [NSMutableArray array];
    pictureData = [NSMutableArray array];
    contentsData = [NSMutableArray array];
    dateData = [NSMutableArray array];
    [self setXMLParser];
    [_tableView reloadData];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"News";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)setTable {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark XMLParser

- (void)setXMLParser {
    //XMLを読み込む
    NSURL *myURL = [NSURL URLWithString:@"http://133.17.165.141:8086/upload/red_village_app/event_xml.php"];
    //XMLパーサを初期化
    NSXMLParser *myParser = [[NSXMLParser alloc] initWithContentsOfURL:myURL];
    //デリゲート指定
    myParser.delegate = self;
    // 解析を開始する
    [myParser parse];
}

//解析開始時の処理
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //解析中タグの初期化
    NOW_TAG_STRING = @"";
}

//テキストビューに、タグ名と、price属性を追加する
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    NOW_TAG_STRING = [NSString stringWithString:elementName];
    //テキストバッファの初期化
    TEXT_BUFFER = @"";
}

//テキストバッファに文字を追加する
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([NOW_TAG_STRING isEqualToString:@"title"]||[NOW_TAG_STRING isEqualToString:@"picture"]||[NOW_TAG_STRING isEqualToString:@"contents"]||[NOW_TAG_STRING isEqualToString:@"date"]){
        //テキストバッファに文字を追加する
        TEXT_BUFFER = [TEXT_BUFFER stringByAppendingString:string];
    }
}

//テキストビューにテキストバッファの文字を追加する
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    //テキストビューにテキストバッファの文字を追加す
    if ([elementName isEqualToString:@"title"]) {
        titleData = [titleData arrayByAddingObject:TEXT_BUFFER];
    }
    if ([elementName isEqualToString:@"picture"]) {
        pictureData = [pictureData arrayByAddingObject:TEXT_BUFFER];
    }
    if ([elementName isEqualToString:@"contents"]) {
        contentsData = [contentsData arrayByAddingObject:TEXT_BUFFER];
    }
    if ([elementName isEqualToString:@"date"]) {
        dateData = [dateData arrayByAddingObject:TEXT_BUFFER];
    }
}

#pragma mark tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // セクションは1個とします
}

//セクションヘッダーのタイトル
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

//セクションフッターのタイトル
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return nil;
}

//セルの高さ
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section){
        case 0:
            return titleData.count;
            break;
        default:
            return  0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CELL_IDETIFLER = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDETIFLER];
    
    if(cell ==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDETIFLER];
    }
    
    if(indexPath.section == 0) {
        cell.textLabel.text = [titleData objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData objectAtIndex:indexPath.row];
        typedef enum{
            SDWebImageRetryFailed = 1 << 0,
            SDWebImageLowPriority = 1 << 1,
            SDWebImageCacheMemoryOnly = 1 << 2
        }
        SDWebImageOptions;
        
        NSString *IMAGE_PATH = [NSString stringWithFormat:@"http://133.17.165.141:8086/upload/red_village_app/picture/%@",[pictureData objectAtIndex:indexPath.row]];
        
        NSLog(@"画像のパス：,%@",IMAGE_PATH);
        
        NSURL *image_url = [NSURL URLWithString:IMAGE_PATH];
        UIImage *placeholderImage = [UIImage imageNamed:@"genji1"];
        UIImageView *imageView = [[UIImageView alloc]init];
        
        [imageView sd_setImageWithURL:image_url placeholderImage:placeholderImage];
        
        //画像が大きい場合にはみ出さないようにViewの大きさを固定化
        imageView.frame = CGRectMake(40,0,120,90);
        imageView.backgroundColor = [UIColor blackColor];
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        //アクセサリービューにイメージを設定
        cell.accessoryView = imageView;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedIndex = indexPath.row;
    
    SEND_TITLE = [titleData objectAtIndex:selectedIndex];
    SEND_PICTURE = [pictureData objectAtIndex:selectedIndex];
    SEND_CONTENTS = [contentsData objectAtIndex:selectedIndex];
    SEND_DATE = [dateData objectAtIndex:selectedIndex];
    
    NSLog(@"SEND_T:%@",SEND_TITLE);
    NSLog(@"SEND_P:%@",SEND_PICTURE);
    NSLog(@"SEND_C:%@",SEND_CONTENTS);
    NSLog(@"SEND_D:%@",SEND_DATE);
    
    [self performSegueWithIdentifier:@"ShowSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowSegue"]){
        ShowDetailViewController *show = segue.destinationViewController;
        show.NEWS_TITLE = SEND_TITLE;
        show.NEWS_PICTURE = SEND_PICTURE;
        show.NEWS_CONTENTS = SEND_CONTENTS;
        show.NEWS_DATE = SEND_DATE;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
