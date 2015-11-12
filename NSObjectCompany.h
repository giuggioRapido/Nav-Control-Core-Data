//
//  Company.h
//  NavCtrl
//
//  Created by Chris on 7/1/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObjectProduct.h"

@interface NSObjectCompany : NSObject

@property (nonatomic, strong) NSNumber* companyID;
@property (nonatomic, retain) NSString* name;

//Aditya -- look into generics   NSArray<Wheel *> *wheels;
@property (nonatomic, retain) NSMutableArray * products;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, retain) NSString *stockPrice;
@property (nonatomic, retain) NSString *symbol;

@end
