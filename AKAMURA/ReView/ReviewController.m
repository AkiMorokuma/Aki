//
//  ReviewController.m
//  ISICAkaVillage
//
//  Created by araki kenta on 2014/11/07.
//  Copyright (c) 2014年 araki kenta. All rights reserved.
//

#import "ReviewController.h"

@implementation ReviewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationbarTitleSet];
    [self setTable];
}

- (void)navigationbarTitleSet {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.font = [UIFont fontWithName:@"KFhimaji" size:18.0];
    title.textColor = [UIColor whiteColor];
    title.text = @"レビュー";
    [title sizeToFit];
    self.navigationItem.titleView = title;
}

- (void)setTable {
    _tableView.dataSource = self;
    _tableView.delegate = self;
    sectionList =  [NSArray arrayWithObjects:@"★★★★★", @"★★★★", @"★★★", @"★★", @"★", nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    titleData = [NSMutableArray array];
    titleData1 = [NSMutableArray array];
    titleData2 = [NSMutableArray array];
    titleData3 = [NSMutableArray array];
    titleData4 = [NSMutableArray array];
    dateData = [NSMutableArray array];
    dateData1 = [NSMutableArray array];
    dateData2 = [NSMutableArray array];
    dateData3 = [NSMutableArray array];
    dateData4 = [NSMutableArray array];
    contentsData = [NSMutableArray array];
    contentsData1 = [NSMutableArray array];
    contentsData2 = [NSMutableArray array];
    contentsData3 = [NSMutableArray array];
    contentsData4 = [NSMutableArray array];
    evaluationData = [NSMutableArray array];
    evaluationData1 = [NSMutableArray array];
    evaluationData2 = [NSMutableArray array];
    evaluationData3 = [NSMutableArray array];
    evaluationData4 = [NSMutableArray array];
    starsum = 0;
    [self setXMLParser];
    [_tableView reloadData];
}

- (void)setXMLParser {
    //XMLを読み込む
    NSURL *myURL = [NSURL URLWithString:@"http://133.17.165.141:8086/upload/red_village_app/review_xml.php"];
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
    nowTagStr = @"";
}

//テキストビューに、タグ名と、price属性を追加する
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    nowTagStr = [NSString stringWithString:elementName];
    //テキストバッファの初期化
    txtBuffer = @"";
}


//テキストバッファに文字を追加する
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([nowTagStr isEqualToString:@"title"]||[nowTagStr isEqualToString:@"date"]||[nowTagStr isEqualToString:@"contents"]||[nowTagStr isEqualToString:@"star"]) {
        //テキストバッファに文字を追加する
        txtBuffer = [txtBuffer stringByAppendingString:string];
    }
}

//テキストビューにテキストバッファの文字を追加する
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"title"]) {
        //テキストビューにテキストバッファの文字を追加す
        if(txtBuffer.length == 0) txtBuffer = @" ";
        switch ([starsum integerValue]) {
            case 5:
                titleData = [titleData arrayByAddingObject:txtBuffer];
                break;
            case 4:
                titleData1 = [titleData1 arrayByAddingObject:txtBuffer];
                break;
            case 3:
                titleData2 = [titleData2 arrayByAddingObject:txtBuffer];
                break;
            case 2:
                titleData3 = [titleData3 arrayByAddingObject:txtBuffer];
                break;
            case 1:
                titleData4 = [titleData4 arrayByAddingObject:txtBuffer];
                break;
            default:
                break;
        }
    }
    if ([elementName isEqualToString:@"date"]) {
        //テキストビューにテキストバッファの文字を追加する
        switch ([starsum integerValue]) {
            case 5:
                dateData = [dateData arrayByAddingObject:txtBuffer];
                break;
            case 4:
                dateData1 = [dateData1 arrayByAddingObject:txtBuffer];
                break;
            case 3:
                dateData2 = [dateData2 arrayByAddingObject:txtBuffer];
                break;
            case 2:
                dateData3 = [dateData3 arrayByAddingObject:txtBuffer];
                break;
            case 1:
                dateData4 = [dateData4 arrayByAddingObject:txtBuffer];
                break;
            default:
                break;
        }
    }
    if ([elementName isEqualToString:@"contents"]) {
        switch ([starsum integerValue]) {
            case 5:
                contentsData = [contentsData arrayByAddingObject:txtBuffer];
                break;
            case 4:
                contentsData1 = [contentsData1 arrayByAddingObject:txtBuffer];
                break;
            case 3:
                contentsData2 = [contentsData2 arrayByAddingObject:txtBuffer];
                break;
            case 2:
                contentsData3 = [contentsData3 arrayByAddingObject:txtBuffer];
                break;
            case 1:
                contentsData4 = [contentsData4 arrayByAddingObject:txtBuffer];
                break;
            default:
                break;
        }
    }
    if ([elementName isEqualToString:@"star"]) {
        switch ([txtBuffer intValue]) {
            case 5:
                evaluationData = [evaluationData arrayByAddingObject:txtBuffer];
                starsum = @"5";
                break;
            case 4:
                evaluationData1 = [evaluationData1 arrayByAddingObject:txtBuffer];
                starsum = @"4";
                break;
            case 3:
                evaluationData2 = [evaluationData2 arrayByAddingObject:txtBuffer];
                starsum = @"3";
                break;
            case 2:
                evaluationData3 = [evaluationData3 arrayByAddingObject:txtBuffer];
                starsum = @"2";
                break;
            case 1:
                evaluationData4 = [evaluationData4 arrayByAddingObject:txtBuffer];
                starsum = @"1";
                break;
            case 0:
                starsum = @"0";
                break;
        }
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sectionList count]; // セクションは5個とします
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sectionList objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch(section) {
        case 0:
            return evaluationData.count;
            break;
        case 1:
            return evaluationData1.count;
            break;
        case 2:
            return evaluationData2.count;
            break;
        case 3:
            return evaluationData3.count;
            break;
        case 4:
            return evaluationData4.count;
            break;
        default:
            return  0;
            break;
    }
}

