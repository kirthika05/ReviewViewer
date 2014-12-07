//
//  ViewController.m
//  ReviewViewer
//
//  Created by AravinthChandran on 07/12/14.
//  Copyright (c) 2014 Arvchz. All rights reserved.
//

#import "ViewController.h"
#import "ReviewListViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)retrieveReviews:(id)sender {
    ReviewListViewController *reviewController = [[ReviewListViewController alloc]init];
    reviewController.appID = self.inputField.text;
    [self.navigationController pushViewController:reviewController animated:YES];
}

@end
