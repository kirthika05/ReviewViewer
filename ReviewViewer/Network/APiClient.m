//
//  APiClient.m
//  ReviewViewer
//
//  Created by AravinthChandran on 07/12/14.
//  Copyright (c) 2014 Arvchz. All rights reserved.
//

#import "APiClient.h"
#import "ItunesAPI.h"
#import "Review.h"

@implementation APiClient

-(void)getReviewsForAppID:(NSString *)appID withCompletion:(void (^)(id, NSError *))completion{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfigObject];
    NSString *itunesURLString = [NSString stringWithFormat:ITUNES_REVIEW_API,appID];
    NSURL *itunesURL = [NSURL URLWithString:itunesURLString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:itunesURL];
    request.HTTPMethod = @"GET";
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *reviews = [self parseResponseFromData:data];
        completion(reviews,error);
    }];
    [task resume];
}

-(NSArray *)parseResponseFromData:(NSData *)data{
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *reviews = [NSMutableArray arrayWithArray:[response valueForKeyPath:@"feed.entry.content.label"]];
    return reviews;
}

@end
