//
//  DAO.m
//  NavCtrl
//
//  Created by Chris on 7/2/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "DAO.h"

@implementation DAO

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


+(DAO*) sharedDAO {
    static DAO *_sharedDAO = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedDAO = [[DAO alloc] init];
    });
    return _sharedDAO;
}

-(instancetype) init {
    
    if (self = [super init]) {
        [self initCompaniesAndProducts];
        return self;
    }
    else return nil;
}


-(void)initCompaniesAndProducts {
    
    // Init all array properties
    self.companies = [[NSMutableArray alloc]init];
    self.products = [[NSMutableArray alloc]init];
    self.companyResults = [[NSArray alloc]init];
    self.productResults = [[NSArray alloc]init];
    
    // Fetch Company and Product data from Core Data
    [self fetchCompanyData];
    [self fetchProductData];
    
    // If there is no Company data, init, save, and fetch Companies
    if (self.companyResults.count == 0) {
        
        Company *apple = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
        apple.name = @"Apple";
        apple.companyID = @1;
        apple.symbol = @"AAPL";
        apple.logo = @"applelogo";
        
        Company *google = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
        google.name = @"Google";
        google.companyID = @2;
        google.symbol = @"GOOG";
        google.logo = @"googlelogo";
        
        Company *amazon = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
        amazon.name = @"Amazon";
        amazon.companyID = @3;
        amazon.symbol = @"AMZN";
        amazon.logo = @"AmazonLogo";
        
        Company *samsung = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
        samsung.name = @"Samsung";
        samsung.companyID = @4;
        samsung.symbol = @"SSNLF";
        samsung.logo = @"SamsungLogo";
        
        [self saveContext];
        [self fetchCompanyData];
        
        if (self.productResults.count ==  0) {
            
            // Apple products
            Product *iPhone = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            iPhone.name = @"iPhone";
            iPhone.companyID = @1;
            iPhone.productPic = @"iPhonePic";
            iPhone.productURL = @"http://www.apple.com/iphone/";
            
            Product *iPad = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            iPad.name = @"iPad";
            iPad.companyID = @1;
            iPad.productPic = @"ipadpic";
            iPad.productURL = @"http://www.apple.com/ipad/";
            
            Product *iPodTouch = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            iPodTouch.name = @"iPod Touch";
            iPodTouch.companyID = @1;
            iPodTouch.productPic = @"ipodtouchpic";
            iPodTouch.productURL = @"http://www.apple.com/ipod-touch/";
            
            
            // Google products
            Product *nexus9 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            nexus9.name = @"Nexus 9";
            nexus9.companyID = @2;
            nexus9.productPic = @"nexus9pic";
            nexus9.productURL = @"http://www.google.com/nexus/9/";
            
            Product *nexus6 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            nexus6.name = @"Nexus 6";
            nexus6.companyID = @2;
            nexus6.productPic = @"nexus6pic";
            nexus6.productURL = @"http://www.google.com/nexus/6/";
            
            Product *nexus5 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            nexus5.name = @"Nexus 5";
            nexus5.companyID = @2;
            nexus5.productPic = @"nexus5pic";
            nexus5.productURL = @"http://www.google.com/nexus/5/";
            
            
            // Amazon products
            Product *kindleFireHDX = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            kindleFireHDX.name = @"Kindle Fire HDX";
            kindleFireHDX.companyID = @3;
            kindleFireHDX.productPic = @"kindlefirehdxpic";
            kindleFireHDX.productURL = @"http://www.amazon.com/dp/B00BWYQ9YE/ref=fs_ft";
            
            Product *kindleFireHDXKidsEdition = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            kindleFireHDXKidsEdition.name = @"Kindle Fire HDX Kids Edition";
            kindleFireHDXKidsEdition.companyID = @3;
            kindleFireHDXKidsEdition.productPic = @"kindlekidseditionpic";
            kindleFireHDXKidsEdition.productURL = @"http://www.amazon.com/dp/B00LOR524M/ref=fs_ket";
            
            Product *firePhone = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            firePhone.name = @"Fire Phone";
            firePhone.companyID = @3;
            firePhone.productPic = @"firephonepic";
            firePhone.productURL = @"http://www.amazon.com/dp/B00OC0USA6?_encoding=UTF8&showFS=1";
            
            
            // Samsung products
            Product *galaxyS6 = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            galaxyS6.name = @"Galaxy S6";
            galaxyS6.companyID = @4;
            galaxyS6.productPic = @"galaxys6pic";
            galaxyS6.productURL = @"http://www.samsung.com/us/explore/galaxy-s-6-features-and-specs/";
            
            Product *galaxyNote = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            galaxyNote.name = @"Galaxy Note";
            galaxyNote.companyID = @4;
            galaxyNote.productPic = @"galaxynotepic";
            galaxyNote.productURL = @"http://www.samsung.com/us/explore/galaxy-note-4-features-and-specs/";
            
            Product *galaxyTab = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
            galaxyTab.name = @"Galaxy Tab";
            galaxyTab.companyID = @4;
            galaxyTab.productPic = @"galaxytabpic";
            galaxyTab.productURL = @"http://www.samsung.com/us/explore/Tab-A-features";
            
            
            [samsung setValue:[NSSet setWithObjects:galaxyS6, galaxyTab, galaxyNote, nil] forKey:@"products"];
            
            [self saveContext];
            [self fetchProductData];
        }

    }
    
    
    // If there is no Product data, init, save, and fetch Products
    
    
    //Assign Companies from Core Data to NSObjectCompanies and plop them into self.companies
    for (int i = 0; i < self.companyResults.count; i++) {
        NSObjectCompany *company = [[NSObjectCompany alloc]init];
        company.name = [self.companyResults[i] name];
        company.companyID = [self.companyResults[i] companyID];
        company.symbol = [self.companyResults[i] symbol];
        company.logo = [self.companyResults[i] logo];
        
        company.products = [[NSMutableArray alloc]init];
        
        for (int j = 0; j < self.productResults.count; j++) {
            if ([[self.productResults objectAtIndex:j] companyID] == company.companyID) {
                NSObjectProduct *product = [[NSObjectProduct alloc]init];
                product.name = [self.productResults[j] name];
                product.companyID = [self.productResults[j] companyID];
                product.productPic = [self.productResults[j] productPic];
                product.productURL = [self.productResults[j] productURL];
                
                [company.products addObject:product];
                [product release];
            }
        }
        
        [self.companies addObject:company];
        [company release];
    }
}

