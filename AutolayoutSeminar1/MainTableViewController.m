//
//  MainTableViewController.m
//  AutolayoutSeminar1
//
//  Created by satoutakeshi on 2015/08/10.
//  Copyright (c) 2015年 satoutakeshi. All rights reserved.
//

#import "MainTableViewController.h"
#import "CenterViewController.h"
#import "EqualIntervalViewController.h"
#import "VerticalScrollViewController.h"
#import "VerticalAndHorizontalScrollViewController.h"
@interface MainTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *pageIdentifier;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.pageIdentifier = @[@"Center", @"EqualInterval", @"VerticalScroll", @"VerticalAndHorizontalScroll"];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.pageIdentifier.count;
}

//セルの生成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *pageCell = [self getTableCell:tableView cellIdentifier:@"pageCell"];

    //Storyboad名を表示する
    pageCell.textLabel.text = self.pageIdentifier[indexPath.row];
    
    return pageCell;
}

//セル生成メソッド
-(UITableViewCell *)getTableCell:(UITableView *)tableview cellIdentifier:(NSString *)cellIdentifier
{
    UITableViewCell *cell;
    NSString *cellID = cellIdentifier;
    
    cell = [tableview dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 選択状態の解除
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //storyboad名の取得
    NSString *storyboadName = self.pageIdentifier[indexPath.row];
    
    
    //ページ遷移する
    //storyboadを取得
    UIStoryboard *stb = [UIStoryboard storyboardWithName:self.pageIdentifier[indexPath.row] bundle:nil];
    
    
    if ([storyboadName isEqualToString:@"Center"]) {
    
        //中心線のViewConへ遷移
        CenterViewController *centerViewController = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:centerViewController animated:YES];
    
    }else if ([storyboadName isEqualToString:@"EqualInterval"]){
        
        //等間隔のViewConへ遷移
        EqualIntervalViewController *equalInterValViewController = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:equalInterValViewController animated:YES];
        
        
    }else if([storyboadName isEqualToString:@"VerticalScroll"]){
        
        //縦スクロールのViewConへ遷移
        VerticalScrollViewController *verticalScrollViewController = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:verticalScrollViewController animated:YES];
        
    }else if ([storyboadName isEqualToString:@"VerticalAndHorizontalScroll"]){
        
        //縦横スクロールのViewConへ遷移
        VerticalAndHorizontalScrollViewController *verticalAndHorizonViewController = [stb instantiateInitialViewController];
        [self.navigationController pushViewController:verticalAndHorizonViewController animated:YES];
    }
    
    
}



@end