// UITableView 継承後　デリゲートにて下記メソッドを追加する。
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionView = [[UIView alloc] init];
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 22.0f)];
    sectionLabel.textColor = [UIColor whiteColor];
    
    switch (section) {
        case 0:
            sectionView.backgroundColor = RGB(222,102,65);
            sectionLabel.text = @"★★★★★";
            break;
        case 1:
            sectionView.backgroundColor = RGB(249,194,112);
            sectionLabel.text = @"★★★★";
            break;
        case 2:
            sectionView.backgroundColor = RGB(252,245,133);
            sectionLabel.text = @"★★★";
            break;
        case 3:
            sectionView.backgroundColor = RGB(199,217,133);
            sectionLabel.text = @"★★";
            break;
        case 4:
            sectionView.backgroundColor = RGB(122,153,206);
            sectionLabel.text = @"★";
            break;
        default:
            break;
    }
    [sectionView addSubview:sectionLabel];
    return sectionView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdetifler = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdetifler];
    if(cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdetifler];
    }
    if(indexPath.section == 0) {
        cell.textLabel.text = [titleData objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData objectAtIndex:indexPath.row];
    }else if(indexPath.section == 1) {
        cell.textLabel.text = [titleData1 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData1 objectAtIndex:indexPath.row];
    }else if(indexPath.section == 2) {
        cell.textLabel.text = [titleData2 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData2 objectAtIndex:indexPath.row];
    }else if(indexPath.section == 3) {
        cell.textLabel.text = [titleData3 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData3 objectAtIndex:indexPath.row];
    }else if(indexPath.section == 4) {
        cell.textLabel.text = [titleData4 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [dateData4 objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ShowViewController *show = [segue destinationViewController];
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        switch (indexPath.section) {
            case 0:
                show.myTitle = [titleData objectAtIndex:selectedIndex];
                show.myData = [dateData objectAtIndex:selectedIndex];
                show.mycountents = [contentsData objectAtIndex:selectedIndex];
                show.myStar = [evaluationData objectAtIndex:selectedIndex];
                break;
            case 1:
                show.myTitle = [titleData1 objectAtIndex:selectedIndex];
                show.myData = [dateData1 objectAtIndex:selectedIndex];
                show.mycountents = [contentsData1 objectAtIndex:selectedIndex];
                show.myStar = [evaluationData1 objectAtIndex:selectedIndex];
                break;
            case 2:
                show.myTitle = [titleData2 objectAtIndex:selectedIndex];
                show.myData = [dateData2 objectAtIndex:selectedIndex];
                show.mycountents = [contentsData2 objectAtIndex:selectedIndex];
                show.myStar = [evaluationData2 objectAtIndex:selectedIndex];
                break;
            case 3:
                show.myTitle = [titleData3 objectAtIndex:selectedIndex];
                show.myData = [dateData3 objectAtIndex:selectedIndex];
                show.mycountents = [contentsData3 objectAtIndex:selectedIndex];
                show.myStar = [evaluationData3 objectAtIndex:selectedIndex];
                break;
            case 4:
                show.myTitle = [titleData4 objectAtIndex:selectedIndex];
                show.myData = [dateData4 objectAtIndex:selectedIndex];
                show.mycountents = [contentsData4 objectAtIndex:selectedIndex];
                show.myStar = [evaluationData4 objectAtIndex:selectedIndex];
                break;
            default:
                break;
        }
    }
}


- (IBAction)write_btn:(id)sender {
    [self performSegueWithIdentifier:@"InsertSegue" sender:self];
}
@end
