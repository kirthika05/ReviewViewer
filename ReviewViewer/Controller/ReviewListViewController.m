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

// NSAssert([NSThread isMainThread],@"Method called using a thread other than main!");

-(void)fetchReview{
    APiClient *client = [[APiClient alloc]init];
    [client getReviewsForAppID:self.appID withCompletion:^(id responseObject, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.reviews = responseObject;
            [self.tableView reloadData];
        });
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
    NSString *review = self.reviews[indexPath.row];
    if (![review isEqual:[NSNull null]]) {
        cell.textLabel.text = review;
    }else{
        cell.textLabel.text = [NSString stringWithFormat:@"Reviews of appID %@",self.appID];
    }
    return cell;
}


@end
