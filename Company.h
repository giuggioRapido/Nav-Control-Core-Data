//
//  Company.h
//  NavCtrl
//
//  Created by Chris on 7/28/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Company : NSManagedObject

@property (nonatomic, retain) NSNumber * companyID;
@property (nonatomic, retain) NSString * logo;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * symbol;

@end
