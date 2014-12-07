//
//  Review.h
//  ReviewViewer
//
//  Created by AravinthChandran on 07/12/14.
//  Copyright (c) 2014 Arvchz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property (strong, nonatomic) NSString *appName;
@property (strong, nonatomic) NSString *itunesLink;
@property (strong, nonatomic) NSData   *appIcon;
@property (strong, nonatomic) NSString *appStoreID;
@property (strong, nonatomic) NSString *authorName;
@property (strong, nonatomic) NSString *reviewDescription;

@end
