//
//  Product.h
//  NavCtrl
//
//  Created by Chris on 7/28/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * companyID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * productPic;
@property (nonatomic, retain) NSString * productURL;

@end
