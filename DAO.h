//
//  DAO.h
//  NavCtrl
//
//  Created by Chris on 7/2/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObjectCompany.h"
#import "NSObjectProduct.h"
#import <CoreData/CoreData.h>
#import "Company.h"
#import "Product.h"

@interface DAO : NSObject

@property (atomic, retain) NSMutableArray *companies;
@property (atomic, retain) NSMutableArray *products;
@property (atomic, retain) NSArray *companyResults;
@property (atomic, retain) NSArray *productResults;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


+(DAO*) sharedDAO;

-(void)initCompaniesAndProducts;
-(void)downloadStocksAndCallSelector:(SEL) method onObject:(id) x;
-(void) deleteProduct:(NSObjectProduct*) product;
-(void) deleteCompany:(NSObjectCompany*) company;

@end