-(void) fetchCompanyData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    // Alphabetize results
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    
    self.companyResults = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    [fetchRequest release];
    [sortDescriptor release];
}

-(void)fetchProductData {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entity];
    
    // Alphabetize results
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    
    self.productResults = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
    [fetchRequest release];
    [sortDescriptor release];
}

- (void) downloadStocksAndCallSelector:(SEL) method onObject:(id) object {
    
    for (NSObjectCompany *company in self.companies) {
        
        NSURL *stocksURL =[NSURL URLWithString: [NSString stringWithFormat: @"http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,%@&f=l1&e=.csv", company.symbol]];
        
        NSURLSessionDataTask *downloadTask =
        [[NSURLSession sharedSession]
         dataTaskWithURL:stocksURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
             // 4: Handle response here
             NSString *stockString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
             NSArray *stockPrices = [stockString componentsSeparatedByString:@"\n"];
             company.stockPrice = stockPrices[1];
             
             
             // dispatch_async... forces the method to be called on main thread, otherwise it's called on the background thread where NSURLSession block is running. Without forcing the performSelector method to the main thread, there is a significant delay between the qcdViewcontroller appearing (on the main thread) and the stock prices reflecting in the view (because it's otherwise running on a background thread)
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [object performSelector: method];
             });
             
             // 3
             [stockString release];
         }];
        [downloadTask resume];
    }
}


-(void) deleteCompany:(NSObjectCompany*) company {
    
    // Delete from DAO arrays
    [company.products removeAllObjects];
    [self.companies removeObject:company];
    
    // Delete from Core Data (looping and checking for name equivalency)
    //    for (int i = 0; i < self.companyResults.count; i++) {
    //        if ([[self.companyResults[i] name] isEqualToString:company.name] ) {
    //            [self.managedObjectContext deleteObject: self.companyResults[i]];
    //            break;
    //        }
    //    }
    
    // Delete from Core Data (using NSPredicate)
    NSPredicate *companyNamePredicate = [NSPredicate predicateWithFormat:@"name = %@", company.name];
    
    [self.managedObjectContext deleteObject: [[self.companyResults filteredArrayUsingPredicate:companyNamePredicate]objectAtIndex:0]];
    
    [self saveContext];
}

-(void) deleteProduct:(NSObjectProduct*) product {
    
    // Delete from DAO arrays
    [self.products removeObject:product];
    
    for (int i = 0; i < [self.companies count]; i++){
        if ([product.companyID integerValue] == i) {
            [[self.companies[i] products] removeObject:product];
        }
    }
    
    // Delete from Core Data (looping and checking name equivalency)
    //    for (int i = 0; i < self.productResults.count; i++) {
    //        if ([[self.productResults[i] name] isEqualToString:product.name] ) {
    //            [self.managedObjectContext deleteObject: self.productResults[i]];
    //            break;
    //        }
    //    }
    
    
    // Delete from Core Data (using NSPredicate)
    NSPredicate *productNamePredicate = [NSPredicate predicateWithFormat:@"name = %@", product.name];
    
    [self.managedObjectContext deleteObject: [[self.productResults filteredArrayUsingPredicate:productNamePredicate]objectAtIndex:0]];
    
    [self saveContext];
}

#pragma mark - Core Data stack

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "self.edu.CoreDataPractice" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Model.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
