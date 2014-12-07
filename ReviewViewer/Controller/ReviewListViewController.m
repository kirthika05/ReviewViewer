//
//  ReviewListViewController.m
//  ReviewViewer
//
//  Created by AravinthChandran on 07/12/14.
//  Copyright (c) 2014 Arvchz. All rights reserved.
//

#import "ReviewListViewController.h"
#import "APiClient.h"
#import "Review.h"

@interface ReviewListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView    *tableView;
@property (strong, nonatomic) NSMutableArray *reviews; //Of Reviews

@end

@implementation ReviewListViewController

-(void)setAppID:(NSString *)appID{
    _appID = appID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setupSubview];
    [self fetchReview];
}

-(void)setupSubview{
    self.tableView            = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void)fetchReview{
    APiClient *client = [[APiClient alloc]init];
    [client getReviewsForAppID:self.appID withCompletion:^(id responseObject, NSError *error) {
        //Parse the response object
        //Reload the table view
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.reviews count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"ReviewListCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //By this time table
    Review *review = (Review *)self.reviews[indexPath.row];
    cell.textLabel.text = review.reviewDescription;
    return cell;
}


@end
