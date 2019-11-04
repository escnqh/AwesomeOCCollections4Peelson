//
//  ViewController.m
//  AwesomeOCCollections4Peelson
//
//  Created by Peelson on 2019/10/21.
//  Copyright © 2019 Peelson. All rights reserved.
//

#import "MainPageViewController.h"
#import "Collection.h"
#import "CollectionsGroup.h"
#import "Masonry.h"

@interface MainPageViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_collectionsTableView;
    NSMutableArray *_collections;
    NSIndexPath *_selectedIndexPath;
}

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initData];

    _collectionsTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    // 设置数据源，注意必须实现对应的UITableViewDataSource协议
    _collectionsTableView.dataSource = self;
    _collectionsTableView.delegate = self;

    [self.view addSubview:_collectionsTableView];
}

#pragma mark - init data
- (void)initData {
    // Tips：之所以使用#alloc和#init方法是因为他和#new方法的区别在于1.分配空间，2.#new方法写死了#init方法，如果我们想要带有参数的实例化就不能使用自定义方法
    _collections = [[NSMutableArray alloc]init];

    // 第一组
    {
        Collection *collection1 = [Collection initWithTitle:@"竖直滑动列表" andSummary:@"CollectionView&CollectionViewLayout"];
        collection1.onClickListener = ^{
            NSLog(@"clicked!");
        };
        Collection *collection2 = [Collection initWithTitle:@"Test2" andSummary:@"Test2 in group1"];
        Collection *collection3 = [Collection initWithTitle:@"Test3" andSummary:@"Test3 in group1"];
        CollectionsGroup *group1 = [CollectionsGroup initWithGroupName:@"列表Demo" andCollections:[NSMutableArray arrayWithObjects:collection1, collection2, collection3, nil]];
        [_collections addObject:group1];
    }
    // 第二组
    {
        Collection *collection1 = [Collection initWithTitle:@"Test1" andSummary:@"Test1 in group2"];
        Collection *collection2 = [Collection initWithTitle:@"Test2" andSummary:@"Test2 in group2"];
        Collection *collection3 = [Collection initWithTitle:@"Test3" andSummary:@"Test3 in group2"];
        CollectionsGroup *group2 = [CollectionsGroup initWithGroupName:@"Group1" andCollections:[NSMutableArray arrayWithObjects:collection1, collection2, collection3, nil]];
        [_collections addObject:group2];
    }
    // 第三组
    {
        Collection *collection1 = [Collection initWithTitle:@"Test1" andSummary:@"Test1 in group3"];
        Collection *collection2 = [Collection initWithTitle:@"Test2" andSummary:@"Test2 in group3"];
        Collection *collection3 = [Collection initWithTitle:@"Test3" andSummary:@"Test3 in group3"];
        CollectionsGroup *group3 = [CollectionsGroup initWithGroupName:@"Group3" andCollections:[NSMutableArray arrayWithObjects:collection1, collection2, collection3, nil]];
        [_collections addObject:group3];
    }
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _collections.count;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CollectionsGroup *group = _collections[section];
    return group.collections.count;
}

#pragma mark返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionsGroup *group = _collections[indexPath.section];
    Collection *collection = group.collections[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [collection getTitle];
    cell.detailTextLabel.text = [collection getSummary];
    return cell;
}

#pragma mark 返回每组头标题名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CollectionsGroup *group = _collections[section];
    return group.groupName;
}

#pragma mark 点击行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;
    CollectionsGroup *group = _collections[indexPath.section];
    Collection *collection = group.collections[indexPath.row];
    collection.onClickListener();
}

#pragma mark 重写状态样式方法
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
