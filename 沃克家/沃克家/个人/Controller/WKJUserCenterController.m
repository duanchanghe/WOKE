//
//  WKJUserCenterController.m
//  沃克家
//
//  Created by 段昌鹤 on 2016/12/2.
//  Copyright © 2016年 jundanuantong. All rights reserved.
//

#import "WKJUserCenterController.h"

@interface WKJUserCenterController ()<UITableViewDelegate,UITableViewDataSource>

//底层铺垫
@property (nonatomic,strong) UIImageView * backGroundView;

//TableView
@property (nonatomic,strong) UITableView * tableView;

//图片数组以及Text数组
@property (nonatomic,retain) NSMutableArray * imageArray;
@property (nonatomic,retain) NSMutableArray * titleArray;

//头部视图
@property (nonatomic,retain) UIView * headerView;

@property (nonatomic,strong) UIButton * headPortrait;             //头像按钮
@property (nonatomic,strong) UILabel * name;                      //名字
@property (nonatomic,strong) UILabel * membershipGrade;           //会员等级
@property (nonatomic,strong) UIButton * qrCode;                   //二维码按钮

@property (nonatomic,strong) UIButton * myOrdersButton;           //我的订单按钮(clear)
@property (nonatomic,strong) UILabel * myOrdersLabel;             //我的订单标签
@property (nonatomic,strong) UIImageView * indicator;             //我的订单指示标

@property (nonatomic,strong) UIButton * waitingForPayment;        //待付款
@property (nonatomic,strong) UIButton * waitForTheDelivery;       //待发货
@property (nonatomic,strong) UIButton * theShipments;             //已发货
@property (nonatomic,strong) UIButton * waitingForTheEvaluation;  //待评价

@end

@implementation WKJUserCenterController

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self adapterUI];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//添加约束
- (void)adapterUI {

    [self.backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [self headerView];
    
    [self.headPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (UIImageView*)backGroundView {
    if (!_backGroundView) {
        UIImageView * backGroundView = [[UIImageView alloc]init];
        backGroundView.image = [UIImage imageNamed:@"back"];
        backGroundView.userInteractionEnabled = YES;
        [self.view addSubview:backGroundView];
        _backGroundView = backGroundView;
    }
    return _backGroundView;
}

- (UITableView*)tableView {
    if (!_tableView) {
        UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.userInteractionEnabled = YES;
        tableView.backgroundColor = MainBackgroundColor;
        [tableView registerClass:[WKJTableViewCell class] forCellReuseIdentifier:@"WKJTableViewCell"];
        [self.view addSubview:tableView];
        tableView.backgroundView = _backGroundView;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray*)imageArray {
    if (!_imageArray) {
        
        NSArray * firstArray = [NSArray arrayWithObjects:@"收藏",@"我的佣金",@"地址管理", nil];
        NSArray * secondArray = [NSArray arrayWithObjects:@"好友邀请",@"客服",@"帮助中心",@"系统设置", nil];
        NSMutableArray * imageArray = [NSMutableArray arrayWithObjects:firstArray,secondArray, nil];
        _imageArray = imageArray;
    }
    return _imageArray;
}

- (NSMutableArray*)titleArray {
    if (!_titleArray) {
        
        NSArray * firstArray = [NSArray arrayWithObjects:@"我的收藏",@"我的佣金",@"地址管理", nil];
        NSArray * secondArray = [NSArray arrayWithObjects:@"好友邀请",@"在线客服",@"帮助中心",@"系统设置", nil];
        NSMutableArray * titleArray = [NSMutableArray arrayWithObjects:firstArray,secondArray, nil];
        _titleArray = titleArray;
    }
    return _titleArray;
}

- (UIView*)headerView {
    if (!_headerView) {
        UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, SCREEN_WIDTH * 242/375)];
        headerView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = headerView;
        _headerView = headerView;
    }
    return _headerView;
}

- (UIButton*)headPortrait {
    if (!_headPortrait) {
        UIButton * headPortrait = [[UIButton alloc]init];
        headPortrait.layer.masksToBounds = YES;
        headPortrait.layer.cornerRadius = headPortrait.frame.size.height/2;
        [headPortrait sd_setImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"cat"]];
        [self.headerView addSubview:headPortrait];
    }
    return _headPortrait;
}

- (UILabel*)name {
    if (!_name) {
        
    }
    return _name;
}

- (UILabel*)membershipGrade {
    if (!_membershipGrade) {
        
    }
    return _membershipGrade;
}

- (UIButton*)qrCode {
    if (!_qrCode) {
        
    }
    return _qrCode;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }else {
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = MainBackgroundColor;
    return view;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"WKJTableViewCell";
    WKJTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (indexPath.section == 0) {
        NSArray * imageArray = [self.imageArray objectAtIndex:0];
        NSArray * titleArray = [self.titleArray objectAtIndex:0];
        cell.leftImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
        cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    }else {
        NSArray * imageArray = [self.imageArray objectAtIndex:1];
        NSArray * titleArray = [self.titleArray objectAtIndex:1];
        cell.leftImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
        cell.titleLabel.text = [titleArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLayoutSubviews
{
    
    NSLog(@"---------%f",self.headPortrait.frame.size.width);
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
