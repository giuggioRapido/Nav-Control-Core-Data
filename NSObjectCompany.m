//
//  Company.m
//  NavCtrl
//
//  Created by Chris on 7/1/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "NSObjectCompany.h"

@implementation NSObjectCompany

-(void) dealloc {
    [_name release];
    [_companyID release];
    [_logo release];
    [_symbol release];
    [_products release];
    [super dealloc];
}

@end
