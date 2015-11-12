//
//  Product.m
//  NavCtrl
//
//  Created by Chris on 7/1/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "NSObjectProduct.h"

@implementation NSObjectProduct

-(void) dealloc {
    [_companyID release];
    [_name release];
    [_productPic release];
    [_productURL release];
    [super dealloc];
}

@end
