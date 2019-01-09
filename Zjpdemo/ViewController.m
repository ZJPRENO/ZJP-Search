	//
	//  ViewController.m
	//  Zjpdemo
	//
	//  Created by 张俊平 on 16/3/18.
	//  Copyright © 2016年 ZHANGJUNPING. All rights reserved.
	//

#import "ViewController.h"
#import "Model.h"
#import "CustomTableViewCell.h"

@interface ViewController()
<UITableViewDataSource,UITableViewDelegate,
UISearchResultsUpdating,UISearchControllerDelegate
>
{
	UITableView *_tableView;
	NSMutableArray *_dataArr;//数据源；
	UISearchController *_search;//搜索视图；
	NSMutableArray *_resultData;//搜索结果
	BOOL _isSearching;//记录是否为搜索状态
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self createView];
	[self loadData];
	[self createSearch];

}

- (void)createView {
		//  table view

	_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
	_tableView.dataSource = self;
	_tableView.delegate   = self;
	[self.view addSubview:_tableView];

	UIView *view = [[UIView alloc]init];
	_tableView.tableFooterView = view;

}


- (void)loadData {
	_dataArr = [NSMutableArray array];

	Model *model1 = [[Model alloc]init];
	model1.imageName = @"3.jpg";
	model1.title = @"11";
	model1.detail = @"3838";
	[_dataArr addObject:model1];

	Model *model2 = [[Model alloc]init];
	model2.imageName = @"21_16.jpg";
	model2.title = @"荷花";
	model2.detail = @"2345";
	[_dataArr addObject:model2];

}

#pragma mark -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (void)createSearch {
		//创建搜索控制器，是否给他一个结果控制器；
		//结果控制器用来显示搜索结果的；如果给nil，就是当前页面接受结果
	_search = [[UISearchController alloc]initWithSearchResultsController:nil];
		//设置背景颜色是否变灰；
	_search.dimsBackgroundDuringPresentation = YES;
		//UISearchController  自带搜索框；
		//让searchBar  自适应屏幕；
	[_search.searchBar sizeToFit];
		//将搜索框作为表头；
	_tableView.tableHeaderView = _search.searchBar;
		//设置搜索框提示文字
	_search.searchBar.placeholder  = @"请输入关键字";
		//设置背景颜色；
	_search.searchBar.barTintColor = [UIColor redColor];
	_search.searchBar.keyboardType = UIKeyboardTypeDefault;
		//设置搜索代理；
	_search.delegate = self;  //搜索状态
	_search.searchResultsUpdater = self;//搜索结果；
													//初始化结果数组；
	_resultData  = [[NSMutableArray alloc]init];
	_isSearching = NO;

}

#pragma mark - search代理

	//当搜索值发生改变时会自动调用代理函数；
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
		//进去搜索状态；
	_isSearching = YES;
		//搜索结果时时改变；
		//先把旧的搜索结果删除；
	[_resultData removeAllObjects];

		//根据关键字搜索结果：在数据源里搜索；
	for (Model *mod in _dataArr) {
			//去搜索子串是否找到
		if ([mod.title rangeOfString:searchController.searchBar.text].location!=NSNotFound) {

				//找到了就添加到结果数组；
			[_resultData addObject:mod];
		}
	}
		//显示搜索结果
		//刷新tableview；

	[_tableView reloadData];

}

	//搜索结束（点击cancel按钮的时候）
-(void)didDismissSearchController:(UISearchController *)searchController {
		//结束搜索；
	_isSearching = NO;
		//刷新数据；
	[_tableView reloadData];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

		//显示搜索结果；
	if (_isSearching) {

		return _resultData.count;

	}else{
			//返回数据源count；
		return _dataArr.count;
	}
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *reuseID = @"reuseID";

	CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];

	if (cell == nil) {
		cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
	}

		//填充数据；

	if (_isSearching) {

		Model *mod1 = _resultData[indexPath.row];
		[cell loadDataWithModel:mod1];
		return cell;

	}else{
		Model *mod2 = _dataArr[indexPath.row];
		[cell loadDataWithModel:mod2];

		return cell;
		
	}

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

@end
