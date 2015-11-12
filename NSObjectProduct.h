//
//  Product.h
//  NavCtrl
//
//  Created by Chris on 7/1/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObjectProduct : NSObject

@property (nonatomic, strong) NSNumber* companyID;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSURL* productURL;
@property (nonatomic, retain) NSString* productPic;


@end
