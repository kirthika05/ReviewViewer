//
//  APiClient.h
//  ReviewViewer
//
//  Created by AravinthChandran on 07/12/14.
//  Copyright (c) 2014 Arvchz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APiClient : NSObject

-(void)getReviewsForAppID:(NSString *)appID withCompletion:(void(^)(id responseObject, NSError *error))completion;

@end
